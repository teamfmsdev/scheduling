<?php
require "connection.php";

foreach ($_GET as $key => $value) {
    $data[$key] = $value;
  }

$date = $data['date'];
  $stmt = $con -> prepare("SELECT `parentrow`.`date`,
  `parentrow`.`n2`,`parentrow`.`n2`,`parentrow`.`n3`,
  `parentrow`.`n4`,`parentrow`.`n5`,`parentrow`.`n6`,
  `parentrow`.`n7`,`parentrow`.`n8`,`bia`.`biaRow`, `bia`.`biaFmNo`, `bia`.`biaActivities`,`ptw`.`ptwRow`, `ptw`.`ptwPtwNo`, `ptw`.`ptwActivities`,`ptw`.`ptwRow`,`pa`.`paRow`,`pa`.`paActivities`,`cm`.`cmRow`,`cm`.`cmActivities`
  FROM `parentrow`
  INNER JOIN `bia` ON `parentrow`.`date`=`bia`.`biaDate`
  INNER JOIN `ptw` ON `parentrow`.`date`=`ptw`.`ptwDate`
  INNER JOIN `pa` ON `parentrow`.`date`=`pa`.`paDate`
  INNER JOIN `cm` ON `parentrow`.`date`=`cm`.`cmDate`
  WHERE YEAR(`parentrow`.`date`)=YEAR('$date') AND
  MONTH(`parentrow`.`date`)=MONTH('$date') ");





if($stmt->execute()){
  
  $row = $stmt ->fetchAll(PDO::FETCH_ASSOC);
  foreach ($row as $key => $value) {
    $jsonData[$key];
    foreach($row[$key] as $columnKey => $columnValue){
      if(strstr($columnKey,"bia")!=false){
        $objKey = str_replace("bia","",$columnKey);
        $jsondata[$key][$objKey]=$columnValue;
      }elseif(strstr($columnKey,"ptw")!=false){
        $objKey = str_replace("ptw","",$columnKey);
        $jsondata[$key][$objKey]=$columnValue;
      }elseif(strstr($columnKey,"pa")!=false){
        $objKey = str_replace("pa","",$columnKey);
        $jsondata[$key][$objKey]=$columnValue;
      }elseif(strstr($columnKey,"cm")!=false){
        $objKey = str_replace("cm","",$columnKey);
        $jsondata[$key][$objKey]=$columnValue;
      }else{
        $jsondata[$key][$columnKey]=$columnValue;
      }
    }

  }
  echo json_encode($jsonData);
}

?>