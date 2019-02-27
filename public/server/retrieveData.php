<?php
require "connection.php";

foreach ($_GET as $key => $value) {
    $data[$key] = $value;
  }

$date = $data['date'];

  // $stmt = $con -> prepare("SELECT `parentrow`.`date`,
  // `parentrow`.`n1`, `parentrow`.`n2`,`parentrow`.`n3`,`parentrow`.`n4`,
  // `parentrow`.`n5`,`parentrow`.`n6`,`parentrow`.`n7`,
  // `parentrow`.`n8`,`bia`.`biaRow`, `bia`.`biaFmNo`, `bia`.`biaActivities`,`ptw`.`ptwRow`, `ptw`.`ptwPtwNo`, `ptw`.`ptwActivities`,`ptw`.`ptwRow`,`pa`.`paRow`,`pa`.`paActivities`,`cm`.`cmRow`,`cm`.`cmActivities`
  // FROM `parentrow`
  // FULL OUTER JOIN `bia` ON `parentrow`.`date`=`bia`.`biaDate`
  // FULL OUTER JOIN `ptw` ON `parentrow`.`date`=`ptw`.`ptwDate`
  // FULL OUTER JOIN `pa` ON `parentrow`.`date`=`pa`.`paDate`
  // FULL OUTER JOIN `cm` ON `parentrow`.`date`=`cm`.`cmDate`
  // WHERE YEAR(`parentrow`.`date`)=YEAR('$date') AND
  // MONTH(`parentrow`.`date`)=MONTH('$date') ");

  $parentRowFetch = $con -> prepare("SELECT * FROM `parentRow` WHERE YEAR(`date`)=YEAR('$date') 
  AND MONTH(`date`)=MONTH('$date')");
  $jsonData;
  if($parentRowFetch->execute()){

    $resultData = $parentRowFetch ->fetchAll(PDO::FETCH_ASSOC);
    // Numeric array
    foreach ($resultData as $rowKey => $rowValue) {
      // Assoc array
      foreach ($resultData[$rowKey] as $columnKey => $columnValue) {
        switch($columnKey){
          case "date":
          // date assoc for comparison 
          $jsonData[$rowKey]["date"] = $columnValue;
          // Standard data structure
          $date = strtotime($columnValue);
          $jsonData[$rowKey]['month'] = date("M",$date);
          $jsonData[$rowKey]['year'] = date("Y",$date);
          $jsonData[$rowKey]["mainTable"]['day'] = date("D",$date);
          $jsonData[$rowKey]["mainTable"]['date'] = date("d",$date);
          break;
          default:
          $jsonData[$rowKey]["mainTable"][$columnKey] = $columnValue;
        }
      }
    }
  }

  $tempArray=[];
  $date = $data["date"];
  $biaFetch = $con -> prepare("SELECT * FROM `bia` 
  WHERE YEAR(`date`)=YEAR('$date') AND MONTH(`date`)=MONTH('$date')") ;

  if($biaFetch->execute()){
    $resultData = $biaFetch -> fetchAll(PDO::FETCH_ASSOC);

    foreach ($resultData as $rowKey => $rowValue) {
      foreach ($resultData[$rowKey] as $columnKey => $columnValue) {

        switch ($columnKey) {
          case "date":
          // $tempArray[$rowKey]["date"] = $columnValue;
          break;
          case "row":
            $tempArray[$rowKey]["row"] = $columnValue;           
            break;         
          case "fmNo":
            $tempArray[$rowKey]["fmNo"] = $columnValue;        
            break;
            case "priority":
            $tempArray[$rowKey]["priority"] = $columnValue;        
            break;
          case "activities":
            $tempArray[$rowKey]["activities"] = $columnValue;                    
            break;          
          case "status":
            $tempArray[$rowKey]["status"] = $columnValue;
           break;
          default:            
            break;
        }
      }
        $jsonIndex = array_search($resultData[$rowKey]["date"],array_column($jsonData,"date"));
        // Append child Items array
        $jsonData[$jsonIndex]["childTable"]["biA"]["items"][]=$tempArray[$rowKey];
    }
      
    
    
  }

  $tempArray = [];
  $date = $data["date"];
  $ptwFetch = $con -> prepare("SELECT * FROM `ptw` 
  WHERE YEAR(`date`)=YEAR('$date') AND MONTH(`date`)=MONTH('$date')") ;

  if($ptwFetch->execute()){
    $resultData = $ptwFetch -> fetchAll(PDO::FETCH_ASSOC);

    foreach ($resultData as $rowKey => $rowValue) {
      foreach ($resultData[$rowKey] as $columnKey => $columnValue) {

        switch ($columnKey) {
          case "date":
          // $tempArray[$rowKey]["date"] = $columnValue;
          break;
          case "row":
          $tempArray[$rowKey]["row"] = $columnValue; 
          
          break;         
          case "fmNo":
          $tempArray[$rowKey]["fmNo"] = $columnValue;
          
          break;
          case "activities":
          $tempArray[$rowKey]["activities"] = $columnValue;                    
          break; 
          case "type":
            $tempArray[$rowKey]["type"] = $columnValue;
           break;        
          default:            
            break;
        }
      }
        $jsonIndex = array_search($resultData[$rowKey]["date"],array_column($jsonData,"date"));
        // Append child Items array
        $jsonData[$jsonIndex]["childTable"]["ptw"]["items"][]=$tempArray[$rowKey];
    }
      
    
    
  }




  $tempArray = [];
  $date = $data["date"];
  $paFetch = $con -> prepare("SELECT * FROM `pa` 
  WHERE YEAR(`date`)=YEAR('$date') AND MONTH(`date`)=MONTH('$date')") ;

  if($paFetch->execute()){
    $resultData = $paFetch -> fetchAll(PDO::FETCH_ASSOC);

    foreach ($resultData as $rowKey => $rowValue) {
      foreach ($resultData[$rowKey] as $columnKey => $columnValue) {

        switch ($columnKey) {
          case "date":
          // $tempArray[$rowKey]["date"] = $columnValue;
          break;
          case "row":
          $tempArray[$rowKey]["row"] = $columnValue; 
          
          break;         
          case "activities":
          $tempArray[$rowKey]["activities"] = $columnValue;                    
            break;          
          default:            
            break;
        }
      }
        $jsonIndex = array_search($resultData[$rowKey]["date"],array_column($jsonData,"date"));
        // Append child Items array
        $jsonData[$jsonIndex]["childTable"]["pa"]["items"][]=$tempArray[$rowKey];
    }
      
   
    
  }



  $tempArray = [];
  $date = $data["date"];
  $cmFetch = $con -> prepare("SELECT * FROM `cm` 
  WHERE YEAR(`date`)=YEAR('$date') AND MONTH(`date`)=MONTH('$date')") ;

  if($cmFetch->execute()){
    $resultData = $cmFetch -> fetchAll(PDO::FETCH_ASSOC);

    foreach ($resultData as $rowKey => $rowValue) {
      foreach ($resultData[$rowKey] as $columnKey => $columnValue) {

        switch ($columnKey) {
          case "date":
          // $tempArray[$rowKey]["date"] = $columnValue;
          break;
          case "row":
          $tempArray[$rowKey]["row"] = $columnValue; 
          
          break;         
          case "activities":
          $tempArray[$rowKey]["activities"] = $columnValue;                    
            break;          
          default:            
            break;
        }
      }
        $jsonIndex = array_search($resultData[$rowKey]["date"],array_column($jsonData,"date"));
        // Append child Items array
        $jsonData[$jsonIndex]["childTable"]["cm"]["items"][]=$tempArray[$rowKey];
    }
      
   
    
  }

  echo json_encode($jsonData);



?>