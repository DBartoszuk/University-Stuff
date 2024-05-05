<?php
class User {
    //pola
    const STATUS_USER = 1;
    const STATUS_ADMIN = 2;
    protected $userName;
    private $password;
    protected $fullName;
    protected $email;
    protected $date;
    protected $status;
    
    //metody
    function __construct($userName, $fullName, $email, $password){
        $this -> status = User::STATUS_USER;
        $this -> date = new DateTime();
        $this->date = $this->date->format('Y-m-d H:i:s');
        $this -> userName = $userName;
        $this -> fullName = $fullName;
        $this -> email = $email;
        $this -> password = $password;
        $this->password = password_hash($this->password, PASSWORD_DEFAULT);
    }
    
    public function show(){
        echo "Oto dane użytkownika<br>Nazwa: $this->userName<br>"
                . "Imię i nazwisko: $this->fullName<br>"
                . "E-mail: $this->email<br>"
                . "Data utworzenia konta: $this->date<br>"
                . "Status: $this->status<br>";
    }
    //settery
    public function setUserName($name){
        $this->userName = $name;
    }
    
    public function setFullName($fullName): void {
        $this->fullName = $fullName;
    }

    public function setEmail($email): void {
        $this->email = $email;
    }

    public function setDate($date): void {
        $this->date = $date;
    }

    public function setStatus($status): void {
        $this->status = $status;
    }
    //gettery
    public function getUserName(){
        return $this->userName;
    }
    
    public function getFullName() {
        return $this->fullName;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getDate() {
        return $this->date;
    }

    public function getStatus() {
        return $this->status;
    }
    
    function saveDB($db){
        try{
            if($db->insert("INSERT INTO users VALUES (NULL, '{$this->userName}', '{$this->fullName}', '{$this->email}', '{$this->password}', '{$this->status}', '{$this->date}');")){
                return true;
            }
        }
        catch(mysqli_sql_exception $e){
            if($e->getCode() == 1062){
                //kod 1062 to kod błędu unikalności klucza
                return 0;
            }
            else{
                //inny rodzaj błędu
                throw $e; //info co to za błąd
            }
        }
    }
    
    static function getAllUsersFromDB($db){
        echo $db->select("select userName, fullName, email, status, date from users", ["userName", "fullName", "email", "status", "date"]);
    }
    
}
