<?php

include "config.php";

//$chunkSize = empty($_GET["chunkSize"])?"0":$_GET["chunkSize"];
$offset = empty($_GET["offset"])?"0":$_GET["offset"];   //check nullable
//$offset = $offset*$chunkSize;


//$sql  =  ("SELECT * FROM tbl_title_subtitle limit 10 OFFSET $offset ");



//$sql  =  ("SELECT * FROM tbl_title_subtitle WHERE status IN (1) limit 10 OFFSET $offset ");


$sql  =  ("SELECT * FROM tbl_name_of_allah_swt WHERE status IN (1) limit 10 OFFSET $offset ");

//echo $sql;


$result = array();

//print($result);

$res = $con->query($sql);

if($res->num_rows>0)
{
	while ($row = $res->fetch_assoc()) {
		$result[] = $row;
	}
}

?>



<?php

//Declaring Class

 header("Access-Control-Allow-Origin: *");
 
class AllPageItemData {

	public $single_page_data;
}

$myObj = new AllPageItemData;

$myObj ->single_page_data = $result;

$jsondata = json_encode($myObj);

echo $jsondata;

?>



