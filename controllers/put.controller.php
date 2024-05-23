<?php

// Se requiere el modelo de actualización
require('models/put.model.php');

class PutController
{
    
    /**
     * Método estático para actualizar datos en la base de datos.
     *
     */
    static public function putData($table, $columns, $data, $id)
    {

        // Llama al método de modelo para actualizar el registro
        $response = PutModel::putData($table, $columns, $data, $id);
        
        // Crea una nueva instancia de PutController
        $return = new PutController();
        
        // Llama al método de respuesta para enviar la respuesta JSON
        $return->fncResponse($response);
    }

    /**
     * Método para manejar la respuesta de la solicitud de actualización.
     *
     */
    public function fncResponse($response)
    {
        // Verifica si la respuesta no está vacía (actualización exitosa)
        if (!empty($response)) {

            // Crea un array con el estado, método y resultados
            $json = array(
                "status" => 200,
                "method" => 'put',
                "results" => $response
            );

            // Envía la respuesta como JSON con el código de estado HTTP
            echo json_encode($json, http_response_code($json['status']));
            
        } else {

            // Si la respuesta está vacía (no se encontró el registro)
            $json = array(
                "status" => 404,
                "results" => 'Not found',
                "method" => 'put'
            );

            // Envía la respuesta como JSON con el código de estado HTTP
            echo json_encode($json, http_response_code($json['status']));
        }
    }

}
