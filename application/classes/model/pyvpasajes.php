<?php
defined('SYSPATH') or die ('no tiene acceso');
//descripcion del modelo productos
class Model_Pyvpasajes extends ORM{
    protected $_table_names_plural = false;
    
    public function pasaje_asignado($id){        
         $sql="select p.id_pyvfucov, p.tipo_pasaje, p.tramo_viaje, p.costo_salida, p.fecha_salida, p.hora_salida, p.costo_retorno, p.fecha_retorno, p.hora_retorno,
a.pais pais_origen, p.dep_origen, p.localidad_origen, b.pais pais_destino, p.dep_destino, p.localidad_destino
from pyvpasajes p inner join pyvpais a on p.id_pais_origen = a.id
inner join pyvpais b on p.id_pais_destino = b.id
where p.id_pyvfucov = $id";
        return DB::query(1, $sql)->execute();
    }    
}
?>
