<?php
    $tytul = "Loteria";
    $zawartosc='<div id="form_tresc">
			<p id="form_intro">
				Na świecie jest mnóstwo osób, których miłość do japońskich ogrodów dorównuje naszej. Jesteśmy niezmiernie wdzięczni za wsparcie, które otrzymujemy od osób odwiedzających naszą stronę. Dzięki niemu możemy kontynuować realizację naszej pasji.<br>Aby podziękować Wam za Wasze zaangażowanie, od ponad roku organizujemy na naszej stronie co miesiąc ekscytującą loterię, w której macie szansę wygrać unikalne akcesoria związane z japońskimi ogrodami.
				Wystarczy wypełnić poniższy formularz, aby wziąć w niej udział. Każdy kto się na to zdecyduje ma równe szanse na sukces.<br>
				Nie czekajcie dłużej! Dołączcie do naszej społeczności miłośników japońskich ogrodów i korzystajcie z okazji na wygranie nagrody.
			</p>';
    
    include_once 'klasy/Baza.php';
    include_once 'klasy/User.php';
    include_once 'klasy/UserManager.php';
    include_once 'klasy/RegistrationForm.php';
    $db = new Baza("localhost", "root", "", "klienci");
    $um = new UserManager();
    session_start();
    $idSesji = session_id();
    $userId = $db->select("select userId from logged_in_users where sessionId = '$idSesji'", ["userId"]);
    //Warunek sprawdza czy w tabeli zalogowanych uzytkownikow jest faktycznie wpis
    //Dla pustej tabeli metoda select zwroci ponizszy string
    if($userId !== "<table><tbody></tbody></table>"){
        $id = $um->getLoggedInUser($db, $idSesji);
        if($id == -1){
            $zawartosc .= "Błąd!";
        }
        else{   //użytkownik jest zalogowany
            $zamowienie = $db->select("select * from loteria where userId = '$id'", ["userId", "sessionId"]);
            $dane = $db->selectCode("select userName from users where id = '$id'");
            $zawartosc .= '<p id="form_tekst">Zalogowano jako '.$dane[0]['userName'].'</p>';
            $zawartosc .= '<br><a href="/PROJEKT/index.php?strona=loteria&akcja=wyloguj" id="galButt" >Wyloguj się</a><br><br>';
            unset($_SESSION['id']); //wyzerowanie i zakonczenie sesji
            session_destroy();       
            if($zamowienie == "<table><tbody></tbody></table>"){
                $zawartosc .= '<div id="form_container">
                                    <form action="/PROJEKT/index.php?strona=loteria" method="post" id="loteria">
                                            <div class="nieparzysty" id="zgoda_check">';
                //<!-- Label pozwala zaznaczyć checkbox klikając na jego tekst-->
                $zawartosc .= '<label for="zgoda">Wyrażam zgodę na przechowywanie danych zamieszczonych w poniższym formularzu.</label>
                                                <input type="checkbox" required id="zgoda">
                                            </div>';
                //Korzystanie z klas parzysty i nieparzysty w celu stylizacji
                $zawartosc .= '<div class="parzysty">
                                                    Na początek prosimy wybrać interesujący Cię produkt (można wybrać tylko jeden). Produkt ten zostanie do Ciebie wysłany w razie wygrania loterii.<br>
                                                    <label class="form_ele" for="produkty">Dostępne produkty: </label>
                                                    <select class="form_ele" name="produkty" id="produkty">
                                                            <option value="p1">Plakat "Piękno Japonii"</option>
                                                            <option value="p2">Plakat "Sześć Wznisłości"</option>
                                                            <option value="p3">Książka "Historia Japońskich Ogrodów"</option>
                                                            <option value="p4" selected>Książka "Japońskie Ogrody: Co, jak i dlaczego"</option>
                                                            <option value="p5">Książka "Poradnik Ogrodnika: Jak dbać o bambusa"</option>
                                                            <option value="p6">Album ze zdjęciami "Kenroku-en Wiosną"</option>
                                                            <option value="p7">Miniaturowy model japońskiego ogrodu</option>
                                                            <option value="p8">Figurka kwitnącej wiśnii</option>
                                                    </select>
                                            </div>
                                            <div class="nieparzysty">
                                                    <label class="form_ele" for="imie">Imię*:</label>
                                                    <input class="form_ele" required name="imie" type="text" id="imie" placeholder="Jan" pattern="^[a-zA-ZąćęłńóśżźĄĆĘŁŃÓŚŻŹ]{2,50}$" title="Imię nie może zawierać żadnych znaków innych niż litery">';
                //Title wyświetla się po najechaniu na element myszką, placeholder pokazuje użytkownikowi mniej-więcej co należy wpisać
                $zawartosc .= '</div>
                                            <div class="parzysty">
                                                    <label class="form_ele" for="nazwisko">Nazwisko*:</label>
                                                    <input class="form_ele" required name="nazwisko" type="text" id="nazwisko" pattern="^[a-zA-ZąćęłńóśżźĄĆĘŁŃÓŚŻŹ]{2,50}$" placeholder="Kowalski" title="Nazwisko nie może zawierać żadnych znaków innych niż litery">
                                            </div>
                                            <div class="nieparzysty">
                                                    <label class="form_ele" for="email">Email*:</label>
                                                    <input class="form_ele" required name="email" type="email" id="email" pattern="^(([\w_]+)-*\.?)+@[\w](([\w]+)-?_?\.?)+([a-z]{2,4})$" placeholder="nazwa@domena" title="Email musi zawierać @">
                                            </div>
                                            <div class="parzysty">
                                                    <p class="form_ele">Sposób dostawy ewentualnej nagrody*:</p>
                                                    <div class="form_ele">
                                                            <label for="radio1">Kurier:</label><input type="radio" class="dostawa" name="dostawa" value="kurier" id="radio1" checked>
                                                            <label for="radio2">Paczkomat:</label><input type="radio" class="dostawa" name="dostawa" value="paczkomat" id="radio2"> 
                                                            <label for="radio3">Poczta:</label><input type="radio" class="dostawa" name="dostawa" value="poczta" id="radio3">';
                //Jako, że to elementy radio, to muszą mieć taką samą wartość atrybutu name
                $zawartosc .= '</div>
                                            </div>
                                            <div class="nieparzysty">
                                                    <p>Adres zamieszkania:<br>(Na jego podstawie dostosujemy powyżej wybraną opcję dostawy)</p>
                                                    <label class="form_ele" for="miasto">Miejscowość*</label>
                                                    <input class="form_ele" required name="miasto" type="text" id="miasto" pattern="^[A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ][A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ\s]+$" placeholder="Lublin" title="Wpisz miejscowosc">
                                            </div>
                                            <div class="parzysty">
                                                    <label class="form_ele" for="kod">Kod pocztowy*</label>
                                                    <input class="form_ele" required name="kod" type="text" id="kod" pattern="[0-9]{2}-[0-9]{3}" placeholder="20-007" title="Kod pocztowy xx-xxx">
                                            </div>
                                            <div class="nieparzysty">
                                                    <label class="form_ele" for="ulica">Ulica*</label>
                                                    <input class="form_ele" required name="ulica" type="text" id="ulica" pattern="^([uU]l\.|ul\.)\s([A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ][A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ\s]+)$" placeholder="ul. Nadbystrzycka" title="Musi zawierać ul. na początku">
                                            </div>
                                            <div class="parzysty">
                                                    <label class="form_ele" for="numer">Numer bloku*/numer lokalu</label>
                                                    <input class="form_ele" required name="numer" type="text" id="numer" pattern="^([1-9][0-9]*)(\/[1-9][0-9]*)?" placeholder="20/4" title="Numer lokalu opcjonalny">
                                            </div>';
                $zawartosc .= '<div class="nieparzysty">
                                                    <input type="submit" class="form_ele przycisk" name="zapisz" value="Zapisz">
                                                    <input type="reset" class="form_ele przycisk" value="Anuluj">
                                            </div>';
                //Elementom html można przypisać wiele klas, oddzielając je spacją
                $zawartosc .= '</form>
                            </div>
                    </div>';

                //OBSŁUGA FORMULARZA
                if(filter_input(INPUT_POST, 'zapisz')){
                    $args = [
                        'nazwisko' => ['filter' => FILTER_VALIDATE_REGEXP,
                            'options' => ['regexp' => '/^[a-zA-ZąćęłńóśżźĄĆĘŁŃÓŚŻŹ]{2,50}$/']],
                        'imie' => ['filter' => FILTER_VALIDATE_REGEXP,
                            'options' => ['regexp' => '/^[a-zA-ZąćęłńóśżźĄĆĘŁŃÓŚŻŹ]{2,50}$/']],
                        'email' => FILTER_VALIDATE_EMAIL,
                        'miasto' => ['filter' => FILTER_VALIDATE_REGEXP,
                            'options' => ['regexp' => '/^[A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ][A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ\s]+$/']],
                        'kod' => ['filter' => FILTER_VALIDATE_REGEXP,
                            'options' => ['regexp' => '/[0-9]{2}-[0-9]{3}/']],
                        'ulica' => ['filter' => FILTER_VALIDATE_REGEXP,
                            'options' => ['regexp' => '/^^([uU]l\.|ul\.)\s([A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ][A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ\s]+)$/']],
                        'numer' => ['filter' => FILTER_VALIDATE_REGEXP,
                            'options' => ['regexp' => '/^([1-9][0-9]*)(\/[1-9][0-9]*)?/']],
                        'produkty' => FILTER_DEFAULT,
                        'dostawa' => FILTER_DEFAULT
                    ];
                    //przefiltruj dane z GET/POST zgodnie z ustawionymi w $args filtrami:
                    $dane_loteria = filter_input_array(INPUT_POST, $args);
                    $errors = "";
                    foreach ($dane_loteria as $key => $val) {
                        if ($val === false or $val === NULL) {
                            $errors .= $key . " ";
                        }
                    }
                    if ($errors == ""){
                        foreach($dane_loteria as $key => $value) {
                            $zawartosc .= "dane parameter '$key' has '$value'<br>";
                        }
                        $db->insert("INSERT INTO loteria VALUES ('$idSesji', '$id', '{$dane_loteria['imie']}','{$dane_loteria['nazwisko']}', '{$dane_loteria['email']}', '{$dane_loteria['produkty']}', '{$dane_loteria['dostawa']}', '{$dane_loteria['miasto']}', '{$dane_loteria['kod']}', '{$dane_loteria['ulica']}', '{$dane_loteria['numer']}');");
                    } 
                    else {
                        $zawartosc .= '<p id="form_tekst">Błędne dane: '.$errors.'</p>';
                    }
                }
            }
            else{
                $zawartosc .= '<p id="form_tekst">Użytkownik '.$dane[0]['userName'].' już wziął udział w loterii</p>';
            }
        }
    }
    else{
        //pierwsze uruchomienie skryptu loginProcess
        $zawartosc .= '<h4 id="form_tekst">Zaloguj się, aby mieć dostęp do loterii</h4>
                <table id="logreg">
                    <tr>
                        <td class="parzysty"><b>Masz konto?</b></td>
                        <td class="parzysty"><b>Nie masz konta?</b></td>
                    </tr>
                    <tr>
                        <td class="nieparzysty"><a href="/PROJEKT/index.php?strona=loteria&przycisk=1" id="galButt" class="galeriaInner">Zaloguj się</a></td>
                        <td class="nieparzysty"><a href="/PROJEKT/index.php?strona=loteria&przycisk=2" id="galButt" class="galeriaInner">Zarejestruj się</a></td>
                    </tr>
                </table>';
        //$zawartosc = $um->loginForm();
    }

    $zawartosc .= '</div>';
    
    //OBSŁUGA PRZYCISKÓW
    
    if(filter_input(INPUT_GET, 'przycisk')){
        if(filter_input(INPUT_GET, 'przycisk') == 1){
            $zawartosc = $um->loginForm();
            if(filter_input(INPUT_GET, 'info') == 1){
                $zawartosc .= '<p id="form_tekst">Poprawne dane rejestracji<br>Proszę się zalogować</p>';
            }
        }
        else if(filter_input(INPUT_GET, 'przycisk') == 2){
            $rf = new RegistrationForm(); 
            $zawartosc = $rf->wyswietlForm();   //wyświetla formularz rejestracji
            if (filter_input(INPUT_POST, 'submit', FILTER_SANITIZE_FULL_SPECIAL_CHARS)){
                $wynik = $rf->checkUser(); //sprawdza poprawność danych
                $user = $wynik[0];
                if ($user === NULL){
                    $zawartosc .= '<p id="form_tekst">Niepoprawne dane rejestracji.</p>';
                    $zawartosc .= '<p id="form_tekst">'.$wynik[1].'</p>';
                }
                else{
                    if($user->saveDB($db)){
                        header("location: /PROJEKT/index.php?strona=loteria&przycisk=1&info=1");
                    }
                    else{
                        $zawartosc .= '<p id="form_tekst">Użytkownik z taką nazwą i adresem email już istnieje.</p>';
                    }
                }
            }
        }
        else{
            header("location: /PROJEKT/index.php?strona=loteria");
        }
    }
    
    //parametr z GET – akcja = wyloguj
    if(filter_input(INPUT_GET, "akcja")=="wyloguj"){
        $um->logout($db);   //wylogowanie
        header("location: /PROJEKT/index.php?strona=loteria");  //powrót na stronę loterii
    }
    //kliknięto przycisk submit z name = zaloguj
    if(filter_input(INPUT_POST, "zaloguj")){
        $userId = $um->login($db); //sprawdź parametry logowania
        if($userId > 0){
            //Powrót na podstawową stronę loterii
            header("location: /PROJEKT/index.php?strona=loteria");
        }
        else{
            $zawartosc =  '<p id="form_tekst">Błędna nazwa użytkownika lub hasło</p>';
            $zawartosc .= $um->loginForm(); //Pokaż formularz logowania 
        }
    }
    
    
    /*//parametr z GET – akcja = wyloguj
    if(filter_input(INPUT_GET, "akcja")=="wyloguj"){
        $um->logout($db);
    }
    //kliknięto przycisk submit z name = zaloguj
    if(filter_input(INPUT_POST, "zaloguj")){
        $userId = $um->login($db); //sprawdź parametry logowania
        if($userId > 0){
            echo "<p>Poprawne logowanie.<br>";
            echo "Zalogowany użytkownik o id=$userId <br>";
            //Przekierowanie na stronę dla zalogowanych użytkowników
            header("location: testLogin.php");
            //exit(), aby upewnić się, że dalsza część skryptu nie zostanie wykonana
            exit();
        }
        else{
            echo "<p>Błędna nazwa użytkownika lub hasło</p>";
            $zawartosc = $um->loginForm(); //Pokaż formularz logowania 
        }
    }*/
    /*kod pounset(...); session_destroy();
             * $zawartosc .= '<div id="form_container">
				<form action="/PROJEKT/index.php?strona=loteria" method="post" id="loteria">
					<div class="nieparzysty" id="zgoda_check">';
            //<!-- Label pozwala zaznaczyć checkbox klikając na jego tekst-->
            $zawartosc .= '<label for="zgoda">Wyrażam zgodę na przechowywanie danych zamieszczonych w poniższym formularzu.</label>
                                            <input type="checkbox" required id="zgoda">
                                        </div>';
            //Korzystanie z klas parzysty i nieparzysty w celu stylizacji
            $zawartosc .= '<div class="parzysty">
						Na początek prosimy wybrać interesujący Cię produkt (można wybrać tylko jeden). Produkt ten zostanie do Ciebie wysłany w razie wygrania loterii.<br>
						<label class="form_ele" for="produkty">Dostępne produkty: </label>
						<select class="form_ele" name="produkty" id="produkty">
							<option value="p1">Plakat "Piękno Japonii"</option>
							<option value="p2">Plakat "Sześć Wznisłości"</option>
							<option value="p3">Książka "Historia Japońskich Ogrodów"</option>
							<option value="p4" selected>Książka "Japońskie Ogrody: Co, jak i dlaczego"</option>
							<option value="p5">Książka "Poradnik Ogrodnika: Jak dbać o bambusa"</option>
							<option value="p6">Album ze zdjęciami "Kenroku-en Wiosną"</option>
							<option value="p7">Miniaturowy model japońskiego ogrodu</option>
							<option value="p8">Figurka kwitnącej wiśnii</option>
						</select>
					</div>
					<div class="nieparzysty">
						<label class="form_ele" for="imie">Imię*:</label>
						<input class="form_ele" required type="text" id="imie" placeholder="Jan" pattern="^[a-zA-ZąćęłńóśżźĄĆĘŁŃÓŚŻŹ]{2,50}$" title="Imię nie może zawierać żadnych znaków innych niż litery">';
            //Title wyświetla się po najechaniu na element myszką, placeholder pokazuje użytkownikowi mniej-więcej co należy wpisać
            $zawartosc .= '</div>
					<div class="parzysty">
						<label class="form_ele" for="nazwisko">Nazwisko*:</label>
						<input class="form_ele" required type="text" id="nazwisko" pattern="^[a-zA-ZąćęłńóśżźĄĆĘŁŃÓŚŻŹ]{2,50}$" placeholder="Kowalski" title="Nazwisko nie może zawierać żadnych znaków innych niż litery">
					</div>
					<div class="nieparzysty">
						<label class="form_ele" for="email">Email*:</label>
						<input class="form_ele" required type="email" id="email" pattern="^(([\w_]+)-*\.?)+@[\w](([\w]+)-?_?\.?)+([a-z]{2,4})$" placeholder="nazwa@domena" title="Email musi zawierać @">
					</div>
					<div class="parzysty">
						<p class="form_ele">Sposób dostawy ewentualnej nagrody*:</p>
						<div class="form_ele">
							<label for="radio1">Kurier:</label><input type="radio" class="dostawa" name="dostawa" value="kurier" id="radio1" checked>
							<label for="radio2">Paczkomat:</label><input type="radio" class="dostawa" name="dostawa" value="paczkomat" id="radio2"> 
							<label for="radio3">Poczta:</label><input type="radio" class="dostawa" name="dostawa" value="poczta" id="radio3">';
            //Jako, że to elementy radio, to muszą mieć taką samą wartość atrybutu name
            $zawartosc .= '</div>
					</div>
					<div class="nieparzysty">
                                                <p>Adres zamieszkania:<br>(Na jego podstawie dostosujemy powyżej wybraną opcję dostawy)</p>
						<label class="form_ele" for="miasto">Miejscowość*</label>
						<input class="form_ele" required type="text" id="miasto" pattern="^[A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ][A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ\s]+$" placeholder="Lublin" title="Wpisz miejscowosc">
					</div>
					<div class="parzysty">
                                                <label class="form_ele" for="kod">Kod pocztowy*</label>
						<input class="form_ele" required type="text" id="kod" pattern="[0-9]{2}-[0-9]{3}" placeholder="20-007" title="Kod pocztowy xx-xxx">
                                        </div>
                                        <div class="nieparzysty">
                                                <label class="form_ele" for="ulica">Ulica*</label>
						<input class="form_ele" required type="text" id="ulica" pattern="^((u|U)l\.)\s([A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ][A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ\s]+$" placeholder="ul. Nadbystrzycka" title="Musi zawierać ul. na początku">
                                        </div>
                                        <div class="parzysty">
                                                <label class="form_ele" for="numer">Numer blokunumer lokalu</label>
						<input class="form_ele" required type="text" id="numer" pattern="^([1-9][0-9]*)(\/[1-9][0-9]*)?" placeholder="20/4" title="Numer lokalu opcjonalny">
                                        </div>';
            $zawartosc .= '<div class="nieparzysty">
						<input type="submit" class="form_ele przycisk" name="zapisz" value="Zapisz">
						<input type="reset" class="form_ele przycisk" value="Anuluj">
					</div>';
            //Elementom html można przypisać wiele klas, oddzielając je spacją
            $zawartosc .= '</form>
			</div>
		</div>';*/