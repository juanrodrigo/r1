<?php
defined('SYSPATH') or die ('no tiene acceso');
//descripcion del modelo productos
class Model_Pyvunidadfuncional extends ORM{
    protected $_table_names_plural = false;

    public function unidadejecutora($id){
        $sql = "select o.id, o.oficina from oficinas o where id = (
                select uf.ue_presupuestaria 
                from pyvunidadfuncional uf inner join users us on uf.id_oficina = us.id_oficina 
                where us.id = $id)";
        return DB::query(1, $sql)->execute();
    }
    
    public function autoridadcompetente($id){
        $area = $id;
        $padre = 1;
        $unidades = " and u.id_oficina in ( ";
        while($area <> 0){
            $unidades = $unidades.$area;
            $sql = "select id, padre, oficina from oficinas where id =  $area";
            $areas = DB::query(1, $sql)->execute();
            foreach($areas as $fila) {$area = $fila['padre'];}
            if( $area == 0)
               $unidades = $unidades.')';
            else
               $unidades = $unidades.",";
        }
        $sql="select u.id, u.nombre from users u inner join pyvfuncionario f on u.id = f.id_user where f.id_autoridad_competente = 1".$unidades;
        $autoridad = DB::query(1, $sql)->execute();
        return $autoridad;
    }

    public function autorizadopor($id){
        $area = $id;
        $padre = 1;
        $ides = '';
        $cont = 0;
        $unidades = " where id in ( ";
        while($padre <> 0){ 
            $unidades = $unidades.$area;
            $sql = "select id, padre, oficina from oficinas where id =  $area";
            $areas = DB::query(1, $sql)->execute();
            foreach($areas as $fila) {$area = $fila['padre'];}
            if($area == 0){
               $padre = 0;
               $unidades = $unidades.')';
               }
            else
               {$area = $fila['padre'];
               $unidades = $unidades.",";
               }
        }        
        $sql = "select id, oficina from oficinas".$unidades;
        $areas = DB::query(1,$sql)->execute();
        /*$opciones = '<option value=""></option>';
        foreach ($areas as $fila)
            $opciones.='<option value="'.$fila['id'].'">'.$fila['oficina'].'</option>';
        return $opciones;*/
        return $areas;
    }
}
?>