<?php

require_once('connection.php');

class PutModel
{
    static public function putData($table,$columns, $data, $id)
    {
        if (empty($data)) {
            return null;
        }
        $set = '';
      
        foreach ($columns as $key => $value) {
            $set .= " $value = :$value, ";
        }

        $set = substr($set, 0, -1);
        $set = substr($set, 0, -1);

        $conn = Connection::connect();

        try {
            $sql = "SELECT * FROM $table WHERE id = :id";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':id', $id, PDO::PARAM_STR);
            $stmt->execute();
            $res = $stmt->fetch();
            
            $num = $stmt->rowCount();
            

            if($num != 0){
                $sql = "UPDATE $table SET $set  WHERE id = :id";
                $stmt = $conn->prepare($sql);
                foreach ($columns as $key => $value) {
    
                    $stmt->bindParam(":$value", $data[$key],  PDO::PARAM_STR);
                }
                $stmt->bindParam(':id', $id,  PDO::PARAM_STR);
    
                if ($stmt->execute()) {
                    $response = array(
                        "comment" => "The update was successful",
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
