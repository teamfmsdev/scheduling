<?php

$serverName =  "localhost";
$userName = "root";
$password = "";
$dbName = "ccfm";

try{
$con = new PDO("mysql:host=$serverName;dbname=$dbName","root","");
// set the PDO error mode to exception
$con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e){
  echo "Error: " . $e->getMessage();
}

foreach ($_GET as $key => $value) {
  $data[$key] = $value;
}

$fmNo=$data["fmNo"];

$stmt = $con -> prepare("SELECT `Work Title` As workTitle,`Priority` As priority,
`Type 1` As type,`Location` As location ,`Status` As status
,`Request By` As requestBy,DATE_FORMAT(`Request Date`,'%d-%m-%Y') As requestDate FROM `main` WHERE `row`='$fmNo'");

if ($stmt->execute()){
  $resultData = $stmt ->fetch(PDO::FETCH_ASSOC);
  echo json_encode($resultData);
}



?>