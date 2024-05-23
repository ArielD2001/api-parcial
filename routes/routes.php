<?php

//Se toman los parametros que vienen en la URL
$RouteArray = explode('/', $_SERVER['REQUEST_URI']);

$RouteArray = array_filter($RouteArray);
array_shift($RouteArray);
array_shift($RouteArray);

if(empty($RouteArray)){
    $RouteArray = array('peliculas');
}
    $table = explode('?', $RouteArray[0])[0];

//Si no se esta haciendo ninguna peticion a la API
if (count($RouteArray) == 0) {
    $json = array(
        "status" => 404,
        "results" => 'Not found'
    );

    echo json_encode($json, http_response_code($json['status']));
    return;
}


//Si se esta haciendo una peticion a la API
if (count($RouteArray) == 1 && isset($_SERVER['REQUEST_METHOD'])) {

    $peticion = $_SERVER['REQUEST_METHOD'];

    //Peticiones GET
    if ($peticion == 'GET') {
        include('services/get.php');
    }

    //Peticiones POST
    if ($peticion == 'POST') {
        include('services/post.php');
    }

    //Peticiones PUT
    if ($peticion == 'PUT') {
        include('services/put.php');
    }

    //Peticiones DELETE
    if ($peticion == 'DELETE') {
        include('services/delete.php');
    }
}
