<?php
    $tytul="Strona główna";
    $zawartosc='<div id="tresc">';
    $zawartosc.='<div id="karuzela">';
    $zawartosc.='<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">'; //Wykorzystanie Bootstrapa by był slajder-karuzela
    $zawartosc.='<div class="carousel-inner">';
    $zawartosc.='<div class="carousel-item active">';
    $zawartosc.='<img src="Images/Obraz1.jpg" class="img-fluid rounded mb-4 mb-lg-0" alt="Obraz1" style="height: 350px">';
    $zawartosc.='</div>';
    $zawartosc.='<div class="carousel-item">';
    $zawartosc.='<img src="Images/Obraz2.jpg" class="img-fluid rounded mb-4 mb-lg-0" alt="Obraz2" style="height: 350px">';
    $zawartosc.='</div>';
    $zawartosc.='<div class="carousel-item">';
    $zawartosc.='<img src="Images/Obraz3.jpg" class="img-fluid rounded mb-4 mb-lg-0" alt="Obraz3" style="height: 350px">';
    $zawartosc.='</div>';	
//Jeżeli chce dodać więcej zdjęć to wystarczy skopiować <div class="carousel-item"> z zawartością i zmienić src
    $zawartosc.='</div>';
    $zawartosc.='</div>';
    $zawartosc.='</div>';
    $zawartosc.='<p id="strona_glowna">
                    Witamy na naszej stronie poświęconej pięknu i harmonii japońskich ogrodów. Japońskie ogrody to nie tylko miejsca o niezwykłej estetyce, ale także o głębokim znaczeniu kulturowym i duchowym. Zainspirowane filozofią zen, te mistyczne enklawy natury stanowią doskonały przykład połączenia sztuki, nauki i harmonii z otaczającym światem.
                    Japońskie ogrody mają długą i fascynującą historię, sięgającą tysiącleci. Początkowo inspirowane chińskimi wzorcami, z biegiem czasu wykształciły swoje unikalne cechy i style. Są one nie tylko przestrzeniami do wypoczynku i kontemplacji, ale także odzwierciedlają głębokie powiązanie z naturą oraz szacunek dla żywiołów i cyklu życia.
                    Ważną cechą japońskich ogrodów jest ich minimalistyczne podejście do projektowania. Stawiają one na prostotę, subtelność i asymetrię, tworząc wrażenie naturalności i równowagi. Wśród charakterystycznych elementów można wymienić kamyki, mostki, pagody, stawy, strumienie, bonsai oraz rośliny o znaczeniu symbolicznym, takie jak klon japoński czy bambus. Każdy element ma swoje znaczenie i jest starannie umieszczony, aby osiągnąć harmonię wizualną i duchową.
                    Filozofia zen jest również głęboko zakorzeniona w japońskich ogrodach. Ograniczenie hałasu i rozproszenia ma na celu umożliwienie odnalezienia spokoju i wewnętrznej równowagi. Przechodzenie przez ogrody jest często zaplanowane w taki sposób, aby kroki stawały się medytacją, a obserwacja natury prowadziła do kontemplacji.
		</p>';
    $zawartosc.='</div>';
    $zawartosc.='<br>';
    $zawartosc.='<div id="dalej">';
//Znacznik <i></i> odpowiada za pochylenie napisów
    $zawartosc.='Jednym z najbardziej znanych ogrodów na świecie jest ogród <i>Kenroku-en</i> w <i>Kanazawie</i>, słynący ze swojego ogromu, a co za tym idzie: ilości scenicznych widoków. Pośród zieleni i stawów można odnaleźć tradycyjne herbaciarnie, wiosną podziwiać kwitnięcie ponad 400 drzew wiśni i śliw ozdobnych. Nie można również zapomnieć o licznych strumieniach, mostach jak i również wszechobecnych kwiatów oraz drzew. Jego nazwa oznacza dosłownie <i>"Ogród Sześciu Wzniosłości"</i>, albowiem nawiązuje on do chińskiej teorii, że na ogród doskonały skłądają się:<br>';
    $zawartosc.='<p id="wznioslosci">-Przestronność<br>-Odosobnienie<br>-Sztuczność<br>-Starożytność<br>-Obfitość wody<br>-Szerokie widoki</p>';
    $zawartosc.='<img src="Images/Obraz4.jpg" alt="Obraz4">';
    $zawartosc.='<p id="adnotacja">Nie bez powodu ogród ten i jego zawartość stały się symbolami Kanazawy</p>';
    $zawartosc.='</div>';
    $zawartosc.='<div class="kolumna" id="lewy">';
    $zawartosc.='<p>Oto lokalizacja tego przepięknego ogrodu:</p>';
    $zawartosc.='<div id="map" style="width:425px; height:325px;"></div>';
    $zawartosc.='</div>';
    $zawartosc.='<div class="kolumna" id="prawy">';
    $zawartosc.='<p>Oto aktualna pogoda w tym miejscu:</p>';
    $zawartosc.='<div id="pogodaKontener">';
    $zawartosc.='<button class="buttonPogoda" onclick="pogoda(1)">Podstawowe informacje</button>';
    $zawartosc.='<button class="buttonPogoda" onclick="pogoda(2)">Dodatkowe informacje</button><br>';
    $zawartosc.='<div id="pogoda"></div>';
    $zawartosc.='</div>';
    $zawartosc.='</div>';

