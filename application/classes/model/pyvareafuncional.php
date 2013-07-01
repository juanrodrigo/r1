<?php
defined('SYSPATH') or die ('no tiene acceso');
//descripcion del modelo productos
class Model_Pyvareafuncional extends ORM{
    protected $_table_names_plural = false;    
    public function areas(){
        $sql="SELECT id_area_funcional, area_funcional FROM pyvareafuncional WHERE estado='1'";
        return $this->_db->query(Database::SELECT,$sql,TRUE);
    }
    public function unidadejec($id){
        $sql="select substring((select a.id_area_funcional from pyvfuncionario f inner join pyvareafuncional a on f.id_area_funcional = a.id_area_funcional where f.id_user = $id) from 1 for 1) as ue;";
        return $this->_db->query(Database::SELECT,$sql,TRUE);
    }
    
}
?>