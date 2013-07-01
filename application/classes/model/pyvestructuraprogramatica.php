<?php
defined('SYSPATH') or die ('no tiene acceso');
//descripcion del modelo productos
class Model_Pyvestructuraprogramatica extends ORM{
    protected $_table_names_plural = false;
    public function fuente($id){
        $sql="select distinct ( concat(p.codigo_entidad,'-',org.codigo,'-',ft.codigo,'-',cp.codigo) ) id, 
concat(p.codigo_entidad,'-',org.codigo,'-',ft.codigo,'-',cp.codigo,' ',cp.cat_programatica) fuente
from pyvestructuraprogramatica p 
inner join pyvunidadfuncional uf on p.id_unidad_funcional = uf.id
inner join pyvorganismo org on org.id = p.id_organismo
inner join pyvfuente ft on ft.id = p.id_fuente
inner join pyvcatprogramatica cp on p.id_cat_programatica = cp.id
where uf.id_oficina = $id";
        return $this->_db->query(Database::SELECT,$sql,TRUE);
    }
        
}
?>