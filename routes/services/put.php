<?php

require_once('models/connection.php');
require('controllers/put.controller.php');


if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $form = file_get_contents('php://input');
    $formarray = explode("&", $form);

    $columns = array();
    $formulario = array();
    foreach ($formarray as $key => $value) {
        array_push($columns, explode('=', $value)[0]);
        array_push($formulario, urldecode(explode('=', $value)[1]));
    }


    if (empty(Connection::getTable($table, $columns))) {
        $json = array(
            "status" => 400,
            "results" => 'Error: fields in the form do not match the databases',
            "method" => 'post'
        );
        echo json_encode($json, http_response_code($json['status']));
        return;
    }
    $response = new PutController();
    $response->putData($table,$columns, $formulario, $id);
    return;
}

$json = array(
    "status" => 400,
    "results" => 'Error: no hay id',
    "method" => 'post'
);
echo json_encode($json, http_response_code($json['status']));
    