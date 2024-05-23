<?php


class Connection
{

    static public function infoDatabase()
    {

        $info = array(

            "database" => "api-electiva",
            "user" => "root",
            "pass" => ""

        );

        return $info;
    }

    static public function connect()
    {

        try {

            $conn = new PDO(
                'mysql:host=localhost;dbname=' . Connection::infoDatabase()['database'],
                Connection::infoDatabase()['user'],
                Connection::infoDatabase()['pass']
            );

            $conn->exec('set names utf8');
        } catch (PDOException $e) {
            print "¡Error!: " . $e->getMessage() . "<br/>";
            die();
        }

        return $conn;
    }

    static public function getTable($table, $columns)
    {

        $database = Connection::infoDatabase()['database'];

        if (in_array("*", $columns)) {

            return Connection::connect()
            ->query("SELECT COLUMN_NAME AS ITEM FROM information_schema.columns WHERE table_schema = '$database' AND table_name = '$table'")
            ->fetchAll(PDO::FETCH_OBJ);

        } else {
            $validate = Connection::connect()
                ->query("SELECT COLUMN_NAME AS ITEM FROM information_schema.columns WHERE table_schema = '$database' AND table_name = '$table'")
                ->fetchAll(PDO::FETCH_OBJ);
            $sum = 0;
            if (empty($validate)) {
                return null;
            } else {
                foreach ($validate as $key => $value) {
                    $sum += (in_array($value->ITEM, $columns));
                }
                return $sum == count($columns) ? $validate : null;
            }
        }
    }

    
}
