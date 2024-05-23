<?php
require_once('./models/get.model.php');

class GetController
{

    //respuesta del modelo sin filtro
    static public function getData($table, $select, $order, $ordermode, $limit)
    {
        $response = GetModel::getData($table, $select, $order, $ordermode, $limit);
        $return = new GetController();
        $return->fncResponse($response);
    }
//respuesta del modelo con filtro
    static public function getDataFilter($table, $select, $to, $tovalue, $order, $ordermode, $limit)
    {
        $response = GetModel::getDataFilter($table, $select, $to, $tovalue, $order, $ordermode, $limit);
        $return = new GetController();
        $return->fncResponse($response);
    }


    //respuesta del controlador
    public function fncResponse($response)
    {
        if (!empty($response)) {
            $json = array(
                "status" => 200,
                "rows" => count($response),
                "method" => 'get',
                "results" => $response
            );
            echo json_encode($json, http_response_code($json['status']));
        } else {

            $json = array(
                "status" => 404,
                "results" => 'Not found',
                "method" => 'get'
            );
            echo json_encode($json, http_response_code($json['status']));
        }
    }
}
