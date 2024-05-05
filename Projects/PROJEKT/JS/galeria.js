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

		/*DOTYCZĄCE GALERII*/
/*Zależnie na które zdjęcie kliknięto, zostanie ono wyświetlone na całej stronie włącznie z przyciskiem by powrócić do galerii*/
function wyswietlZdjecie(i){
	var tresc = '';
	/*Zdjęcia ,,niebrzegowe" dostają 2 przyciski nawigacji- do poprzedniego i następnego zdjęcia*/
	if(i!=1 && i!=12){
		tresc += '<button onclick="wyswietlZdjecie('+i+'-1)" id="galButt"><</button>'+
				 '<img src="Images/Slajd'+i+'.jpg" alt="Slajd'+i+'" id="zdjecie">'+
				 '<button onclick="wyswietlZdjecie('+i+'+1)" id="galButt">></button>';
	}
	/*A ,,brzegowe" tylko 1, odpowiedni*/
	else if(i==1){
		tresc += '<img src="Images/Slajd'+i+'.jpg" alt="Slajd'+i+'" id="zdjecie">'+
				 '<button onclick="wyswietlZdjecie('+i+'+1)" id="galButt">></button>';
	}
	else{
		tresc += '<button onclick="wyswietlZdjecie('+i+'-1)" id="galButt"><</button>'+
				 '<img src="Images/Slajd'+i+'.jpg" alt="Slajd'+i+'" id="zdjecie">';
	}
	/*Na samym końcu dodany jest przycisk powrotu*/
	tresc += '<br><button onclick="powrot()" id="backButt">Powrót</button>';
	document.getElementById("kontener").innerHTML = tresc;
}

/*Kod z galeria.html umieszczony w zmiennej tresc*/
function powrot(){
	var tresc = '<div id="galeria">'+
					'<div class="slajd"><img src="Images/Miniaturka1.jpg" alt="Miniaturka1" onclick="wyswietlZdjecie(1)"></div>'+
					'<div class="slajd"><img src="Images/Miniaturka2.jpg" alt="Miniaturka2" onclick="wyswietlZdjecie(2)"></div>'+
					'<div class="slajd"><img src="Images/Miniaturka3.jpg" alt="Miniaturka3" onclick="wyswietlZdjecie(3)"></div>'+
					'<div class="slajd"><img src="Images/Miniaturka4.jpg" alt="Miniaturka4" onclick="wyswietlZdjecie(4)"></div>'+
					'<div class="slajd"><img src="Images/Miniaturka5.jpg" alt="Miniaturka5" onclick="wyswietlZdjecie(5)"></div>'+
					'<div class="slajd"><img src="Images/Miniaturka6.jpg" alt="Miniaturka6" onclick="wyswietlZdjecie(6)"></div>'+
					'<div class="slajd"><img src="Images/Miniaturka7.jpg" alt="Miniaturka7" onclick="wyswietlZdjecie(7)"></div>'+
					'<div class="slajd"><img src="Images/Miniaturka8.jpg" alt="Miniaturka8" onclick="wyswietlZdjecie(8)"></div>'+
					'<div class="slajd"><img src="Images/Miniaturka9.jpg" alt="Miniaturka9" onclick="wyswietlZdjecie(9)"></div>'+
					'<div class="slajd"><img src="Images/Miniaturka10.jpg" alt="Miniaturka10" onclick="wyswietlZdjecie(10)"></div>'+
					'<div class="slajd"><img src="Images/Miniaturka11.jpg" alt="Miniaturka11" onclick="wyswietlZdjecie(11)"></div>'+
					'<div class="slajd"><img src="Images/Miniaturka12.jpg" alt="Miniaturka12" onclick="wyswietlZdjecie(12)"></div>'+
				'</div>';
	document.getElementById("kontener").innerHTML = tresc;
}