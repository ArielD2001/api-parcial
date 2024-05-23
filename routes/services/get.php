<?php

require_once('./controllers/get.controller.php');

//parametros de validacion y consultas
$select = isset($_GET['select']) ?  $_GET['select'] : '*';
$order = isset($_GET['order']) ?  $_GET['order'] :  null;
$ordermode = isset($_GET['ordermode']) ?  $_GET['ordermode'] :  null;
$limit = isset($_GET['limit']) ?  $_GET['limit'] :  null;

$response = new  GetController();

    //peticiones con filtro
if (isset($_GET['to']) && isset($_GET['tovalue'])) {
    $response->getDataFilter($table, $select, $_GET['to'], $_GET['tovalue'], $order, $ordermode, $limit);

    //peticiones sin filtro
} else {
    $response->getData($table, $select, $order, $ordermode, $limit);
}
