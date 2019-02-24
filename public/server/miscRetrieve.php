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

foreach ($_GET as $key => $value) {
  $data[$key] = $value;
}

$fmNo=$data["fmNo"];

if($data["operation"]=="displayModal"){
  $stmt = $con -> prepare("SELECT `Work Title` As workTitle,`Priority` As priority,
  `Type 1` As type,`Location` As location ,`Status` As status
  ,`Description` as description FROM `main` WHERE `row`='$fmNo'");
  
  if ($stmt->execute()){
    $resultData = $stmt ->fetch(PDO::FETCH_ASSOC);
    echo json_encode($resultData);
  }
}
elseif($data["operation"]=="getWorkTitle"){
  $stmt = $con -> prepare("SELECT `Work Title` As activities FROM `main` WHERE `row`='$fmNo'");
  
  if ($stmt->execute()){
    $resultData = $stmt ->fetch(PDO::FETCH_ASSOC);
    echo json_encode($resultData);
  }
}




?>