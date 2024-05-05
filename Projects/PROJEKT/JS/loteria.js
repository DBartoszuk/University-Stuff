		/*DOTYCZACE MENU*/
/* Dodanie klasy do elementu z id="menu", na potrzeby CSS */
function zmienKlase() {
  var x = document.getElementById("menu");
  if (x.className === "menu") {		//potrójny znak równości sprawdza czy a jest równe b i w typie i w wartości
    x.className += " responsive";
  } else {
    x.className = "menu";
  }
}

		/*DOTYCZĄCE SKLEPU*/
		
/* Funkcja sprawdza czy już nie uzupełniono formularza*/
document.addEventListener("DOMContentLoaded", function() {	
	var zapis = JSON.parse(localStorage.getItem('udzial'));
	if(!(zapis === null)){
		wyswietlDane();		//Jeżeli formularz jest uzupełniony (czyli istnieje w localStorage) to go wyswietl
	}
	else return false;		//W przeciwnym wypadku załaduj normalnie stronę
});
		
function form_clear(){
	document.getElementById('loteria').reset();					//Reset czyści pola formularza o id 'loteria'
	var imie_error = document.getElementById("imie_box");		//Biorę elementy na ewentualne błędy z html
	var nazw_error = document.getElementById("nazw_box");
	var email_error = document.getElementById("email_box");
	var adres_error = document.getElementById("adres_box");
	var zgoda_error = document.getElementById("zgoda_box");
	imie_error.removeAttribute('style');						//Usuwam ich style, by już nie były widoczne
	imie_error.innerHTML="";									//oraz zawartość
	nazw_error.removeAttribute('style');
	nazw_error.innerHTML="";
	email_error.removeAttribute('style');
	email_error.innerHTML="";
	adres_error.removeAttribute('style');
	adres_error.innerHTML="";
	zgoda_error.removeAttribute('style');
	zgoda_error.innerHTML="";
}
		
function sprawdzPole(pole_id, obiektRegex){
		/*Funkcja sprawdza czy wartość wprowadzona do pola tekstowego
		pasuje do wzorca zdefiniowanego za pomocą wyrażenia regularnego
		Parametry funkcji:
		pole_id - id sprawdzanego pola tekstowego 
		obiektRegex - wyrażenie regularne*/
		
	var obiektPole = document.getElementById(pole_id);
	if(!obiektRegex.test(obiektPole.value)) return (false);
	else return (true);
}

function sprawdz_radio(nazwa_radio){
		/*Funkcja sprawdza czy wybrano przycisk radio
		z grupy przycisków o nazwie nazwa_radio
		przechdząc po kolei przez nie*/
	
	var obiekt = document.getElementsByName(nazwa_radio);
	var wybrany;
	for(i=0; i<obiekt.length; i++){
		wybrany = obiekt[i].checked;
		if(wybrany) return obiekt[i].value;
	}
}

function sprawdzCheckbox(check_id){
	if(document.getElementById(check_id).checked) return true;
	else return false;
}

	//Funkcja tworzy nowy wygląd strony i wyświetla informacje pobrane z localStorage
function wyswietlDane(){
	var dane = JSON.parse(localStorage.getItem('udzial'));	//Z local storage pobierana jest wartość o kluczu udzial i jest przekonwertowana na obiekt/tablicę JS
	if(dane === null){
		ups();
	}
	else{
		var tresc = document.getElementById('form_tresc');
		tresc.setAttribute('style', 'background: #ffb5f9; color: #381321; font-size: 17px;');
		tresc.innerHTML = "<p style='font-weight:bold; font-size:20px; background:#8bf0d5; border: solid 2px #573928;'>Formularz został wysłany.<br>Jego zawartość:</p>";
		tresc.innerHTML += "Imie: "+dane.imie+"<br>";
		tresc.innerHTML += "Nazwisko: "+dane.nazwisko+"<br>";
		tresc.innerHTML += "Email: "+dane.email+"<br>";
		tresc.innerHTML += "Adres: "+dane.adres+"<br>";
		tresc.innerHTML += "Wybrany produkt: "+dane.produkt+"<br>";
		tresc.innerHTML += "Sposób dostawy: "+dane.dostawa+"<br>";
		tresc.innerHTML += "<button type='button' class='form_ele przycisk' onclick='edytuj()'>Edytuj moje dane</button>";
		tresc.innerHTML += "<button type='button' class='form_ele przycisk' onclick='usun()' id='button_usun'>Usuń moją kandydaturę</button>";
	}
}

