		/*DOTYCZACE MENU*/
/* Dodanie klasy do elementu z id="menu", na potrzeby CSS */
function zmienKlase(){
  var x = document.getElementById("menu");	//pobiera element menu
  if (x.className === "menu") {		//potrójny znak równości sprawdza czy a jest równe b i w typie i w wartości
    x.className += " responsive";	//jeżeli element ten miał klasę ,,menu" to dodaj do niego klase ,, responsive"
  } else {
    x.className = "menu";	//w przeciwnym wypadku ustaw jego klasę na ,,menu"
  }
}
		/*DOTYCZĄCE STRONY GŁÓWNEJ*/
/*Dodanie mapy do dokumentu*/
function mapa(a, b){
		var map = L.map('map').setView([a, b], 16);				//mapa na lokalizacji a i b, z przyblizeniem 16
		var marker = L.marker([a, b]).addTo(map);				//marker na lokalizacje
		marker.bindPopup("<b>Ogród Kenroku-en</b>");			//napis dodany do markera
		L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {		//dzieki temu mapa sie wyswietla
			maxZoom: 19,
			attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
		}).addTo(map);
}

/*Asynchronicznie pobiera dane o pogodzie z serwera OpenWeatherAPI*/
function pogoda(pogodaId){
	var blok = document.getElementById('pogoda');
	const klucz = 'd56231f4ded702ee0b3a216efdcffea1';	//Mój klucz
	/*Utworzony url zawierający link do api, koordynaty, mój klucz, jednostki oraz język*/
	var url = 'https://api.openweathermap.org/data/2.5/weather?lat=36.5621278&lon=136.6626515&appid='+klucz+'&lang=pl&units=metric';
	fetch(url)	//fetch łączy nas z podanym adresem i 'łapie' odpowiedź
		.then(response=>{		//z którą potem coś robimy
			if(!response.ok) throw new Error(response.statusText);		//Sprawdzanie czy odpowiedź jest poprawna, czy nie jest to błąd
			return response.json();		//Odpowiedź jako JSON
		})
		.then(data=>{		//JSON z odpowiedzi, teraz nazwany jako data
			console.log(data);	//Dane dostępne z konsoli
			if(pogodaId==1){	//dla przycisku "podstawowe.."
				blok.innerHTML = '<p>Temperatura: '+data.main.temp+' &deg;C</p><p>Odczuwalna: '+data.main.feels_like+' &deg;C</p><p>Warunki: '+data.weather[0].description+'</p>'+
				'<p>Wilgotność: '+data.main.humidity+'%</p><p>Ciśnienie: '+data.main.pressure+' hPa</p>';	
			}
			else if(pogodaId==2){	//dla przycisku "dodatkowe..."
				blok.innerHTML = '<p>Prędkość wiatru: '+data.wind.speed+' m/s</p><p>Kierunek wiatru: '+data.wind.deg+' &deg;</p><p>Ciśnienie na poziomie morza: '+data.main.sea_level+' hPa</p>'+
				'<p>Widoczność: '+data.visibility+' km</p><p>Zachmurzenie: '+data.clouds.all+' %</p>';
			}
			blok.innerHTML +='<p><img src="http://openweathermap.org/img/wn/'+data.weather[0].icon+'@2x.png" alt="Icona Pogody"></p>';
			/*Dodanie zdjęcia. Jest ono pobierane ze strony OpenWeatherMap. W zwróconej odpowiedzi jest zawarte to, którą ikonę należy wyświetlić
			@2x określa rozmiar ikony. @4x było za duże*/
			
		})
		.catch(console.err);	//W razie błędu, jego kod będzie wyświetlony na konsoli
}

/*Wyświetlenie mapy i pogody gdy strona się załaduję, z poziomu DOM, może się zdarzyć, że jakieś dodatki jeszcze nie będą załadowane*/
document.addEventListener("DOMContentLoaded", function() {	
	mapa(36.5621278, 136.6626515)		/*Wywołanie powyższej funkcji 'mapa', z długością i szerokością na Kenroku-en*/
	pogoda(1);			//Domyślnie podstawowe info o pogodzie jest wyświetlane
});