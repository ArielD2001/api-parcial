<?php

require_once('models/connection.php');
require('controllers/post.controller.php');

if(isset($_POST)){
   
    $columns = array();

    foreach (array_keys($_POST) as $key => $value) {
        array_push($columns, $value);
    }

    if(empty(Connection::getTable($table, $columns))){
        $json = array(
            "status" => 400,
            "results" => 'Error: fields in the form do not match the databases',
            "method" => 'post'
        );
        echo json_encode($json, http_response_code($json['status']));
        return;
    }
        $response = new PostController();
        $response->postData($table,$_POST);    
}
