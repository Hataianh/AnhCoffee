<?php
    class dbconnect 
    {
        public $host="localhost";
        public $username="root";
        public $password="";
        public $database="coffee";
        public $db;
        public function __construct(){
            
           $this->db= new mysqli($this->host, $this->username, $this->password,$this->database);
        }
        function getdata($query){
            $data=$this->db->query($query);
            mysqli_close($this->db);
            return $data;
        }
        function insert($query){
            mysqli_query($this->db,$query);
            mysqli_close($this->db);
        }
        function update($query){
            mysqli_query($this->db,$query);
            mysqli_close($this->db);
        }
    }
?>