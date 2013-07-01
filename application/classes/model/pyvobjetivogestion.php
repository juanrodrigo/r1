<?php
defined('SYSPATH') or die ('no tiene acceso');
//descripcion del modelo productos
class Model_Pyvobjetivogestion extends ORM{
    protected $_table_names_plural = false;
    public function codobjetivogestion($id){
        //$sql = "select id_obj_gestion, cod_objetivo_gestion from pyvobjetivogestion where id_unidad_funcional = $id;";
        $sql = "select id_obj_gestion, cod_objetivo_gestion from pyvobjetivogestion og inner join pyvunidadfuncional uf on og.id_unidad_funcional = uf.id where uf.id_oficina = $id";
        return DB::query(1, $sql)->execute();        
    }
    /*public function menus($n){
        $sql="SELECT m.id, m.menu, m.descripcion, m.controlador,m.logo FROM menus m
              INNER JOIN nivelmenu n ON m.id=n.id_menu
              WHERE n.id_nivel='$n'
              ORDER BY m.index";
        return $this->_db->query(Database::SELECT, $sql,TRUE);        
    }
    //cargar menu para pasajes y viaticos
    public function menus_pyv($id){
        $sql = "SELECT m.id, m.menu, m.descripcion, m.controlador,m.logo FROM menus m
                INNER JOIN nivelmenu n ON m.id=n.id_menu
                INNER JOIN pyvfuncionario f ON n.id_nivel= f.nivel
                WHERE f.id_user = $id";
        return $this->_db->query(Database::SELECT, $sql,TRUE);                   
    }*/
}

?>