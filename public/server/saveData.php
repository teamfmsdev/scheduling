<?php
  require "connection.php";

  $data = $_GET['date'];
  $stmt = $con -> prepare("INSERT INTO `parentRow`(`date`) VALUES
  (?)");
$i=1;
foreach ($_GET as $key => $value) {
  $stmt -> bindValue($i,$data);
}

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