//Zapytaj o potwierdzenie, wyczysc localStorage i wyświetl domyślny formularz
function usun(){
	if(window.confirm("Na pewno chcesz usunąć swoje dane?\nTrzeba będzie potem od nowa uzupełniać formularz")){
		localStorage.clear();
		domyslnyForm();
	}
	
}

function edytuj(){
	domyslnyForm();
	var daneZeStorage = JSON.parse(localStorage.getItem('udzial'));			//Pobiera dane z localStorage i konwertuje ten ciąg na obiekt JS
	if(daneZeStorage===null){	//Jeżeli z jakiegoś powodu dane z localStorage zniknęły, poinformuj użytkownika i przejdź do domyślnej strony loterii
		ups();
	}
	else{
		document.getElementById('form_intro').innerHTML = "EDYCJA DANYCH";		/*To, aby strona z edycją nieco się różniła od domyślnej*/
		
		var imie = document.getElementById('imie');
		var nazwisko = document.getElementById('nazwisko');
		var email = document.getElementById('email');
		var adres = document.getElementById('adres');
		imie.value = daneZeStorage.imie;
		nazwisko.value = daneZeStorage.nazwisko;
		email.value = daneZeStorage.email;
		adres.value = daneZeStorage.adres;
		document.getElementById('zgoda').checked = true;	//Odgórnie zaznaczam checboxa 'zgoda'. Koniec końców bez jego zaznaczenia, użytkownik nie zapisałby swoich danych
		/*Przechodzenie po elementach radio, aż natrafię na taki, którego wartość odpowiada temu co było w localStorage
		Wtedy wiem jakie id wziąć i co zaznaczyć na stronie*/
		var obiekt = document.getElementsByName('dostawa');
		for(i=0; i<obiekt.length; i++){
			if(obiekt[i].value == daneZeStorage.dostawa) document.getElementById(obiekt[i].id).checked = true;	//Zaznaczenie w formularzu tej opcji, która była w localStorage
		}
		document.getElementById('produkty').selectedIndex = daneZeStorage.produktIndeks;	//Wybieram element o indeksie przechowanym w localStorage. SelectedIndex ustawia wybraną opcję
		document.getElementById('button_anuluj').onclick = function(){wyswietlDane()};		//Przycisk anuluj w edycji ma inną funkcję
	}
}
		
