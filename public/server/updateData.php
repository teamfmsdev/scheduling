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
  $stmt = $con -> prepare("UPDATE `$table` SET `$column`='$newValue' WHERE `row`='$row'");

  if($stmt -> execute()){
      echo "Update sucess";
  }else{
      echo "Update failed";
  }
}
elseif($data["operation"]=="addChildTableData") {

  switch($table){
    case "bia":
    case "ptw":
    $stmt = $con -> prepare("INSERT INTO `$table` (`date`) VALUES ('$date');
    SELECT LAST_INSERT_ID();");
    break;
    case "pa":
    case "cm":
    $stmt = $con -> prepare("INSERT INTO `$table` (`date`) VALUES ('$date');
    SELECT LAST_INSERT_ID();");
    break;
    default:
    break;
  }

  if($stmt -> execute()){
    $rowValue = $con ->lastInsertId();
    $message["row"]=$rowValue;
    // $message["opsCode"]="1";
    $message["serverMessage"]="Record Inserted successfully";
    
    echo json_encode($message);
  }else{
      echo "Failed to insert new record";
  }
  
}elseif($data["operation"]=="deleteChildTableData"){
  $stmt = $con -> prepare("DELETE FROM $table WHERE (`row`='$row')");
  if($stmt->execute()){
    echo "Record deleted successfully";
  }else{
    echo "Failed to delete record";
  }
}
elseif($data["operation"]=="reValidateChildTableData"){
  $fmNo = $_GET["fmNo"];
  $activities = $_GET["activities"];
  $type = $_GET["type"]; 
  $priority = $_GET["priority"];
 
  if($table=="bia"){
    $stmt = $con -> prepare("INSERT INTO `$table` 
  VALUES ('$date',DEFAULT,'$fmNo','$priority','$activities','$type') ;
  SELECT LAST_INSERT_ID();");
  }
  else{
    $stmt = $con -> prepare("INSERT INTO `$table` 
  VALUES ('$date',DEFAULT,'$fmNo','$activities','$type') ;
  SELECT LAST_INSERT_ID();");
  }

  

  if($stmt -> execute()){
    $rowValue = $con ->lastInsertId();
    $message["row"]=$rowValue;
    $message["serverMessage"]="Revalidate successfull";
    
    echo json_encode($message);
  }else{
    echo "Failed to revalidate";
  }
}
elseif($data["operation"]=="mainTableEditRow"){

    $stmt= $con -> prepare("UPDATE `$table` SET `$column`='$newValue' WHERE YEAR(`date`)=YEAR('$date')
    AND MONTH(`date`)=MONTH('$date') AND DAY(`date`)>=DAY('$date')");

    if ($stmt->execute()){
      $message["serverMessage"] = "Color updated";
      echo json_encode($message);
    }
    else{
      $message["serverMessage"] = "Color failed to update";
      echo json_encode($message);
    }
}
elseif($data["operation"]=="toggleChildTableCompletion"){
  $stmt = $con -> prepare("UPDATE `$table` SET `status`='$newValue'
  WHERE `row`='$row'");
  
  if($stmt->execute()){
    echo "Status updated";
  }
  else{
    echo "Status failed to update";
  }
}
elseif($data["operation"]=="togglePtwType"){
  $stmt = $con -> prepare("UPDATE `$table` SET `type`='$newValue'
  WHERE `row`='$row'");
  
  if($stmt->execute()){
    echo "Type updated";
  }
  else{
    echo "Type failed to update";
  }
}


