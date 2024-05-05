<?php
class Strona {
//pola (własności) klasy:
    protected $zawartosc;
    protected $tytul = "Modułowy serwis PHP";
    protected $slowa_kluczowe = "narzędzia internetowe, php, formularz,
    galeria";
    protected $przyciski = array( "Strona Główna" => "?strona=index",
    "Galeria" => "?strona=galeria",
    "Loteria" => "?strona=loteria",
    "Informacje"=>"?strona=informacje");
    
//interfejs klasy – metody modyfikujące fragmenty strony
    public function ustaw_zawartosc($nowa_zawartosc) {
        $this->zawartosc = $nowa_zawartosc;
    }
    function ustaw_tytul($nowy_tytul) {
        $this->tytul = $nowy_tytul;
    }
    public function ustaw_slowa_kluczowe($nowe_slowa) {
        $this->slowa_kluczowe = $nowe_slowa;
    }
    public function ustaw_przyciski($nowe_przyciski) {
        $this->przyciski = $nowe_przyciski;
    }
    public function ustaw_style($url) {
        echo '<link rel="stylesheet" href="' . $url . '" type="text/css">';
    }
    
//interfejs klasy – funkcje wyświetlające stronę
    public function wyswietl() {
        $this->wyswietl_naglowek();
        $this->wyswietl_zawartosc();
        $this->wyswietl_stopke();
    }
    public function wyswietl_tytul() {
        echo "<title>$this->tytul</title>";
    }
    public function wyswietl_slowa_kluczowe() {
        echo "<meta name=\"keywords\" contents=\"$this->slowa_kluczowe\">";
    }
    public function wyswietl_menu() {
        echo "<div class='menu' id='menu'>";
        foreach($this->przyciski as $nazwa => $url){ 
            echo ' <a href="' . $url . '">' . $nazwa . '</a>';
        }
        echo '<a href="javascript:void(0);" class="icon" onclick="zmienKlase()">';
//Dzięki javascript:void(0); zwracana jest wartość undefined. Dzięki temu link nie przekierowywuje nigdzie, przeglądarka zostaje na tej samej stronie-->
	echo '<i class="fa fa-bars"></i>';  //Dodanie trzech kresek do menu-->
	echo '</a>';
        echo "</div>";
    }
    public function wyswietl_naglowek() {
        ?> 
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Trzy kreski w menu gdy rozdzielczość jest mała zaimportowane z font-awesome-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
	<!-- 2 poniższe linijki odpowiadają za bootsrap-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<!-- 2 poniższe linijki odpowiadają za mapę, korzystam z biblioteki leaflet -->
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="">
	<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
        <!-- Dodanie pliku z funkcjami JS-->
	<script src="JS/strona_glowna.js"></script>
        <?php
        $this->ustaw_style('css/style.css');
        echo "<title>".$this->tytul."</title></head><body>";    //Zamknięcie głowy, rozpoczęcie ciała
    }
    public function wyswietl_zawartosc() {
        echo '<div id="baner"><h1>Ogrody japońskie</h1></div>';
        $this->wyswietl_menu();
        echo "<h3>".$this->tytul."</h3>";
        echo "<div id='main'>"; 
        echo $this->zawartosc . "</div>";
    }
    public function wyswietl_stopke() {
        echo '<footer> &copy;Dominik Bartoszuk</footer>';
        echo '</body></html>';
    }
}

