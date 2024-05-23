<?php
require('models/post.model.php');

class PostController
{
    
    static public function postData($table, $data){

        $response = PostModel::postData($table, $data);
        $return = new PostController();
        $return->fncResponse($response);
    }

     //respuesta del controlador
     public function fncResponse($response)
     {
         if (!empty($response)) {
             $json = array(
                 "status" => 200,
                 "method" => 'post',
                 "results" => $response
             );
             echo json_encode($json, http_response_code($json['status']));
         } else {
 
             $json = array(
                 "status" => 404,
                 "results" => 'Not found',
                 "method" => 'post'
             );
             echo json_encode($json, http_response_code($json['status']));
         }
     }

}
