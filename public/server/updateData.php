<?php

require "connection.php";

foreach ($_GET as $key => $value) {
    $data[$key] = $value;
  }

$date = $data["date"];
$table = $data["table"];
$row= $data["row"];
$column = $data["type"];
$newValue = $data["data"];

if($data["operation"]=="editChildTableData"){
  $stmt = $con -> prepare("UPDATE `$table''` SET `$column`='$newValue' WHERE `row`=$row");

  // $i=1;
  // foreach ($data as $key => $value) {
  //     if($key == "SAP_Choice"){
  //       continue;
  //     }else {
  //       $stmt-> bindValue($i,$value);
  //       $i++;
  //     }
  //   }
  if($stmt -> execute()){
      echo "Update sucess";
  }else{
      echo "Update failed";
  }
}else {
  // $stmt = $con -> prepare("INSERT INTO `$table`  (`date`,`row`) VALUES ('$date','')");
}


