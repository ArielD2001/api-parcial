<?php

// Se requiere el modelo de eliminación
require('models/delete.model.php');

class DeleteController {

    /**
     * Método estático para eliminar datos de la base de datos.
     *
     * @param int|string $id     ID del registro a eliminar.
     * @param string     $table  Nombre de la tabla en la base de datos.
     */
    static public function deleteData($id, $table) {
      
        // Llama al método de modelo para eliminar el registro
        $response = DeleteModel::deleteData($id, $table);
        
        // Crea una nueva instancia de DeleteController
        $return = new DeleteController();
        
        // Llama al método de respuesta para enviar la respuesta JSON
        $return->fncResponse($response);
    }

    /**
     * Método para manejar la respuesta de la solicitud de eliminación.
     *
     */
    public function fncResponse($response) {
        
        // Verifica si la respuesta no está vacía (eliminación exitosa)
        if (!empty($response)) {
            
            // Crea un array con el estado, método y resultados
            $json = array(
                "status" => 200,
                "method" => 'delete',
                "results" => $response
            );
            
            // Envía la respuesta como JSON con el código de estado HTTP
            echo json_encode($json, http_response_code($json['status']));
            
        } else {
            
            // Si la respuesta está vacía (no se encontró el registro)
            $json = array(
                "status" => 404,
                "results" => 'Not found',
                "method" => 'delete'
            );
            
            // Envía la respuesta como JSON con el código de estado HTTP
            echo json_encode($json, http_response_code($json['status']));
        }
    }

}
