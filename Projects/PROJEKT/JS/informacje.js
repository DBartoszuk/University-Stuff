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

		/*DOTYCZĄCE INFORMACJI, w jQuery*/
//JQuery niech działa dopiero gdy wszystko w DOM się załaduje
$(document).ready(function(){
	obslugaPrzycisku(3);
	$('h3').css('width', '24%');	//Ustawia szerokość wszystkich h3 na 24%
	$('#infoIntro').css({
		'background': '#cbf09c',	//Zmiana wielu styli za pomocą jednego .css()
		'font-weight': 'bold'		//Składnia klucz: wartość oddzielone przecinkiem
	});
	$('#infoPrzyciski').css({
		'background': '#de9aed',
		'width': '30%',
		'margin': '5px auto',
		'border': 'solid 2px #110f21',
		'padding': '8px'
	});
	$('button').css({
		'padding': '1px 5px',
		'font': '18px Roboto, sans-serif',
		'background': '#ad9447',
		'color': '#ebedda',
		'border': 'solid 2px #1c0f0b',
		'margin': '0px 15px'
	});
	
	//Obsługa najechania kursorem na przycisk
	$('button').hover(
		function(){		//To się wykona, póki kursor jest na elemencie
			$(this).css({	//Te reguły css dotyczą tylko elementu, który wywołał tę funkcję
				'background': '#e8e3ca',
				'color': '#332c08',
				'border': 'solid 2px #e8c6bc'
			});
		},
		function(){		//To się wykona, gdy kursor opuści element
			$(this).css({
				'background': '#ad9447',
				'color': '#ebedda',
				'border': 'solid 2px #1c0f0b'
			});
		}
	);
	
	//Funkcja nazwana, z parametrem obsługująca przyciski
	function obslugaPrzycisku(nr){
		if(nr == 1){
			$('#informacjeKontener').html("Dominik Bartoszuk, student Politechniki Lubelskiej.<br>Kierunek: Informatyka stacjonarna, IST 4.1/1.<br>"+
			"Rok: Drugi<br>Semestr: Letni");
			//Weź element z danym id i w jego html wstaw...
		}
		else if(nr == 2){
			$('#informacjeKontener').html("Strona ta powstała jako projekt zaliczeniowy z przedmiotu <i>Podstawy Aplikacji Internetowych</i>.<br>"+
			"Tematem projektu były ogrody japońskie.");
			//.html odpowiada .innerHTML w JS
		}
		else{
			$('#informacjeKontener').html("Email: lorem@ipsum.com<br>Odnajdź nas na: <br>Twitter: https://twitter.com/OgrodyPasjaJP<br>"+
			"Youtube: https://www.youtube.com/user/OgrodyPasjaJP<br>Patreon: https://www.patreon.com/OgrodyPasjaJP<br>"+
			"<br>(Proszę pamięać, że żadne z tych kont nie instnieje.)");
		}
		$('#informacjeKontener').css({
			'background': '#e866bd',
			'font-size': '18px',
			'color': '#102112',
			'border': 'solid 2px #573928',
			'padding': '5px',
			'margin': '5px 0px'
		});
	}
	
	//Obsługa kliknięć przycisków
	$('#but1').click(function(){
		obslugaPrzycisku(1);
	});
	$('#but2').click(function(){
		obslugaPrzycisku(2);
	});
	$('#but3').click(function(){
		obslugaPrzycisku(3);
	});
	
});