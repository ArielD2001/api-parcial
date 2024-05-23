<?php

require_once('connection.php');

class PostModel
{
    static public function postData($table, $data)
    {
        if (empty($data)) {
            return null;
        }

        $columns = implode(',', array_keys($data));
        $placeholders = ':' . implode(',:', array_keys($data));

        $conn = Connection::connect();

        try {
            $sql = "INSERT INTO $table ($columns) VALUES($placeholders)";
            $stmt = $conn->prepare($sql);

            foreach ($data as $key => $value) {
                $stmt->bindParam(":$key", $data[$key], PDO::PARAM_STR);
            }

            if ($stmt->execute()) {
                $response = array(
                    "comment" => "The process was successful",
                    "lastId" => $conn->lastInsertId()
                );
                return $response;
            } else {
                return array("error" => $stmt->errorInfo());
            }
        } catch (PDOException $e) {
            return array("error" => $e->getMessage());
        }
    }
}