/*Funkcja sprawdza po kolei wszystkie pola tekstowe formularza wykorzystując funkcję pomocniczą i wyrażenia regularne*/
function sprawdz(){
	var ok = true; //zmienna informująca o poprawnym wypełnieniu formularza
		/*Definicje odpowiednich wyrażeń regularnych dla sprawdzenia poprawności danych wprowadzonych do pól tekstowych*/
	var imie_error = document.getElementById("imie_box");
	obiektImie = /^[a-zA-ZąćęłńóśżźĄĆĘŁŃÓŚŻŹ]{2,20}$/;
		//Wyrażenie regularne dla imienia
	var nazw_error = document.getElementById("nazw_box");
	obiektNazw = /^[a-zA-ZąćęłńóśżźĄĆĘŁŃÓŚŻŹ]{2,40}$/;
		//Wyrażenie dla nazwiska
	var email_error = document.getElementById("email_box");
	obiektEmail = /^(([\w_]+)-*\.?)+@[\w](([\w]+)-?_?\.?)+([a-z]{2,4})$/
		//Wyrazenie dla email, udostępnione przez panią dr
	var adres_error = document.getElementById("adres_box");
	obiektAdres = /^((u|U)l\.)\s([A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ][A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ\s]+)\s([1-9][0-9]*)(\/[1-9][0-9]*)?\s[0-9]{2}-[0-9]{3}\s([A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ][A-Za-ząćęłńóśżźĄĆĘŁŃÓŚŻŹ\s]+)$/;
		//Wyrażenie dla adresu pocztowego. Slash oddzielający nr.mieszkania/nr.lokalu musiałem poprzedzić backslashem tu w JS
	var zgoda_error = document.getElementById("zgoda_box");
	if(!sprawdzCheckbox('zgoda')){
		ok = false;
		zgoda_error.setAttribute('style', 'background:#e8291c; font:15px Georgia, serif; color:#090991; font-weight: bold;');
		zgoda_error.innerHTML = "Pole wymagane!";
	}
	else{
		zgoda_error.removeAttribute('style');
		zgoda_error.innerHTML="";
	}
	if(!sprawdzPole("imie", obiektImie)){
		ok = false;
		//Dodanie do elementu błędu stylów (by stał się widoczny) poprzez metodę setAttribute
		imie_error.setAttribute('style', 'background:#e8291c; font:15px Georgia, serif; color:#090991; font-weight: bold;');
		imie_error.innerHTML = "Upewnij się, że wpisano tylko jedno imię oraz, że nie zawiera spacji ani znaków specjalnych";
	}
	else{
		//usunięcie stylów (by dowód błędu znikł) poprzez removeAttribute
		imie_error.removeAttribute('style');
		imie_error.innerHTML="";
	}
	
	if(!sprawdzPole("nazwisko", obiektNazw)){
		ok = false;
		nazw_error.setAttribute('style', 'background:#e8291c; font:15px Georgia, serif; color:#090991; font-weight: bold;');
		nazw_error.innerHTML = "Upewnij się, że wpisano tylko jedno nazwisko oraz, że nie zawiera spacji ani znaków specjalnych";
	}
	else{
		nazw_error.removeAttribute('style');
		nazw_error.innerHTML="";
	}
	
	if(!sprawdzPole("email", obiektEmail)){
		ok = false;
		email_error.setAttribute('style', 'background:#e8291c; font:15px Georgia, serif; color:#090991; font-weight: bold;');
		email_error.innerHTML = "Niepoprawny email. Upewnij się, że nie zawera takich znaków jak / ?";
	}
	else{
		email_error.removeAttribute('style');
		email_error.innerHTML="";
	}
	
	if(!sprawdzPole("adres", obiektAdres)){
		ok = false;
		adres_error.setAttribute('style', 'background:#e8291c; font:15px Georgia, serif; color:#090991; font-weight: bold;');
		adres_error.innerHTML = "Upewnij się, że adres zaczyna się od 'ul.' oraz, że w kodzie pocztowym jest '-'";
	}
	else{
		adres_error.removeAttribute('style');
		adres_error.innerHTML="";
	}
	
	if(ok){
		var wybranyProdukt = document.getElementById('produkty');
		var wybranyRadio=sprawdz_radio("dostawa");
		var imie = document.getElementById('imie').value;
		var nazwisko = document.getElementById('nazwisko').value;
		var email = document.getElementById('email').value;
		var adres = document.getElementById('adres').value;
		var dane = "Dane z wypełnionego przez Ciebie formularza:\n";
		dane += "Imie: "+imie+"\n";
		dane += "Nazwisko: "+nazwisko+"\n";
		dane += "Email: "+email+"\n";
		dane += "Adres pocztowy: "+adres+"\n";
			//Wyłuskujemy z select'a wybraną opcję i za pomocą text, umieszczamy w localStorage jej widoczną wartość zamiast np. p1
		dane += "Wybrany produkt: "+wybranyProdukt.options[wybranyProdukt.selectedIndex].text+"\n";
		dane += "Sposób dostawy: "+wybranyRadio+"\n";
		if(window.confirm(dane)){
			var udzial={};			//utworzenie obiektu w którym będą przechowywane dane z formularza
			udzial.imie = imie;		//nadawanie mu atrybutów i ich wartości
			udzial.nazwisko = nazwisko;
			udzial.email = email;
			udzial.adres = adres;
			udzial.produktIndeks = wybranyProdukt.selectedIndex;
			udzial.produkt = wybranyProdukt.options[wybranyProdukt.selectedIndex].text;
			udzial.dostawa = wybranyRadio;
			localStorage.setItem('udzial', JSON.stringify(udzial));
				/*Do localStorage dodajemu przekonwertowany na ciąg JSON obiekt udzial, w którym są dane z formularza
				  Ponieważ dodajemy za każdym razem do tego samego klucza, to wartość w local storage się po prostu zmienia
				  Nie jest tworzony nowy element o takim samym kluczu, tak nie wolno*/
			wyswietlDane();
		}
		else return false;
	}
	else return false;
}

	//Funkcja usuwa style strony wyświetlającej dane i wstawia kod html z pliku loteria.html
