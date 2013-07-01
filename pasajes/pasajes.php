<?php
if(isset($_POST['id'])){
$id=$_POST['id'];
$ops=$_POST['ops'];

require_once '../db/pyvdbclass.php';

$dbh=New pyvdb();
if($ops == 'funcionario'){
    $stmt = $dbh->prepare(" select f.id as id_funcionario, u.nombre
                            from users u inner join pyvfuncionario f on f.id_user = u.id
                            inner join pyvareafuncional af on f.id_area_funcional = af.id_area_funcional
                            where af.id_area_funcional = '$id'");
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
    $stmt = $dbh->prepare(" select u.cargo 
                            from users u inner join pyvfuncionario f on f.id_user = u.id
                            where f.id = $id");
    $stmt->execute();
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones=$fila->cargo;
    }
    echo $opciones;
}
if($ops == 'unidadEjecutora'){
    /*$stmt = $dbh->prepare(" select og.id_obj_gestion,og.cod_objetivo_gestion 
                            from pyvobjetivogestion og inner join pyvobjetivoespecifico oe on og.id_obj_gestion = oe.id_obj_gestion
                            where oe.id_area_funcional = '$id'
                            and og.estado = 'VIGENTE'");
    $stmt->execute();
    $opciones = '<option value="0">Seleccione una opcion</option>';
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones.='<option value="'.$fila->id_obj_gestion.'">'.$fila->cod_objetivo_gestion.'</option>';
    }
    echo $opciones;*/
    echo $id;
}
if($ops == 'detalleObjGestion'){
    $stmt = $dbh->prepare("select objetivo_gestion from pyvobjetivogestion where id_obj_gestion = $id and estado = 'VIGENTE'");
    $stmt->execute();    
    
        while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
        {        
            $opciones = $fila->objetivo_gestion;
        }
        
    echo $opciones;    
}
if($ops == 'codObjEsp'){
    $stmt = $dbh->prepare("select * from pyvobjetivoespecifico where id_obj_gestion =$id and estado = 'VIGENTE'");
    $stmt->execute();    
    $opciones = '<option value=""></option>';
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones.='<option value="'.$fila->id_obj_especifico.'">'.$fila->cod_objetivo_especifico.'</option>';
    }
    echo $opciones;
}
if($ops == 'codActividad'){
    $stmt = $dbh->prepare("select * from pyvactividades where id_obj_especifico = $id and estado = 'VIGENTE'");
    $stmt->execute();    
        while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
        {        
            $opciones = $fila->objetivo_gestion;
        }
        
    echo $opciones;
}
if($ops == 'detalleObjEsp'){
    $stmt = $dbh->prepare("select objetivo_especifico from pyvobjetivoespecifico where id_obj_especifico = $id and estado = 'VIGENTE'");
    $stmt->execute();    
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones = $fila->objetivo_especifico;
    }
    echo $opciones;    
}
if($ops == 'zona'){
    $stmt = $dbh->prepare("select id_zona, zona from pyvzona where tipo_viaje = '$id' and estado = 'VIGENTE'");
    $stmt->execute();    
    $opciones = '<option value=""></option>';
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones.='<option value="'.$fila->id_zona.'">'.$fila->zona.'</option>';
    }
    echo $opciones;
}
if($ops == 'paisOrigen'){
    $stmt = $dbh->prepare("select id_pais, pais from pyvpais where id_zona = $id and estado = 'VIGENTE' or id_tipo_viaje = 'I'");
    $stmt->execute();    
    $opciones = '<option value=""></option>';
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones.='<option value="'.$fila->id_pais.'">'.$fila->pais.'</option>';
    }
    echo $opciones;
}
if($ops == 'deptoOrigen'){
    $stmt = $dbh->prepare("select id_departamento, departamento from pyvdepartamento where id_pais = $id and estado = 'VIGENTE'");
    $stmt->execute();    
    $opciones = '<option value=""></option>';
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones.='<option value="'.$fila->id_departamento.'">'.$fila->departamento.'</option>';
    }
    echo $opciones;
}
if($ops == 'autorizadoPor')
{                           
        /*$sql="select id_area_funcional, area_funcional from pyvareafuncional where id_area_funcional = '$id'";
        $areafunc = DB::query(1, $sql)->execute();
        foreach ($areafunc as $a): $area = $a['id_area_funcional']; endforeach;        
        */
        $area = $id;
        $unidades = "and id_area_funcional in (";
        while(strlen($area)>0){            
            $unidades = $unidades."'".$area."',";
            $area = substr($area,0, -2);        
            }
        $unidades = $unidades."'A')";       
        
        $stmt = $dbh->prepare("select id_area_funcional, area_funcional from pyvareafuncional where estado = 'VIGENTE'".$unidades);
        $stmt->execute();    
        $opciones = '<option value=""></option>';
        while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
        {        
            $opciones.='<option value="'.$fila->id_area_funcional.'">'.$fila->area_funcional.'</option>';
        }
        echo $opciones;
        
}
if($ops == 'superior'){
    $stmt = $dbh->prepare(" select f.id as id_funcionario, u.nombre from users u inner join pyvfuncionario f on f.id_user = u.id 
                            inner join pyvareafuncional af on f.id_area_funcional = af.id_area_funcional
                            where af.id_area_funcional = '$id' and f.id_autoridad_competente = '1'");
    $stmt->execute();    
    $opciones = '<option value=""></option>';
    while ($fila = $stmt->fetch(PDO::FETCH_OBJ)) 
    {        
        $opciones.='<option value="'.$fila->id_funcionario.'">'.$fila->nombre.'</option>';
    }
    echo $opciones;
}
}
?>