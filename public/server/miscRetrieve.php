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
  $stmt = $con -> prepare("SELECT `row` as fmNo,`Priority` as priority,`Work Title` As activities,`Status` as status FROM `main` WHERE `row`='$fmNo'");
  // $stmt = $con -> prepare("SELECT `bia`.`date`,`bia`.`fmNo`,`main`.`Priority` as priority
  // ,`main`.`Work Title` as activities,`main`.`Status` as status 
  // FROM `ccfm`.`bia` JOIN `ms`.`main` ON `ccfm`.`bia`.`fmNo` = `ms`.`main`.`row`");
  
  
  
  if ($stmt->execute()){
    $resultData = $stmt ->fetch(PDO::FETCH_ASSOC);  
    if($resultData){
      $resultData["status"] == "Closed" ? $resultData["status"] = 1 :$resultData["status"] = 0;
      echo json_encode($resultData);    
    }
    else{
      echo json_encode($resultData);    
    }
    
      
  }
}




?>