function domyslnyForm(){
	var tresc = document.getElementById('form_tresc');
		tresc.removeAttribute('style');
		tresc.innerHTML = "<p id='form_intro'>"+
				"Na świecie jest mnóstwo osób, których miłość do japońskich ogrodów dorównuje naszej. Jesteśmy niezmiernie wdzięczni za wsparcie, które otrzymujemy od osób odwiedzających naszą stronę. Dzięki niemu możemy kontynuować realizację naszej pasji.<br>Aby podziękować Wam za Wasze zaangażowanie, od ponad roku organizujemy na naszej stronie co miesiąc ekscytującą loterię, w której macie szansę wygrać unikalne akcesoria związane z japońskimi ogrodami."+
				"Wystarczy wypełnić poniższy formularz, aby wziąć w niej udział. Każdy kto się na to zdecyduje ma równe szanse na sukces.<br>"+
				"Nie czekajcie dłużej! Dołączcie do naszej społeczności miłośników japońskich ogrodów i korzystajcie z okazji na wygranie nagrody."+
			"</p>"+
			"<div id='form_container'>"+
				"<form action='mailto:xxx@xxxx.xx' method='post' id='loteria'>"+
					"<div class='nieparzysty' id='zgoda_check'>"+
						"<label for='zgoda'>Wyrażam zgodę na przechowywanie danych zamieszczonych w poniższym formularzu.</label>"+
						"<input type='checkbox' required id='zgoda'>"+
						"<p id='zgoda_box'></p>"+
					"</div>"+
					"<div class='parzysty'>"+
						"Na początek prosimy wybrać interesujący Cię produkt (można wybrać tylko jeden). Produkt ten zostanie do Ciebie wysłany w razie wygrania loterii.<br>"+
						"<label class='form_ele' for='produkty'>Dostępne produkty: </label>"+
						"<select class='form_ele' name='produkty' id='produkty'>"+
							"<option value='p1'>Plakat 'Piękno Japonii'</option>"+
							"<option value='p2'>Plakat 'Sześć Wznisłości'</option>"+
							"<option value='p3'>Książka 'Historia Japońskich Ogrodów'</option>"+
							"<option value='p4' selected>Książka 'Japońskie Ogrody: Co, jak i dlaczego'</option>"+
							"<option value='p5'>Książka 'Poradnik Ogrodnika: Jak dbać o bambusa'</option>"+
							"<option value='p6'>Album ze zdjęciami 'Kenroku-en Wiosną'</option>"+
							"<option value='p7'>Miniaturowy model japońskiego ogrodu</option>"+
							"<option value='p8'>Figurka kwitnącej wiśnii</option>"+
						"</select>"+
					"</div>"+
					"<div class='nieparzysty'>"+
						"<label class='form_ele' for='imie'>Imię*:</label>"+
						"<input class='form_ele' type='text' id='imie' placeholder='Jan' title='Imię nie może zawierać żadnych znaków innych niż litery'>"+
						"<p id='imie_box'></p>"+
					"</div>"+
					"<div class='parzysty'>"+
						"<label class='form_ele' for='nazwisko'>Nazwisko*:</label>"+
						"<input class='form_ele' type='text' id='nazwisko' placeholder='Kowalski' title='Nazwisko nie może zawierać żadnych znaków innych niż litery'>"+
						"<p id='nazw_box'></p>"+
					"</div>"+
					"<div class='nieparzysty'>"+
						"<label class='form_ele' for='email'>Email*:</label>"+
						"<input class='form_ele' type='email' id='email' placeholder='nazwa@domena' title='Email musi zawierać '@''>"+
						"<p id='email_box'></p>"+
					"</div>"+
					"<div class='parzysty'>"+
						"<p class='form_ele'>Sposób dostawy ewentualnej nagrody*:</p>"+
						"<div class='form_ele'>"+
							"<label for='radio1'>Kurier:</label><input type='radio' class='dostawa' name='dostawa' value='kurier' id='radio1' checked>"+
							"<label for='radio2'>Paczkomat:</label><input type='radio' class='dostawa' name='dostawa' value='paczkomat' id='radio2'> "+
							"<label for='radio3'>Poczta:</label><input type='radio' class='dostawa' name='dostawa' value='poczta' id='radio3'>"+
						"</div>"+
					"</div>"+
					"<div class='nieparzysty'>"+
						"<label class='form_ele' for='adres'>Adres zamieszkania*:<br>(Na jego podstawie dostosujemy powyżej wybraną opcję dostawy)</label>"+
						"<input class='form_ele' type='text' id='adres' placeholder='ul. Nadbystrzycka 20/4 20-007 Lublin' title='Wzor adresu: ul. [Ulica] [Nr budynku/nr lokalu] [Kod pocztowy] [Misto]'>"+
						"<p id='adres_box'></p>"+
					"</div>"+
					"<div class='parzysty'>"+
						"<button type='button' class='form_ele przycisk' onclick='sprawdz()'>Zapisz</button>"+
						"<button type='button' class='form_ele przycisk' onclick='form_clear()' id='button_anuluj'>Anuluj</button>"+
					"</div>"+
				"</form>"+
			"</div>";
}

function ups(){
	var komunikat = document.getElementById('form_tresc');
	komunikat.innerHTML = "O, nie! Wygląda na to, że tych danych już nie ma :(<br>"+
														"Przepraszamy za niedogodność.<br><button type='button' class='przycisk' onclick='domyslnyForm()'>Kontynuuj</button>";
	komunikat.setAttribute('style','background: #ffb5f9; color: #381321; font-size: 17px; font-weight: bold; border: solid 5px #e866bd;')
}