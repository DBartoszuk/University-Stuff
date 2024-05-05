<?php

class UserManager {
    function loginForm() {
        $text = '<h3 id="form_tekst">Formularz logowania</h3>
        <div id="form_container">
            <form action="/PROJEKT/index.php?strona=loteria" method="post">
                <div class="nieparzysty">
                    <label class="form_ele" for="login">Login:</label>
                    <input class="form_ele" type="text" id="login" name="userName">
                <div>
                <div class="parzysty">
                    <label class="form_ele" for="haslo">Hasło:</label>
                    <input class="form_ele" type="password" id="haslo" name="passwd">
                </div>
                <div class="nieparzysty">
                    <input class="form_ele przycisk" type="submit" value="Zaloguj" name="zaloguj">
                    <input class="form_ele przycisk" type="reset" value="Anuluj">
                </div>
            </form>
        </div>';
        return $text;
    }
    function login($db) {
        //funkcja sprawdza poprawność logowania 
        //wynik - id użytkownika zalogowanego lub -1
        $args = [
            'userName' => FILTER_SANITIZE_ADD_SLASHES,
            'passwd' => FILTER_SANITIZE_ADD_SLASHES
        ];
        //przefiltruj dane z GET (lub z POST) zgodnie z ustawionymi w $args filtrami:
        $dane = filter_input_array(INPUT_POST, $args);
        //sprawdź czy użytkownik o loginie istnieje w tabeli users 
        //i czy podane hasło jest poprawne
        $login = $dane["userName"];
        $passwd = $dane["passwd"];
        $userId = $db->selectUser($login, $passwd, "users");
        if($userId >= 0){ //Poprawne dane
            //rozpocznij sesję zalogowanego użytkownika
            //usuń wszystkie wpisy historyczne dla użytkownika o $userId
            //ustaw datę - format("Y-m-d H:i:s");
            //pobierz id sesji i dodaj wpis do tabeli logged_in_users
            $db->delete("DELETE from logged_in_users WHERE userId=$userId;"); //usuniecie starego wpisu do tabeli zalogowanych
            session_start();
            $idSesji = session_id();
            setcookie(session_id(), "", time() - 3600);
            unset($_SESSION['id']); //wyzerowanie i zakonczenie sesji
            session_destroy();
            $lastUpdate = new DateTime();
            $lastUpdate = $lastUpdate->format("Y-m-d H:i:s"); //pobranie daty
            $db->insert("INSERT INTO logged_in_users VALUES ('$idSesji','$userId','$lastUpdate');");
        }
        return $userId;
    }
    function logout($db){
        //pobierz id bieżącej sesji (pamiętaj o session_start()
        //usuń sesję (łącznie z ciasteczkiem sesyjnym)
        //usuń wpis z id bieżącej sesji z tabeli logged_in_users
        session_start();    //rozpoczecie sesji
        $idSesji = session_id();    //pobranie id
        setcookie (session_id(), "", time() - 3600);
        unset($_SESSION['id']); //wyzerowanie i zakonczenie sesji
        session_destroy();
        if($db->delete("DELETE from logged_in_users WHERE sessionId='$idSesji';")){
            echo "<h6>Uzytwkonik wylogowany</h6>";
	}
    }
    function getLoggedInUser($db, $sessionId){
        //wynik $userId - znaleziono wpis z id sesji w tabeli logged_in_users 
        //wynik -1 - nie ma wpisu dla tego id sesji w tabeli logged_in_users 
        /*$sqli = $db->getMysqli();
        $result = $sqli->query("select * from logged_in_users where sessionId = '$sessionId'");
        $row = $result->fetch_object();
        $id = $row->userId;
	if($id!=null){
            return $id;
	}
	else{
            return -1;
	}*/
        $sql = "select userId from logged_in_users where sessionId = '$sessionId'";
        $result = $db->selectCode($sql);
        if (!empty($result)) {
            return $result[0]['userId'];    //pobranie zwóconego konta (pierwszy i jedyny wiersz) i id z kolumny 'userId'
        } else {
            return -1;
        }
    }
}
