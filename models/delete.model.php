<?php

require_once('connection.php');


class DeleteModel{
    static public function deleteData($id, $table){
    
        $conn = Connection::connect();


        try {
            $sql = "SELECT * FROM $table WHERE id = :id";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':id', $id, PDO::PARAM_STR);
            $stmt->execute();

            $num = $stmt->rowCount();
            

            if($num != 0){
                $sql = "DELETE FROM $table  WHERE id = :id";
            $stmt = $conn->prepare($sql);
            
            $stmt->bindParam(':id', $id,  PDO::PARAM_STR);

            if ($stmt->execute()) {
                $response = array(
                    "comment" => "The delete was successful",
                );
                return $response;
            } else {
                return array("error" => $stmt->errorInfo());
            }
            }else{
                $response = array(
                    "comment" => "el id no coincide con ningun registro",
                );
                return $response;
            }
        } catch (PDOException $e) {
            return array("error" => $e->getMessage());
        }
        
    }
}