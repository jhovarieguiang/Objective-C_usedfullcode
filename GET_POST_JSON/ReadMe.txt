in your server side used xamp and copy this code save as test.php
location is http://localhost/test/test.php


<?php
$data = array('a' => 'apple', 'b' => 'banana', 'c' => 'candy');
$json_string = json_encode($data, JSON_PRETTY_PRINT);
echo $json_string;
?>