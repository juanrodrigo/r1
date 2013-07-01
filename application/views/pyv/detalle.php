<script type="text/javascript">
    $(function(){      
        $('#cancelar').click(function(){ 
        $('#replace').show();
        $('#file-word').hide();       
    });   
});
</script>
<style>
    #file-word{ display: none;  }
    td{padding:5px;}    
</style>
<h1>DETALLESSSS...</h1>
<h2 class="subtitulo">Descripción<br/><span>descripcion general del documento</span></h2>
<a href="../../pdf/<?php echo strtolower($tipo)?>.php?id=<?php echo $d->id; ?>" class="uibutton" target="_blank" title="Imprimir documento" ><img src="/media/images/print.png"/> Imprimir PDF</a>
<div  style="width: 800px;   border: 1px solid #eee; height: 40%;  ">  
<table style=" width: 100%;" border="1px" >
    <tbody>
        <tr>
            <td colspan="2" align="center">
                <h2><?php echo strtoupper($tipo);?></h2>
                <h2 style="color: #23599B;"><?php echo $d->cite_original;?></h2>
                <h2><?php echo $d->nur;?></h2>
            </td>
        </tr>
        <tr>
        <td><b>A: </b></td>
        <td colspan="2"> <?php echo $d->nombre_destinatario;?><br/><b><?php echo $d->cargo_destinatario;?></b></td>
    </tr>
    <?php if(trim($d->nombre_via)!=''){ ?>
    <tr> 
        <td><b>VIA: </b><br/> </td>
        <td colspan="2"><?php echo $d->nombre_via;?><br/><b><?php echo $d->cargo_via;?></b></td>
    </tr>
    <?php } ?>
    <tr> 
        <td><b>DE: </b><br/> </td>
        <td><?php echo $d->nombre_remitente;?><br/><b><?php echo $d->cargo_remitente;?></b></td>
    </tr>
    <tr> 
        <td width="100"><b>FECHA DE CREACI&Oacute;N: </b><br/> </td>
        <td colspan="2"><?php echo  Date::fecha($d->fecha_creacion);?></td>
    </tr>
     <?php foreach($archivo as $a): ?>
    <tr> 
        <td><b>ARCHIVO:</b><br/></td>
        <td><?php echo HTML::anchor('/descargar.php?id='.$a->id,substr($a->nombre_archivo,13));?><br/></td>
    </tr>
    <?php ?>   
    <?php endforeach;?>
    <tr> <td><b>REFERENCIA:</b><br/> </td>
         <td colspan="2"><?php echo $d->referencia;?></td>
    </tr>
    
    <tr>  <td colspan="3">
            <div style="overflow:auto; width: 670px;">
           <?php echo $d->contenido;?>
            </div>
        </td>
    </tr>    
    </tbody>
</table>
    <div class="info" style="text-align:center;margin-top: 10px;">
    <p><span style="float: left; margin-right: .3em;" class=""></span>    
      &larr;<a onclick="javascript:history.back(); return false;" href="#" style="font-weight: bold; text-decoration: underline;  " > Regresar<a/></p>    
