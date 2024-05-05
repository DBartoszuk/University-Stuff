Katalog PROJEKT proszę umieścić w folderze /xampp/htdocs

W phpMyAdmin należy utworzyć bazę danych 'klienci', a następnie wykonać następujące polecenia SQL dla tej bazy:

CREATE TABLE IF NOT EXISTS `users`(
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `userName` VARCHAR(100) NOT NULL,
    `fullName` VARCHAR(255) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `passwd` VARCHAR(255) NOT NULL,
    `status` INT(1) NOT NULL,
    `date` DATETIME NOT NULL,
    PRIMARY KEY(`id`),
    UNIQUE KEY `userName`(`userName`, `email`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `logged_in_users`(
    `sessionId` VARCHAR(100) NOT NULL,
    `userId` INT(11) NOT NULL,
    `lastUpdate` DATETIME NOT NULL,
    PRIMARY KEY(`sessionId`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS `loteria`(
    `sessionId` varchar(100) NOT NULL,
  	`userId` int(11) UNSIGNED NOT NULL UNIQUE,
    `Imie` VARCHAR(50) NOT NULL,
    `Nazwisko` VARCHAR(50) NOT NULL,
    `Email` VARCHAR(50) NOT NULL,
    `Produkt` ENUM(
        'p1',
        'p2',
        'p3',
        'p4',
        'p5',
        'p6',
        'p7',
        'p8'
    ) NOT NULL DEFAULT 'p4',
    `Dostawa` ENUM('Kurier', 'Paczkomat', 'Poczta') NOT NULL DEFAULT 'Kurier',
    `Miejscowosc` VARCHAR(50) NOT NULL,
    `Kod` VARCHAR(50) NOT NULL,
    `Ulica` VARCHAR(50) NOT NULL,
    `Numer` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`userId`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;