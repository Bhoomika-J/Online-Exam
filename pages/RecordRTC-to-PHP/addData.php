<?php


 include("../../conn.php");
 

 $selQuest = $conn->query("SELECT * FROM exam_attempt order by examat_id desc ");
     $selQuestRow = $selQuest->fetch(PDO::FETCH_ASSOC);
					
    $conn->query("UPDATE exam_attempt SET video='". $_GET['fn']."' WHERE examat_id = '".$selQuestRow['examat_id']."'  ");
 
 ?>