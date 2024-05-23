<?php


require_once('connection.php');

class GetModel
{
    //Peticion a la base de datos sin filto
    static public function getData($table, $select, $order, $ordermode, $limit)
    {

        $selectArray = explode(",", $select);

        //Se valida que la tabla exista
        if (empty(Connection::getTable($table, $selectArray))) {
            return null;
        }

        //Se valida que la peticion tenga limites
        if ($limit != null) {
            $limitArray = explode(',', $limit);
        }

        $sql = "SELECT $select FROM $table";

        //Se valida que la peticion tenga orden
        $sql .= $order != null && $ordermode != null ? " ORDER BY $order $ordermode" : '';
        $sql .= $limit != null  ? " LIMIT $limitArray[0], $limitArray[1]" : '';



        $stmt = Connection::connect()->prepare($sql);
        $stmt->execute();

        //response
        return $stmt->fetchAll(PDO::FETCH_CLASS);
    }

    //Peticion a la base de datos sin filto
    static public function getDataFilter($table, $select, $to, $tovalue, $order, $ordermode, $limit)
    {
        $selectArray = explode(",", $select);
        //Se valida que la tabla exista
        if (empty(Connection::getTable($table, $selectArray))) {
            return null;
        }

        //Se convierte en array el parametro to y tovalue separados por una "," desconmponiendo los parametros
        $toArray = explode(',', $to);
        $tovalueArray = explode(',', $tovalue);
        $tofiltertext = '';

        //Se valida que la peticion tenga limites
        if ($limit != null) {
            $limitArray = explode(',', $limit);
        }

        //Se valida que tenga mas de un parametro de filtro y se recorren para generar la consulta completa
        if (count($toArray) > 1) {
            foreach ($toArray as $key => $value) {
                # code...
                if ($key > 0) {
                    $tofiltertext .= "AND $value = :$value ";
                }
            }
        }

        $sql = "SELECT $select FROM $table WHERE $toArray[0] = :$toArray[0] $tofiltertext";

        //Se valida que la peticion tenga orden
        $sql .= $order != null && $ordermode != null ? " ORDER BY $order $ordermode" : '';
        $sql .= $limit != null  ? " LIMIT $limitArray[0], $limitArray[1]" : '';
        $stmt = Connection::connect()->prepare($sql);

        //se recorren los valores enviados para parametrizarlos
        foreach ($toArray as $key => $value) {
            $stmt->bindParam(":" . $value, $tovalueArray[$key], PDO::PARAM_STR);
        }

        $stmt->execute();

        //response
        return $stmt->fetchAll(PDO::FETCH_CLASS);
    }
}
