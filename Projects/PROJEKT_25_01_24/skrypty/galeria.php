<?php
    $tytul = "Galeria";
    $zawartosc= zaladujGalerie();   //Stworzylem funkcję, bo myślałem, że ją potem gdzieś jeszcze wykorzystam
    
    function zaladujGalerie(){
        $text = '<div id="kontener">
                    <div id="galeria">';
        for($i=1; $i<=12; $i++){
            // Slash na początku ścieżki oznacza folder domowy, czyli localhost w tym przypadku
            $text.='    <a href="/PROJEKT/index.php?strona=galeria&zdjecie='.$i.'" class="slajd">
                            <img src="Images/Miniaturka'.$i.'.jpg" alt="Miniaturka'.$i.'">
                        </a>';
        }
        $text.='    </div>
		</div>';
        return $text;
    }
    
    function wyswietlZdjecie($nr){
        global $zawartosc;  //aby móc tutaj korzystać ze zmiennej $zawartosc trzba ją zrobić globalną
        $zawartosc = '<div id="kontener">';
        if($nr>1 && $nr<12){
            $zawartosc .= '<a href="/PROJEKT/index.php?strona=galeria&zdjecie='.($nr-1).'" id="galButt" class="galeriaInner"><</a>';
            $zawartosc .= '<img src="Images/Slajd'.$nr.'.jpg" alt="Slajd'.$nr.'" id="zdjecie">';
            $zawartosc .= '<a href="/PROJEKT/index.php?strona=galeria&zdjecie='.($nr+1).'" id="galButt" class="galeriaInner">></a>';
        }
        else if($nr==1){
            $zawartosc .= '<img src="Images/Slajd'.$nr.'.jpg" alt="Slajd'.$nr.'" id="zdjecie">';
            $zawartosc .= '<a href="/PROJEKT/index.php?strona=galeria&zdjecie='.($nr+1).'" id="galButt" class="galeriaInner">></a>';
        }
        else if($nr==12){
            $zawartosc .= '<a href="/PROJEKT/index.php?strona=galeria&zdjecie='.($nr-1).'" id="galButt" class="galeriaInner"><</a>';
            $zawartosc .= '<img src="Images/Slajd'.$nr.'.jpg" alt="Slajd'.$nr.'" id="zdjecie">';
        }
        else{
            $zawartosc .= '<p class="info_tekst">Zdjęcie nie istnieje</p>';
        }
        $zawartosc .= '<br><br><a href="/PROJEKT/index.php?strona=galeria" id="backButt" class="galeriaInner">Powrót</a>';
        $zawartosc .= '</div><br>';
    }
    
    //Parametr jest przekazywany poprzez supertablicę $_GET i dzięki temu mogę elementem html (Który nie jest formularzem) uruchomić funkcję PHP
    //filter_input zwraca to co szukam w danej tablicy
    if(filter_input(INPUT_GET, 'zdjecie')){
        wyswietlZdjecie(filter_input(INPUT_GET, 'zdjecie'));
    }