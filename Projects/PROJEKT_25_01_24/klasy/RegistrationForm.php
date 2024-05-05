<?php

class RegistrationForm {
    protected $user;
    
    function wyswietlForm(){
            $text = '<h3 id="form_tekst">Formularz rejestracji</h3>
                <div id="form_container">
                <form action="/PROJEKT/index.php?strona=loteria&przycisk=2" method="post">
                    <div class="nieparzysty">
                        <label class="form_ele" for="nazwa">Nazwa użytkownika:</label>
                        <input class="form_ele" type="text" id="nazwa" name="userName" size="25"><br>
                    </div>
                    <div class="parzysty">    
                        <label class="form_ele" for="imie_nazwisko">Imię i nazwisko:</label>
                        <input class="form_ele" type="text" id="imie_nazwisko" name="fullName"><br>
                    </div>
                    <div class="nieparzysty">
                        <label class="form_ele" for="haslo">Hasło:</label>
                        <input class="form_ele" type="password" id="haslo" name="passwd"><br>
                    </div>
                    <div class="parzysty">
                        <label class="form_ele" for="email">Email:</label>
                        <input class="form_ele" type="email" id="email" name="email"><br>
                    </div>
                    <div class="nieparzysty">
                        <input class="form_ele przycisk" type="submit" name="submit" value="Rejestruj">
                        <input class="form_ele przycisk" type="reset" name="reset" value="Anuluj">
                    </div>
                </form>
            </div>';
            return $text;
    }
    function checkUser(){
        $args = [
            'userName' => ['filter' => FILTER_VALIDATE_REGEXP,
                'options' => ['regexp' => '/^[0-9A-Za-ząęłńśćźżó_-]{2,25}$/']],
            'email' => FILTER_VALIDATE_EMAIL,
            'fullName' => ['filter' => FILTER_VALIDATE_REGEXP,
                'options' => ['regexp' => '/^[A-Z][a-ząęśćżźłóń]{2,20} [A-Z][a-ząęśćżźłóń]{2,50}$/']],
            'passwd' => ['filter' => FILTER_VALIDATE_REGEXP,
                'options' => ['regexp' => '/^[0-9A-Za-ząęłńśćźżó_\-@\?#$%\^\&\*]{8,25}$/']]
        ];
        //przefiltruj dane:
        $dane = filter_input_array(INPUT_POST, $args);
        $errors = "";
        $tekst = "";
        foreach ($dane as $key => $val) {
            if ($val === false or $val === NULL) {
                $errors .= $key . " ";
            }
        }
        if ($errors === "") {
            //Dane poprawne – utwórz obiekt user
            $this->user=new User($dane['userName'], $dane['fullName'],
                $dane['email'],$dane['passwd']);
        }
        else {
            $tekst =  "Błędne dane:";
            $tab_pom = array("userName"=>"Nazwa użytkownika", "fullName"=>"Imię i nazwisko", "passwd"=>"Hasło", "email"=>"Adres email");
            foreach($tab_pom as $k=>$v){
                if(strpos($errors, $k) !== false){
                    $tekst .= "<br>$v";
                }
            }
            $this->user = NULL;
        }
        return [$this->user, $tekst];
    }
}

