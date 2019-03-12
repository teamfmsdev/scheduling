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
    if($table=="bia"){
      $fmNo = $data["data"];
      // Append to description of row = fmNo 
      $logMsg = $con->prepare("UPDATE `biaschedule` SET `description`
      =CONCAT(`description`,CONCAT('\n\n***Job scheduled on ',DATE_FORMAT('$date','%d-%m-%Y'))), `status`='Scheduled' WHERE `fmNo`='$fmNo'");

      if($logMsg->execute()){
        echo "Job scheduled";
      }
    }
    else{
      echo "Update sucess";
    }
      
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
  
}
elseif($data["operation"]=="deleteChildTableData"){
  if($table=="bia"){
    $stmt=$con->prepare("SELECT `fmNo` INTO @fmNo FROM $table WHERE (`row`='$row');
    UPDATE `biaschedule` SET `description`=CONCAT(`description`,CONCAT('\n\n***Job removed from schedule on ',DATE_FORMAT(CURDATE(),'%d-%m-%Y')))
    , `status`='In Progress' 
    WHERE `fmNo`=@fmNo;
    DELETE FROM $table WHERE (`row`='$row');");

    if($stmt->execute()){
      echo "Record removed from schedule";
    }
    else{
      echo "Failed to remove record from schedule";
    }
  }
  else{
    $stmt = $con -> prepare("DELETE FROM $table WHERE (`row`='$row')");
    if($stmt->execute()){
      echo "Record deleted successfully";
    }else{
      echo "Failed to delete record";
    }
  }
  
}
elseif($data["operation"]=="reValidateChildTableData"){
  $fmNo = $_GET["fmNo"];
  $activities = $_GET["activities"];
  $type = $_GET["type"]; 
  // $priority = $_GET["priority"];
 
  if($table=="bia"){

  $stmt = $con -> query("UPDATE `bia` SET `date`='$date' WHERE TRIM(`fmNo`) = $fmNo;
  UPDATE `biaschedule` SET `description`=CONCAT(`description`,CONCAT('\n\n***Job rescheduled to ',DATE_FORMAT('$date','%d-%m-%Y')))
  WHERE `fmNo`=$fmNo;");

  $count= $stmt->rowCount();

  $jsonData["serverMessage"]="Revalidate Success";
  $jsonData["rowAffected"]=$count;
  echo json_encode($jsonData);
  }
  else{
    $stmt = $con -> prepare("INSERT INTO `$table` 
    VALUES ('$date',DEFAULT,'$fmNo','$activities','$type') ;
    SELECT LAST_INSERT_ID();");
    

    if($stmt->execute()){
      $resultData = $con->lastInsertId();
      $serverData["row"] = $resultData;
      $serverData["serverMessage"] = "Revalidate Success";
      echo json_encode($serverData);
    }
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
  // $row=$data['row'];
  $newValue == 1 ? $jobStatus = "completed on " : $jobStatus = "reopened on ";
  $newValue == 1 ? $closedBy = "Support Team" : $closedBy = "''";
  $newValue == 1 ? $closedDate = "CURDATE()" : $closedDate = "''";
  $newValue == 1 ? $newValue = "Closed" : $newValue = "Scheduled";
  
  $stmt = $con -> prepare("UPDATE `biaschedule` SET `status`='$newValue',
  `description`=CONCAT(`description`,CONCAT('\n\n***Job $jobStatus',DATE_FORMAT(CURDATE(),'%d-%m-%Y'))),
  `closedBy`='$closedBy',`completionDate`=$closedDate WHERE `row`= $row ");
  
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


