<?php

$serverName =  "localhost";
$userName = "root";
$password = "";
$dbName = "ms";

try{
$con = new PDO("mysql:host=$serverName;dbname=$dbName","root","");
// set the PDO error mode to exception
$con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e){
  echo "Error: " . $e->getMessage();
}



?>