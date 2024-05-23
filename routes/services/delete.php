<?php
require('controllers/delete.controller.php');

if(isset($_GET)){
    $id = $_GET['id'];

    $response = new Deletecontroller();
    $response->deleteData($id, $table);
}