<?php
if(isset($_POST['id'])){
$id=$_POST['id'];
$ops=$_POST['ops'];

require_once '../db/pyvdbclass.php';

$dbh=New pyvdb();
if($ops == 'funcionario'){
    $stmt = $dbh->prepare(" select id id_funcionario, nombre from users where id_oficina = $id");
    $stmt->execute();    
$opciones = '<option value=""></option>';
while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
{        
    $opciones.='<option value="'.$fila->id_funcionario.'">'.$fila->nombre.'</option>';
}
echo $opciones;
//echo $id;
}
if($ops == 'cargo'){
    $stmt = $dbh->prepare(" select cargo from users where id = $id");
    $stmt->execute();
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones=$fila->cargo;
    }
    echo $opciones;
}
if($ops == 'autorizadoPor')
{
        $area = $id;
        $padre = 1;
        $ides = '';
        $cont = 0;
        $unidades = " where id in ( ";
        while($padre <> 0){                       
            $unidades = $unidades.$area;
            $stmt = $dbh->prepare("select id, padre, oficina from oficinas where id =  $area");
            $stmt->execute();
            $fila = $stmt->fetch(PDO::FETCH_OBJ);
            if( $fila->padre == 0){
               $padre = 0;
               $unidades = $unidades.')';
               }
            else
               {$area = $fila->padre;
               $unidades = $unidades.",";
               }
        }        
        $stmt = $dbh->prepare("select id, oficina from oficinas".$unidades);
        $stmt->execute();    
        $opciones = '<option value=""></option>';
        while ($fila = $stmt->fetch(PDO::FETCH_OBJ))
            $opciones.='<option value="'.$fila->id.'">'.$fila->oficina.'</option>';        
        echo $opciones;        
}
if($ops == 'superior'){
    $stmt = $dbh->prepare(" select u.id, u.nombre 
                            from users u inner join pyvfuncionario f on u.id = f.id_user 
                            where u.id_oficina = $id and f.id_autoridad_competente = 1");
    $stmt->execute();    
    $opciones = '<option value=""></option>';
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones.='<option value="'.$fila->id.'">'.$fila->nombre.'</option>';
    }
    echo $opciones;
}
if($ops == 'detalleObjGestion'){
    $stmt = $dbh->prepare("select objetivo_gestion from pyvobjetivogestion where id_obj_gestion = $id and estado = 1");
    $stmt->execute();    
    
        while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
        {        
            $opciones = $fila->objetivo_gestion;
        }
        
    echo $opciones;    
}
if($ops == 'codObjEsp'){
    //$stmt = $dbh->prepare("select * from pyvobjetivoespecifico where id_obj_gestion =$id and estado = 'VIGENTE'");
    $stmt = $dbh->prepare("select * from pyvobjetivoespecifico where id_obj_gestion =$id and estado = 1");
    $stmt->execute();    
    $opciones = '<option value=""></option>';
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones.='<option value="'.$fila->id_obj_especifico.'">'.$fila->cod_objetivo_especifico.'</option>';
    }
    echo $opciones;
}
if($ops == 'codActividad'){
    //$stmt = $dbh->prepare("select * from pyvactividades where id_obj_especifico = $id and estado = 'VIGENTE'");
    $stmt = $dbh->prepare("select * from pyvactividades where id_obj_especifico = $id and estado = 1");
    $stmt->execute();    
        while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
        {        
            $opciones = $fila->objetivo_gestion;
        }
        
    echo $opciones;
}
if($ops == 'detalleObjEsp'){
    //$stmt = $dbh->prepare("select objetivo_especifico from pyvobjetivoespecifico where id_obj_especifico = $id and estado = 'VIGENTE'");
    $stmt = $dbh->prepare("select objetivo_especifico from pyvobjetivoespecifico where id_obj_especifico = $id and estado = 1");
    $stmt->execute();    
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones = $fila->objetivo_especifico;
    }
    echo $opciones;    
}
if($ops == 'zona'){
    //$stmt = $dbh->prepare("select id, zona from pyvzona where tipo_viaje = '$id' and estado = 'VIGENTE'");
    $stmt = $dbh->prepare("select id, zona from pyvzona where tipo_viaje = '$id' and estado = 1");
    $stmt->execute();    
    $opciones = '<option value=""></option>';
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones.='<option value="'.$fila->id_zona.'">'.$fila->zona.'</option>';
    }
    echo $opciones;
}
if($ops == 'paisOrigen'){    
    $stmt = $dbh->prepare("select id, pais from pyvpais where id_zona = $id and estado = 1 or id_tipo_viaje = 'I'");
    $stmt->execute();    
    $opciones = '<option value="" ></option>';
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        if($fila->pais == 'BOLIVIA')
            $opciones.='<option value="'.$fila->id.'" selected >'.$fila->pais.'</option>';
        else
            $opciones.='<option value="'.$fila->id.'" >'.$fila->pais.'</option>';
    }
    echo $opciones;
}
if($ops == 'deptoOrigen'){
    //$stmt = $dbh->prepare("select id_departamento, departamento from pyvdepartamento where id_pais = $id and estado = 'VIGENTE'");
    $stmt = $dbh->prepare("select id_departamento, departamento from pyvdepartamento where id_pais = $id and estado = 1");
    $stmt->execute();    
    $opciones = '<option value=""></option>';
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones.='<option value="'.$fila->id_departamento.'">'.$fila->departamento.'</option>';
    }
    echo $opciones;
}
if($ops == 'categoria'){
    $stmt = $dbh->prepare("select id_categoria from pyvfuncionario where id_user = $id");
    $stmt->execute();    
        while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
            $opciones = $fila->id_categoria;
    echo $opciones;    
}
if($ops == 'categoriazona'){
    $id_cat = $_POST['id_cat'];
    $stmt = $dbh->prepare("select viatico, moneda from pyvcategoriazona where id_categoria = $id_cat and id_zona = $id");
    $stmt->execute();        
        while ($fila = $stmt->fetch(PDO::FETCH_OBJ))            
            $opciones = $fila->moneda.';'.$fila->viatico;
    echo $opciones;    
}
if($ops == 'fuentePresupuesto'){
    $stmt = $dbh->prepare("select cp.id, cp.cat_programatica categoria 
from pyvobjetivoespecifico oe inner join pyvobjespcatprog cat on oe.id_obj_especifico = cat.id_objetivoespecifico
inner join pyvcatprogramatica cp on cat.id_catprogramatica = cp.id
where oe.id_obj_especifico = $id");
    $stmt->execute();    
    $opciones = '<option value=""></option>';
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones.='<option value="'.$fila->id.'">'.$fila->categoria.'</option>';
    }
    echo $opciones;
}
}
?>