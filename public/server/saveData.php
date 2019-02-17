<?php
  require "connection.php";

  $data = $_GET['date'];
  // $stmt = $con -> prepare("INSERT IGNORE INTO `parentRow`(`date`) VALUES
  // (?)" );
  $stmt = $con -> prepare("CALL doWhile('$data')" );

    // $stmt =$con -> prepare("
    // drop procedure if exists doWhile;
    // DELIMITER //  
    // CREATE PROCEDURE doWhile()   
    // BEGIN
    // DECLARE i DATE DEFAULT $data; 
    // WHILE (MONTH(i) = MONTH($data)) DO
    //     INSERT IGNORE INTO `parentRow` (`date`) values (i);
    //     SET i = DATE_ADD(i,INTERVAL 1 DAY);
    // END WHILE;
    // END;
    // //
    
    // CALL doWhile(); 
    // ");

    // drop procedure if exists doWhile;
    // DELIMITER //  
    // CREATE PROCEDURE doWhile()   
    // BEGIN
    // DECLARE i DATE DEFAULT "2019-01-01"; 
    // WHILE (MONTH(i) = MONTH("2019-01-01")) DO
    //     INSERT IGNORE INTO `parentRow` (`date`) values (i);
    //     SET i = DATE_ADD(i,INTERVAL 1 DAY);
    // END WHILE;
    // END;
    // //  
    
    // CALL doWhile(); 
    



// $i=1;
// foreach ($_GET as $key => $value) {
//   $stmt -> bindValue($i,$data);
// }

  try
  {    
      $stmt->execute();
      echo "Insert success";
  }
  catch (PDOException $e)
  {
      echo "Insert FAILED";
  }


?>