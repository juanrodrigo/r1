<?php defined('SYSPATH') or die('No direct script access.'); ?>

2013-06-26 11:39:14 --- ERROR: Database_Exception [ 0 ]: [1054] Unknown column 'cp.codigo' in 'field list' ( select distinct ( concat(p.codigo_entidad,'-',org.codigo,'-',ft.codigo,'-',cp.codigo) ) id, 
concat(p.codigo_entidad,'-',org.codigo,'-',ft.codigo,'-',cp.codigo,' ',cp.cat_programatica) fuente
from pyvestructuraprogramatica p 
inner join pyvunidadfuncional uf on p.id_unidad_funcional = uf.id
inner join pyvorganismo org on org.id = p.id_organismo
inner join pyvfuente ft on ft.id = p.id_fuente
inner join pyvcatprogramatica cp on p.id_cat_programatica = cp.id
where uf.id_oficina = 104 ) ~ MODPATH\database\classes\kohana\database\mysql.php [ 181 ]
2013-06-26 11:44:16 --- ERROR: Database_Exception [ 0 ]: [1054] Unknown column 'cp.codigo' in 'field list' ( select distinct ( concat(p.codigo_entidad,'-',org.codigo,'-',ft.codigo,'-',cp.codigo) ) id, 
concat(p.codigo_entidad,'-',org.codigo,'-',ft.codigo,'-',cp.codigo,' ',cp.cat_programatica) fuente
from pyvestructuraprogramatica p 
inner join pyvunidadfuncional uf on p.id_unidad_funcional = uf.id
inner join pyvorganismo org on org.id = p.id_organismo
inner join pyvfuente ft on ft.id = p.id_fuente
inner join pyvcatprogramatica cp on p.id_cat_programatica = cp.id
where uf.id_oficina = 104 ) ~ MODPATH\database\classes\kohana\database\mysql.php [ 181 ]
2013-06-26 13:24:40 --- ERROR: Database_Exception [ 0 ]: [1054] Unknown column 'cp.codigo' in 'field list' ( select distinct ( concat(p.codigo_entidad,'-',org.codigo,'-',ft.codigo,'-',cp.codigo) ) id, 
concat(p.codigo_entidad,'-',org.codigo,'-',ft.codigo,'-',cp.codigo,' ',cp.cat_programatica) fuente
from pyvestructuraprogramatica p 
inner join pyvunidadfuncional uf on p.id_unidad_funcional = uf.id
inner join pyvorganismo org on org.id = p.id_organismo
inner join pyvfuente ft on ft.id = p.id_fuente
inner join pyvcatprogramatica cp on p.id_cat_programatica = cp.id
where uf.id_oficina = 104 ) ~ MODPATH\database\classes\kohana\database\mysql.php [ 181 ]
2013-06-26 13:34:40 --- ERROR: ErrorException [ 4096 ]: Argument 2 passed to Kohana_Form::select() must be of the type array, string given, called in E:\sistemas\codice\application\views\pyv\createfucov.php on line 1372 and defined ~ SYSPATH\classes\kohana\form.php [ 252 ]
2013-06-26 15:18:21 --- ERROR: Database_Exception [ 0 ]: [1062] Duplicate entry 'MDPyEP/2013-00216' for key 'PRIMARY' ( INSERT INTO `nurs` (`nur`, `id_user`, `fecha_creacion`, `username`) VALUES ('MDPyEP/2013-00216', '27', '2013-06-26 15:18:21', 'Romina Medina Santy') ) ~ MODPATH\database\classes\kohana\database\mysql.php [ 181 ]
2013-06-26 15:20:47 --- ERROR: Database_Exception [ 0 ]: [1062] Duplicate entry 'MDPyEP/2013-00216' for key 'PRIMARY' ( INSERT INTO `nurs` (`nur`, `id_user`, `fecha_creacion`, `username`) VALUES ('MDPyEP/2013-00216', '27', '2013-06-26 15:20:47', 'Romina Medina Santy') ) ~ MODPATH\database\classes\kohana\database\mysql.php [ 181 ]
2013-06-26 15:21:37 --- ERROR: ErrorException [ 8 ]: Undefined index: tipoViaje ~ APPPATH\classes\controller\pyv.php [ 137 ]
2013-06-26 15:30:54 --- ERROR: ErrorException [ 8 ]: Undefined index: tipoViaje ~ APPPATH\classes\controller\pyv.php [ 137 ]