</div>
</div>
<div style=" width: 800px;"  >
<table style=" width: 100%;"  border="1px" >
    <tr>
        <td style="width: 140px;"></td>
        <td style="width: 200px;"></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="5">PARTE I. DECLARATORIA EN COMISION</td>                
    </tr>    
    <tr>
        <td><b>SERVIDOR PUBLICO:</b></td>
        <td colspan="4"><?php echo $f->nombre_user_comision;?><br />
            <b><?php echo $f->cargo_user_comision;?></b>
        </td>
    </tr>    
    <tr>
        <td><b>PROPOSITO DEL VIAJE:</b></td>
        <td colspan="4"><?php echo $d->referencia;?></td>
    </tr>
    <tr >
        <td><b>PROGRAMACION POA:</b></td>
        <td>CODIGO OBJETIVO GESTION:</td>
        <td colspan="3"><?php echo $og->cod_objetivo_gestion;?></td>
    </tr>
    <tr >
        <td></td>
        <td>DESCRIPCION:</td>
        <td colspan="3"><?php echo $og->objetivo_gestion;?></td>
    </tr>
    <tr >
        <td></td>
        <td>CODIGO OBJETIVO ESPECIFICO:</td>
        <td colspan="3"><?php echo $oe->cod_objetivo_especifico;?></td>
    </tr>
    <tr >
        <td></td>
        <td>DESCRIPCION:</td>
        <td colspan="3"><?php echo $oe->objetivo_especifico;?></td>
    </tr>
    <tr >
        <td><b>LUGAR Y FECHA DE DECLARATORIA:</b></td>
        <td></td>
        <td colspan="3"><?php echo Date::fecha($f->fecha_creacion);?></td>
    </tr>
    <tr>
        <td colspan="5">PARTE II. IDENTIFICACION DEL AREA QUE AUTORIZA EL VIAJE</td>                
    </tr>
    <tr>
        <td><b>DIRECCION / UNIDAD:</b></td>
        <td colspan="4"><?php echo $f->id_area_inmediato_superior;?></td>
    </tr><tr>
        <td><b>NOMBRE DE QUIEN AUTORIZA:</b></td>
        <td colspan="4"><?php echo $f->nombre_inmediato_superior;?><br />
        <b><?php echo $f->cargo_inmediato_superior;?></b>
        </td>
    </tr>
    <tr >
        <td><b>LUGAR Y FECHA DE AUTORIZACION DE VIAJE:</b></td>
        <td></td>
        <td colspan="3"></td>
    </tr>
    <tr>
        <td colspan="5">PARTE III. SOLICITUD DE PASAJES Y VIATICOS</td>                
    </tr>
    <tr>
        <td><b>PASAJES</b></td>
        <td colspan="4"></td>
    </tr>
     <tr>
        <td><?php $pasaje = array(); foreach ($pas as $p) $pasaje = $p;?>
        <b>RUTA:</b></td>
        <td colspan="4"><?php echo strtoupper($pasaje['dep_origen'].' - '.$pasaje['dep_destino']);?></td>        
    </tr>
    <tr>
        <td><b>TIPO PASAJE:</b></td>
        <td colspan="4"><?php if($pasaje['tipo_pasaje'] == 'no') echo 'NO CORRESPONDE';
                    else echo strtoupper($pasaje['tipo_pasaje']);?></td>
    </tr>
    <tr>
        <td><b>FECHA Y HORA DE SALIDA:</b></td>
        <td><?php echo Date::fecha($pasaje['fecha_salida']);?></td>
        <td>Hrs. <?php echo $pasaje['hora_salida'];?></td>
        <td><b>COSTO: </b><?php echo $pasaje['costo_salida']?></td>
        <td></td>
    </tr>
    <tr>
        <td><b>FECHA Y HORA DE RETORNO:</b></td>
        <td><?php echo Date::fecha($pasaje['fecha_retorno']);?></td>
        <td>Hrs. <?php echo $pasaje['hora_retorno'];?></td>
        <td><b>COSTO: </b><?php echo $pasaje['costo_retorno']?></td>
        <td></td>
    </tr>
    <tr>
        <td><b>VIATICOS:<?php //echo strtoupper($f->tipo_pasaje);?></b></td>
        <td colspan="4"><?php //echo $f->tipo_pasaje;?></td>
    </tr>
    <tr>
        <td><b>CATEGORIA:</b></td>
        <td colspan="4"><?php   if ($f->categoria_funcionario == 1) echo 'MINISTRA';
                    if ($f->categoria_funcionario == 2) echo 'VICEMINISTRO';
                    if ($f->categoria_funcionario == 3) echo 'Director General, Asesores, Jefes de unidad, Profesionales, Analistas, T&eacute;cnicos y personal no comprendido en las anteriores categor&iacute;as';
                    ?>
        </td>        
    </tr>
        <tr>
        <td><b>VIATICOS POR DIA:</b></td>
        <td><?php $v =$f->viatico_dia; echo $v.' '.$f->moneda;?></td>
        <td colspan="3"><b>TIPO CAMBIO: &nbsp;</b><?php $t = $f->tipo_cambio; echo $t;?></td>
    </tr>
    </tr>
        <tr>
        <td><b>VIAJE PAGO:</b></td>
        <td colspan="4"> <?php $fin = $f->financiamiento_viatico; echo $fin.' %';?></td>
    </tr>
    <tr>
        <td><b>N° DE DIAS:</b></td>
        <td colspan="4"><?php $dias = $f->num_dias; echo $dias;?></td>
    </tr>
    <tr>
        <td><b>TOTAL VIATICOS:</b></td>        
        <td colspan="4"><?php echo ($v*$dias*$fin)/100 ;?>                      
        </td>         
    </tr>
    <tr>
        <td><b>TOTAL PASAJES:</b></td>        
        <td colspan="4"><?php echo ($pasaje['costo_salida']+$pasaje['costo_retorno']) ;?>                      
        </td>         
    </tr>
</table>
<?php echo Date::adjust(3, 'pm');?>
</div>
