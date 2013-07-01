<script type="text/javascript">
function buscar(id,ops,ctrl,tipo){    
    var parametros = {"id" : id,"ops" : ops};    
    $.ajax({
        data:  parametros,        
        url:   '/pasajes/pyvajax.php',
        type:  'post',
        dataType: "html",
        success:  function (response)
        {   if(tipo == 'combo')
                $(ctrl).html(response);
            if(tipo == 'txt')
                $(ctrl).val(response);            
        }   
});}
function calcular(id,ctrl){
    if ( ctrl == 'fechaIda' || ctrl == 'fechaRet' || ctrl == 'harribo')
    {           
        var fecha1 = $('#fechaSalidaIda').val();
        var fecha2 = $('#fechaArriboRet').val();
        var diferencia =  Math.floor(( Date.parse(fecha2) - Date.parse(fecha1) ) / 86400000);        
        if(diferencia < 0) {diferencia = diferencia*(-1);}
        if(diferencia == 0)
            diferencia = 1;
        else{
            if($('#horaArriboRet').val()>'12:00')
                diferencia += 1;
        }
        $('#dias_cal').val(diferencia);
    }
    var id_cat = $('#categoria_cal').val();
    var id_zona = $('#zona').val();
    //viatico
    if( id_zona && id_cat)
    {
    ops = "categoriazona";
        var parametros = {"id" : id_zona, "id_cat" : id_cat,"ops" : ops};    
        $.ajax({
            data:  parametros,
            url:   '/pasajes/pyvajax.php',
            type:  'post',
            dataType: "html",
            success:  function (response)
            {                   
                $("#viaticoDia").val(response.substring(3, response.length));
                $("#moneda").val(response.substring(0, 2));
                var viaticos = parseFloat($("#viaticoDia").val());
                var dias = $("#dias_cal").val();
                var factor = $("input[name='viaticoFinanciadoPor']:checked").val();                  
                $("#totalViaticos").val((viaticos * dias * factor) /100);                
            }   
        });  
    }
}
$(function(){    
$('#areas').change(function(){
        var id = $('#areas').val();
        if(!id){ $('#funcionario').val(''); $('#cargo').val('');}
        else{
            var ctrl = $('#funcionario');
            var ops = 'funcionario';
            var tipo = 'combo';            
            buscar(id,ops,ctrl,tipo);            
            ctrl = $('#autorizadoPor'); ops = 'autorizadoPor';
            buscar(id,ops,ctrl,tipo);
            $('#viaticoDia').val(0);            
            }                    
});
$('#funcionario').change(function(){        
        var id = $('#funcionario').val();        
        //var dest = $("#funcionario option:selected").html();         
        if(!id) {$('#cargo').val(''); $('#nombreFuncionario').val('');}
        else{
            var ctrl = $('#cargo');
            var ops = 'cargo';
            var tipo = 'txt';
            buscar(id,ops,ctrl,tipo);
            var ops = 'categoria';
            var ctrl = $('#categoria_cal');    
            buscar(id,ops,ctrl,tipo);           
            
            $('#zona').val('');
            $('#viaticoDia').val(0);
            $('#moneda').val('');
            $('#total').val(0);
            $('#nombreFuncionario').val($("#funcionario option:selected").html());
            }
});
$('#autorizadoPor').change(function(){ 
        var id = $('#autorizadoPor').val();
        if(!id) $('#autorizadoPor').val();
        else{
            var ctrl = $('#superior');
            var ops = 'superior';
            var tipo = 'combo';
            buscar(id,ops,ctrl,tipo);
            }
});
$('#superior').change(function(){ 
        var id = $('#superior').val();
        var nom = $('#superior option:selected').html();
        if(!id) {$('#cargoSuperior').val(); $('#nombreSuperior').val('');}
        else{             
            var ctrl = $('#cargoSuperior');
            var ops = 'cargo';                                                
            var tipo = 'txt';
            buscar(id,ops,ctrl,tipo);
            $('#nombreSuperior').val(nom);
            }                
});
$('#autoridad').change(function(){ 
        var id = $('#autoridad').val();
        var dest = $("#autoridad option:selected").html();
        if(!id) {$('#cargoAutoridad').val();$('#nombreAutoridad').val('');}
        else{
            var ctrl = $('#cargoAutoridad');
            var ops = 'cargo';
            var tipo = 'txt';
            buscar(id,ops,ctrl,tipo);
            $('#nombreAutoridad').val(dest);
            }                
});
$('#codObjGestion').change(function(){
        var id = $('#codObjGestion').val();
        if(!id){
            $('#codObjEsp').html('<option value="" selected="true"></option>');
            $('#detalleObjGestion').val('');
            $('#detalleObjEsp').val('')
            $('#fuenteFinanciamiento').val('');;
            }
        else{
            var ctrl = $('#detalleObjGestion');
            var ops = 'detalleObjGestion';
            var tipo = 'txt';
            buscar(id,ops,ctrl,tipo); 
            ctrl = $('#codObjEsp'); ops = 'codObjEsp'; tipo = 'combo';
            buscar(id,ops,ctrl,tipo);
            }
});
$('#codObjEsp').change(function(){
        var id = $('#codObjEsp').val();
        if(!id){
            $('#detalleObjEsp').val('');
            $('#codActividad').html('<option value="" selected="true"></option>');
            $('#fuenteFinanciamiento').val('');
            }
        else{                        
            var ctrl = $('#detalleObjEsp');            
            var ops = 'detalleObjEsp'; 
            var tipo = 'txt';
            buscar(id,ops,ctrl,tipo);
            ctrl = $('#codActividad');            
            ops = 'codActividad';
            tipo = 'combo';
            buscar(id,ops,ctrl,tipo);
            ctrl = $('#fuentePresupuesto');
            ops = 'fuentePresupuesto';            
            buscar(id,ops,ctrl,tipo);            
            }
                
});
$('#zona').change(function(){
        var id = $('#zona').val();        
        if(!id){ $('#paisOrigen').val(''); $('#paisDestino').val('');
        }
        else{            
                var ctrl = $('#paisOrigen');
                var ops = 'paisOrigen';
                var tipo = 'combo';
                buscar(id,ops,ctrl,tipo);
                ctrl = $('#paisDestino');
                buscar(id,ops,ctrl,tipo);
                calcular(id,'zona');            
            }                
});
$('#paisOrigen').change(function(){
        var id = $('#paisOrigen').val();        
        if(!id){ $('#deptoOrigen').val('');
        }
        else{            
                var ctrl = $('#deptoOrigen');
                var ops = 'deptoOrigen';
                var tipo = 'combo';
                buscar(id,ops,ctrl,tipo);
            }                
});
$('#paisDestino').change(function(){
        var id = $('#paisDestino').val();        
        if(!id){ $('#deptoDestino').val('');
        }
        else{            
                var ctrl = $('#deptoDestino');
                var ops = 'deptoOrigen';
                var tipo = 'combo';
                buscar(id,ops,ctrl,tipo);
            }
                
});
$('#pasajeFinanciadoPor').change(function(){
        var id = $('#pasajeFinanciadoPor').val();
        if(!id || id != 'otro') {
                $("#financiadorPasaje").attr("disabled", "disabled");
                $("#financiadorPasaje").val('');
                }
        else{
                $("#financiadorPasaje").removeAttr("disabled");
                $('#financiadorPasaje').focus();                
            }
        if(id == 'mdp')                
            $("#asignarPasaje").css("display", "block");                
        else{
            $("#asignarPasaje").css("display", "none");
        $('#totalPasajes').val(0); $('#pasajeIda').val(0); $('#pasajeRetorno').val(0);
        $('#costoIda').val(0);$('#costoRet').val(0);        
        }
});
$("input[name=viaticoFinanciadoPor]:radio").click(function(){
    var selection=$(this).val();    
    if(selection == '100'){
        $("#justRenuncia").attr("disabled","disabled");$("#justRenuncia").val('');
        $("#financiadorViatico").attr("disabled","disabled");$("#financiadorViatico").val('');
        }
    else{
        if(selection == '70' || selection == '25' ){
            $("#financiadorViatico").removeAttr("disabled");
            $("#justRenuncia").attr("disabled","disabled");$("#justRenuncia").val('');
            $("#alcance1").removeAttr("disabled");$("#alcance2").removeAttr("disabled");}
        else
            {
                $("#justRenuncia").removeAttr("disabled");
                $("#financiadorViatico").attr("disabled","disabled");$("#financiadorViatico").val('');
                $("#alcance1").attr("disabled","disabled");$("#alcance2").attr("disabled","disabled");
                }
        }
        
    calcular(selection,'radio');
});
$("#costoIda,#costoRet").keydown(function(event) {
    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 ||
        (event.keyCode == 65 && event.ctrlKey === true) || (event.keyCode >= 35 && event.keyCode <= 39) || (event.keyCode == 110 || event.keyCode == 190) ) {
            return;
        }
        else {
        
            if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105) ) {
                event.preventDefault();
            }
        }   
});

$("#finicio,#fconclusion,#factividad1,#factividad2,#fechaSalidaIda,#fechaArriboRet").keydown(function(event) {
    return false;
    });
$("#viaticoDia,#moneda,#dias_cal").keydown(function(event) {
    return false;
    });

$("#costoIda,#costoRet").blur(function(){
    var ida = parseFloat($("#costoIda").val());
    var ret = parseFloat($("#costoRet").val());    
    if(!ida || ida < 0) ida = 0;
    if(!ret || ret < 0) ret = 0;
    $("#pasajeIda").val(ida);$("#costoIda").val(ida);
    $("#pasajeRetorno").val(ret);$("#costoRet").val(ret);
    $("#totalPasajes").val(ida + ret);
});
$("#horaArriboRet").change(function(){
    id = $("#horaArriboRet").val();
    calcular(id,'harribo');    
});
$.datepicker.regional['es'] = {
            closeText: 'Cerrar',
            prevText: '&#x3c;Ant',
            nextText: 'Sig&#x3e;',
            currentText: 'Hoy',
            monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
                'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
            monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
                'Jul','Ago','Sep','Oct','Nov','Dic'],
            dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
            dayNamesShort: ['Dom','Lun','Mar','Mie','Juv','Vie','Sab'],
            dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
            weekHeader: 'Sm',
            dateFormat: 'dd/mm/yy',
            //dateFormat: 'Full - DD, d MM, yy',
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: ''};
        $.datepicker.setDefaults($.datepicker.regional['es']); 
        var pickerOpts = { changeMonth: true, minDate: 0, changeYear: true, yearRange: "-10:+1", dateFormat: 'D yy-mm-dd'};
        var pickerOpts1 = { changeMonth: true, minDate: 0, changeYear: true, yearRange: "-10:+1", dateFormat: 'yy-mm-dd'};        
        var pickerOpts2 = { changeMonth: true, minDate: 0, changeYear: true, yearRange: "-10:+1", dateFormat: 'yy-mm-dd',onSelect: function(){ var id = $("#fechaSalidaIda").val(); calcular(id,'fechaIda');}};
        var pickerOpts3 = { changeMonth: true, minDate: 0, changeYear: true, yearRange: "-10:+1", dateFormat: 'yy-mm-dd',onSelect: function(){ var id = $("#fechaArriboRet").val(); calcular(id,'fechaRet');}};                
      $("#finicio,#fconclusion").datepicker(pickerOpts,$.datepicker.regional['es']);
      $("#factividad1,#factividad2,#factividad3").datepicker(pickerOpts1,$.datepicker.regional['es']);
      $("#fechaSalidaIda").datepicker(pickerOpts2,$.datepicker.regional['es']);
      $("#fechaArriboRet").datepicker(pickerOpts3,$.datepicker.regional['es']);      
    var tabContainers=$('div.tabs > div');
tabContainers.hide().filter(':first').show();
$('div.tabs ul.tabNavigation a').click(function(){
    tabContainers.hide();
    tabContainers.filter(this.hash).show();
    $('div.tabs ul.tabNavigation a').removeClass('selected');
    $(this).addClass('selected');
    return false;
}).filter(':first').click();
    
$('#frmCreate').validate();

    var config={
    toolbar : [ ['Maximize','Preview','SelectAll','Cut', 'Copy','Paste', 'Pagebreak','PasteFromWord','PasteText','-','Bold','Italic','Underline','FontSize','Font','TextColor','BGColor',,'NumberedList','BulletedList'],
                ['Undo','Redo','-','SpellChecker','Scayt','-','Find','Replace','-','Table','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock']]
    }
$('#crear').click(function(){
$('#frmCreate').submit();
});
$("input.file").si();
});

</script>

<style type="text/css">
    form#frmCreate{ padding: 0 5px; margin: 0;}
    .cke_contents{height: 500px;}
    cke_skin_kama{border: none;}
    div.si label.cabinet {
	width: 156px;
	height: 34px;
	display: block;
	overflow: hidden;
	position: relative;
	z-index: 3;
	float: left;
          cursor: pointer; 
}
div.si label.cabinet input {
	position: relative;
	left: -140px;
	top: 0;
	height: 100%;
	width: auto !important;
	z-index: 2;
	opacity: 0;
	-moz-opacity: 0;
	filter:progid:DXImageTransform.Microsoft.Alpha(opacity=0);
}
div.si div.uploadButton {
	position: relative;
	float: left;
}
div.si div.uploadButton div {
	width: 156px;
	height: 34px;
	background: url(/media/images/examinar.png) 0 0 no-repeat;
	left: -156px;
	position: absolute;
	z-index: 1;

}
div.si label.selectedFile {
	margin-left: 5px;
	line-height: 34px;
}
textarea {
	resize: none;
} 
</style>
<form action="/pyv/crear/<?php echo $documento->action;?>" method="post" id="frmCreate">
<h2 class="subtitulo">Crear <?php echo $documento->action;?> <br/><span>LLENE CORRECTAMENTE LOS DATOS EN EL FORMULARIO</span></h2>
<div class="tabs">
    <ul class="tabNavigation">        
        <li><a href="#declaratoria">Declaratoria Comisi&oacute;n</a></li>       
        <li><a href="#actividades">Actividad Programada</a></li>
        <li><a href="#poa-ppt">Certificado POA-PPT</a></li>
        <li><a href="#itinerario">Itinerario de Viaje</a></li>
        <li><a href="#viaticos">Vi&aacute;ticos</a></li>
    </ul>
<div id="declaratoria"> 
<div class="formulario"  > 
<div style="border-bottom: 1px solid #ccc; background: #F2F7FC; display: block; padding: 10px 0;   width: 125.6%;  ">    
<h2 align="center">Informaci&oacute;n del Memor&aacute;ndun</h2>
<br />
<fieldset>
<table width="100%" border="1px">
                <tr>
                    <td>
                    <p>
                    <?php echo Form::label('destinatario', 'Nombre del destinatario:',array('class'=>'form'));?>
                    </p>                       
                    </td>
                    <td><?php echo Form::input('destinatario','',array('id'=>'destinatario','size'=>40,'class'=>'required'));?></td>
                    <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td> 
                    <td><?php echo Form::label('remitente', 'Remitente:',array('class'=>'form'));?></td>
                    <td><?php echo Form::input('remitente',$user->nombre,array('id'=>'remitente','size'=>35,'class'=>'required')); ?></td>
                    <td><?php echo Form::input('mosca',$user->mosca,array('id'=>'mosca','size'=>5));?></td>
                </tr>
                <tr>
                    <td><?php echo Form::label('destinatario', 'Cargo Destinatario:',array('class'=>'form'));?></td>
                    <td><p><?php echo Form::input('cargo_des','',array('id'=>'cargo_des','size'=>40,'class'=>'required'));?></p></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td><?php echo Form::label('cargo', 'Cargo Remitente:',array('class'=>'form')); ?></td>
                    <td><?php echo Form::input('cargo_rem',$user->cargo,array('id'=>'cargo_rem','size'=>40,'class'=>'required')); ?></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><?php echo Form::label('adjuntos', 'Adjunto:',array('class'=>'form')); ?></td>
                    <td><?php echo Form::input('adjuntos','',array('id'=>'adjuntos','size'=>40,'title'=>'Ejemplo: Lo citado'));?></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><?php echo Form::label('copias', 'Con copia a:',array('class'=>'form')); ?></td>
                    <td><?php echo Form::input('copias','',array('id'=>'adjuntos','size'=>40));?></td>
                    <td></td>
                </tr>                
                <tr>
                <td colspan="6" style="padding-left: 5px;">
                <?php
                echo Form::label('referencia', 'Prop&oacute;sito del del Viaje:',array('class'=>'form'));?> 
                    <textarea name="referencia" id="referencia" style="width: 500px;" class="required"></textarea>
                
                </td>
                </tr>
</table>
<table width="100%" border="1px">
    <tr>
        <td>
            <p>
                <?php                  
                echo Form::label('areas', 'Unidad Funcional:',array('class'=>'form'));                
                ?>
                </p>
        </td>
        <td>        
        <select name="areas" id="areas" class="required" style="width: 400px;"><option value="" selected></option>
            <?php foreach($areafuncional as $v=>$value){echo '<option value="'.$v.'">'.$value.'</option>';}?>    
        </select>
                      
        </td>
    </tr>
    <tr>
        <td>
            <?php 
                echo Form::label('funcionario','Funcionario en Comisi&oacute;n',array('class'=>'form'));
            ?>
        </td>
        <td>                
        <select id="funcionario" name="funcionario" style="width: 400px;" class="required" ><option value="" selected="true"></option></select>
        <input type="text" id="nombreFuncionario" name="nombreFuncionario" />                
        </td>        
    </tr>
    <tr>
    <td><?php
                echo Form::label('cargo','Cargo del Funcionario',array('class'=>'form'));
            ?>
        </td>
        <td>
            <input id="cargo" name="cargo" type="text" class="required" size="75"/>            
        </td>
    </tr>
    <tr>
        <td>
            <?php
                echo Form::label('autorizadoPor','Autorizado por:',array('class'=>'form'));                
            ?> 
        </td>
        <td>            
            <select id="autorizadoPor" name="autorizadoPor" style="width: 400px;" class="required" ><option value="" selected="true"></option></select>
        </td>
    </tr>
    <tr>
        <td>
            <?php
                echo Form::label('superior','Inmediato Superior:',array('class'=>'form'));                
            ?> 
        </td>
        <td>            
            <select id="superior" name="superior" style="width: 400px;" class="required" ><option value="" selected="true"></option></select>
            <input type="hidden" id="nombreSuperior" name="nombreSuperior" />
        </td>
        
    </tr>
    <tr>
        <td><?php
                echo Form::label('cargosuperior','Cargo Inmediato Superior:',array('class'=>'form'));
            ?> 
        </td>
                <td>            
            <input id="cargoSuperior" name="cargoSuperior" class="required" type="text" size="75"/>
        </td>
    </tr>

    <tr>
        <td><?php
                echo Form::label('finicio','Fecha y Hora de Inicio Comisi&oacute;n:',array('class'=>'form'));
            ?> 
        </td>
        <td>
            <input type="text" name="finicio" id="finicio" class="required" value="<?php //echo date('D d-m-Y');?>"/>
            <select name="hinicio" id="hinicio" class="required"><option value="" selected="true"></option>
            <?php for($i=7; $i<=23 ; $i++){
                    for($j=0;$j<60;$j+=30){
                        if($i<10){$h="0".$i;}else{$h=$i;}
                        if($j<10){$m="0".$j;}else{$m=$j;}                        
                        echo '<option value="'.$h.":".$m.'">'.$h.":".$m.'</option>';
                    }
                }?>    
            </select>
        </td>
    </tr>
    <!--<tr>
        <td><?php
                echo Form::label('hinicio','Hora de Inicio de Comisi&oacute;n:',array('class'=>'form'));
            ?> 
        </td>
        <td>
            <select name="hinicio" id="hinicio" class="required"><option value="" selected="true"></option>
            <?php for($i=7; $i<=23 ; $i++){
                    for($j=0;$j<60;$j+=30){
                        if($i<10){$h="0".$i;}else{$h=$i;}
                        if($j<10){$m="0".$j;}else{$m=$j;}                        
                        echo '<option value="'.$h.":".$m.'">'.$h.":".$m.'</option>';
                    }
                }?>    
            </select>            
        </td>
    </tr>-->
    <tr>
        <td><?php
                echo Form::label('fconclusion','Fecha y Hora de Conclusi&oacute;n Comisi&oacute;n:',array('class'=>'form'));
            ?> 
        </td>
        <td>
            <input type="text" name="fconclusion" id="fconclusion" class="required" value="<?php //echo date('D d-m-Y');?>"/>
            <select name="hconclusion" id="hconclusion" class="required"><option value="" selected="true"></option>
            <?php for($i=7; $i<=23 ; $i++){
                    for($j=0;$j<60;$j+=30){
                        if($i<10){$h="0".$i;}else{$h=$i;}
                        if($j<10){$m="0".$j;}else{$m=$j;}
                        echo '<option value="'.$h.":".$m.'">'.$h.":".$m.'</option>';
                    }
                }?>    
            </select>
        </td>
    </tr>
    <!--<tr>
        <td><?php
                echo Form::label('hconclusion','Hora de Conclusi&oacute;n Comisi&oacute;n:',array('class'=>'form'));
            ?> 
        </td>
        <td><select name="hconclusion" id="hconclusion" class="required"><option value="" selected="true"></option>
            <?php for($i=7; $i<=23 ; $i++){
                    for($j=0;$j<60;$j+=30){
                        if($i<10){$h="0".$i;}else{$h=$i;}
                        if($j<10){$m="0".$j;}else{$m=$j;}
                        echo '<option value="'.$h.":".$m.'">'.$h.":".$m.'</option>';
                    }
                }?>    
            </select>
        </td>
    </tr>-->
    <!--
    <tr>
        <td><?php
                echo Form::label('resolucion','Resoluci&oacute;n Ministerial/Presidencial:',array('class'=>'form'));
            ?> 
        </td>
        <td><?php
                echo Form::input('resolucion');
            ?>
        </td>
    </tr>
    <tr>
        <td><?php
                echo Form::label('fresolucion','Fecha Resoluci&oacute;n:',array('class'=>'form'));
            ?> 
        </td>
        <td><?php
                echo Form::input('fresolucion');
            ?>
        </td>
    </tr>-->
</table>
<!--(*) Si no cuenta con el Registro Beneficiario Sigma, la Unidad Financiera no podr&aacute; realizar el pago de vi&aacute;ticos anticipado.-->
</fieldset>
</div>
</div>
</div><!--Fin declaratoria-->

<div id="actividades" >    
        <div class="formulario">  
        <div style="border-bottom: 1px solid #ccc; background: #F2F7FC; display: block; padding: 10px 0;   width: 125.6%;  ">      
       <h2 align="center">Actividades Programadas</h2>
       
    <table border="1" >
        <thead>
            <tr>
                <th>Nro.</th>
                <th>Fecha</th>                
                <th>Tipo</th>
                <th>Lugar</th>
                <th>Actividad</th>
                <th>&nbsp;&nbsp;</th>
                <th>Resultados Esperados</th>
                
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td><input type="text" id="factividad1" name="factividad1" value="<?php //echo date('d-m-Y');?>" class="required"/></td>
                <td><select name="tipo1" id="tipo1" class="required" ><option value="" selected="true"></option><option value="reunion">Reuni&oacute;n</option>
                <option value="taller">Taller</option><option value="curso">Curso</option><option value="otro">Otro</option></select></td>
                <td><?php echo Form::input('lugar1','',array('id'=>'lugar1','class'=>'required'));?></td>
                <td><textarea name="actividad1" id="actividad1" style="width: 250px;" class="required"></textarea></td>                
                <th>&nbsp;&nbsp;</th>
                <td><textarea name="resultado1" id="resultado1" style="width: 250px;" class="required" ></textarea></td>                
            </tr>
            <tr>
                <td>2</td>
                <td><input type="text" id="factividad2" name="factividad2" value="<?php //echo date('d-m-Y');?>" /></td>
                <td><select name="tipo2" id="tipo2"><option value="" selected="true"></option><option value="reunion">Reuni&oacute;n</option>
                <option value="taller">Taller</option><option value="curso">Curso</option><option value="otro">Otro</option></select></td>
                <td><?php echo Form::input('lugar2','',array('id'=>'lugar2'));?></td>
                <td><textarea name="actividad2" id="actividad2" style="width: 250px;" ></textarea></td>                
                <th>&nbsp;&nbsp;</th>
                <td><textarea name="resultado2" id="resultado2" style="width: 250px;" ></textarea></td>                
            </tr>            
            <!--<tr>
                <td>3</td>
                <td><input type="text" id="factividad3" name="factividad3" value="<?php //echo date('d-m-Y');?>"/></td>
                <td><select name="tipo3" id="tipo3"><option value="" selected="true"></option><option value="1">Reuni&oacute;n</option>
                <option value="2">Taller</option><option value="3">Curso</option><option value="4">Otro</option></select></td>
                <td><?php echo Form::input('lugar3','',array('id'=>'lugar3'));?></td>
                <td><textarea name="actividad3" id="actividad3" style="width: 250px;" ></textarea></td>                
                <th>&nbsp;&nbsp;</th>
                <td><textarea name="resultado3" id="resultado3" style="width: 250px;" ></textarea></td>                
            </tr>-->            
        </tbody>    
    </table>    
        </div>
    </div>
</div>

<div id="poa-ppt">
    <div class="formulario">        
    <div style="border-bottom: 1px solid #ccc; background: #F2F7FC; display: block; padding: 10px 0;   width: 125.6%;  ">
    
    <h2 style="text-align:center;">Certificaci&oacute;n POA </h2><hr/>
    <fieldset>
        <table width="100%" border="1px">
            <tr>
                <td><?php //echo $ue;?>
                    <?php echo Form::label('unidad_ejecutora','Unidad Ejecutora:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('unidadEjecutora',$unidadejecutora,array('size'=>'75','id'=>'unidadEjecutora','name'=>'unidadEjecutora','disabled'=>'true'))?>
                    <input type="hidden" id="idUnidadEjecutora" name="idUnidadEjecutora" value="<?php echo $idunidadejecutora;?>" />                    
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('autoridad','Autoridad Competente:',array('class'=>'form'));?>
                </td>
                <td>
                     <select  id="autoridad" name="autoridad" style=" width: 200px;" class="required" >
                        <option value="" selected="true"></option>
                        <?php  foreach ($autoridadcompetente as $d):?> 
                        <option value="<?php echo $d['id'];?>"><?php  echo $d['nombre'];?></option>                          
                        <?php   endforeach; ?>
                    </select>
                    <input type="hidden" id="nombreAutoridad" name="nombreAutoridad"/>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('cargoAutoridad','Cargo Autoridad Competente:',array('class'=>'form'));?>
                </td>
                <td>
                    <input type="text" id="cargoAutoridad" name="cargoAutoridad" class="required" size="75" />
                </td>
            </tr>
            <!--<tr>
                <td>
                    <?php echo Form::label('codPoaUE','C&oacute;digo POA Unidad Ejecutora:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('codPoaUE','',array('class'=>'form'));?>
                </td>
            </tr>-->
            <tr>
                <td>
                    <?php echo Form::label('codObjGestion','C&oacute;digo Objetivo de Gesti&oacute;n:',array('class'=>'form'));?>
                </td>
                <td>
                    <select id="codObjGestion" name="codObjGestion" style="width: 400px;" class="required" >
                    <option value="" selected="true"></option>
                    <?php foreach ($objetivogestion as $d): ?>
                        <option value="<?php echo $d['id_obj_gestion'];?>"><?php  echo $d['cod_objetivo_gestion'];?></option>                                            
                    <?php endforeach;?>
                    </select>                    
                    <?php //echo Form::select('codObjGestion', array('standard'=>'Standard Shipping','express'=>'Express Shipping','international'=>'International',));?>                    
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('detalleObjGestion','Detalle Objetivo de Gesti&oacute;n:',array('class'=>'form'));?>
                </td>
                <td>
                    <br />
                    <textarea name="detalleObjGestion" id="detalleObjGestion" style="width: 600px;" disabled="true" ></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('codObjEsp','C&oacute;digo Objetivo Espec&iacute;fico:',array('class'=>'form'));?>
                </td>
                <td>
                    <select id="codObjEsp" name="codObjEsp" style="width: 400px;" class="required" >
                    <option value="" selected="true"></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('detalleObjEsp','Detalle Objetivo Espec&iacutefico:',array('class'=>'form'));?>
                </td>
                <td>
                    <textarea name="detalleObjEsp" id="detalleObjEsp" style="width: 600px;" disabled="true" ></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('codActividad','C&oacute;digo Actividad:',array('class'=>'form'));?>
                </td>
                <td>
                    <select id="codActividad" name="codActividad" style="width: 400px;" disabled="true">
                    <option value="" selected="true"></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('detalleActividad','Detalle Actividad:',array('class'=>'form'));?>
                </td>
                <td>
                    <textarea name="detalleActividad" id="detalleActividad" style="width: 600px;" disabled="true" ></textarea>
                </td>
            </tr>
        </table>
    </fieldset> 
    </div>   
    </div>
</div>
    
<div id="itinerario">
    <div class="formulario">
    <div style="border-bottom: 1px solid #ccc; background: #F2F7FC; display: block; padding: 10px 0;   width: 125.6%;  ">    
    <h2 style="text-align:center;">Itinerario de Viaje </h2><hr/>
    <fieldset>
        <table width="100%" border="1px">
            <tr>
                <td>
                </td>
                <td>
                    Tramo de viaje inicial
                </td>
            </tr>
            <!--<tr>
                <td>
                    <?php echo Form::label('tipoViaje','Tipo de Viaje:',array('class'=>'form'));?>
                </td>
                <td>
                    <select name="tipoViaje" id="tipoViaje" class="required" style="width: 200px;">
                    <option value="" selected="true"></option>
                    <option value="I">Interior del Pa&iacute;s</option>
                    <option value="E">Exterior del Pa&iacute;s</option>
                    </select>
                </td>
            </tr>-->
            <tr>
                <td>
                    <?php echo Form::label('tipoTransporte','Medio de Transporte:',array('class'=>'form','class'=>'required'));?>
                </td>
                <td>
                    <select name="tipoTransporte" id="tipoTransporte" class="required" style="width: 200px;">
                    <option value="" selected="true"></option>
                    <option value="aereo">V&iacute;a L&iacute;nea de Transporte A&eacute;reo</option>
                    <option value="terrestre">V&iacute;a L&iacute;nea de Transporte Terrestre</option>
                    <option value="vehiculo">V&iacute;a Veh&iacute;culo Oficial</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('zona','Zona:',array('class'=>'form'));?>
                </td>
                <td>
                    <select name="zona" id="zona" class="required" style="width: 200px;">
                    <option value="" selected="true"></option>
                    <?php foreach($zona as $v=>$value){echo '<option value="'.$v.'">'.$value.'</option>';}?>                    
                    </select>                   
                </td>
            </tr>            
            <tr>
                <td>
                    Informaci&oacute;n del Origen
                </td>
                <td>                    
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('paisOrigen','Pa&iacute;s de Origen:',array('class'=>'form'));?>
                </td>
                <td>
                    <select name="paisOrigen" id="paisOrigen" class="required" style="width: 200px;">
                        <option value="" selected="true"></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('deptoOrigen','Departamento / Estado:',array('class'=>'form'));?>
                </td>
                <td>
                    <!--<select name="deptoOrigen" id="deptoOrigen" class="required" style="width: 200px;">
                        <option value="" selected="true"></option>
                    </select>-->
                    <?php echo Form::input('deptoOrigen','',array('class'=>'from','id'=>'deptoOrigen','class'=>'required'));?>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('ciudadOrigen','Ciudad / Localidad:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('ciudadOrigen','',array('class'=>'form','id'=>'ciudadOrigen','class'=>'required'));?>
                </td>
            </tr>
            <tr>
                <td>
                    Informaci&oacute;n del Destino
                </td>
                <td>                    
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('paisDestino','Pa&iacute;s Destino:',array('class'=>'form'));?>
                </td>
                <td>
                    <select name="paisDestino" id="paisDestino" class="required" style="width: 200px;">
                        <option value="" selected="true"></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('depDestino','Departamento / Estado:',array('class'=>'form'));?>
                </td>
                <td>
                    <!--<select name="deptoDestino" id="deptoDestino" class="required" style="width: 200px;">
                        <option value="" selected="true"></option>
                    </select>-->
                    <?php echo Form::input('deptoDestino','',array('class'=>'from','id'=>'deptoDestino','class'=>'required'));?>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('ciudadDestino','Ciudad / Localidad:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('ciudadDestino','',array('class'=>'form','class'=>'required','id'=>'ciudadDestino'));?>
                </td>
            </tr>
            <tr>
                <td>                 
                </td>
                <td>
                    Financiamiento del Transporte
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('pasaje','Pasaje Financiado Por:',array('class'=>'form'));?>
                </td>
                <td>
                    <select name="pasajeFinanciadoPor" id="pasajeFinanciadoPor" class="required" style="width: 350px;">
                    <option value="" selected="true"></option>
                    <option value="mdp">Ministerio de Desarrollo Productivo y Econom&iacute;a Plural</option>
                    <option value="otro">Otra Instituci&oacute;n</option>
                    <option value="no">No Corresponde</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('financiadorPasaje','Instituci&oacute;n que financia:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('financiadorPasaje','',array('class'=>'form','id'=>'financiadorPasaje','class'=>'required'));?>
                </td>
            </tr>            
        </table>
<h2 style="text-align:center;">Informaci&oacute;n del Viaje, (C&aacute;lculo de vi&aacute;ticos) </h2><hr/>        
        <table width="100%" border="1px" >
            <tr>
                <td>
                    <?php echo Form::label('fechaSalidaIda','Fecha de Salida:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php //echo Form::input('fechaSalidaIda','',array('class'=>'form','id'=>'fechaSalidaIda'))?>
                    <input type="text" id="fechaSalidaIda" name="fechaSalidaIda" value="<?php echo date('Y-m-d');?>" />
                </td>
                <td>
                    <?php echo Form::label('fechaArriboRet','Fecha de Arribo:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php // echo Form::input('fechaArriboRet','',array('class'=>'form','id'=>'fechaArriboRet'))?>
                    <input type="text" id="fechaArriboRet" name="fechaArriboRet" value="<?php echo date('Y-m-d');?>" />
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('horaSalidaIda','Hora de Salida:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php // echo Form::input('horaSalidaIda','',array('class'=>'form','id'=>'horaSalidaIda'))?>
                    <select name="horaSalidaIda" id="horaSalidaIda" class="required"><option value="" selected="true"></option>
                    <?php for($i=7; $i<=23 ; $i++){
                    for($j=0;$j<60;$j+=30){
                        if($i<10){$h="0".$i;}else{$h=$i;}
                        if($j<10){$m="0".$j;}else{$m=$j;}
                        
                        if($h.":".$m == "07:30")
                            echo '<option value="'.$h.":".$m.'" selected >'.$h.":".$m.'</option>';
                        else
                            echo '<option value="'.$h.":".$m.'">'.$h.":".$m.'</option>';
                        
                        }
                    }?>    
            </select> 
                </td>
                <td>
                    <?php echo Form::label('horaArriboRet','Hora de Arribo:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php // echo Form::input('horaArriboRet','',array('class'=>'form','id'=>'horaArriboRet'))?>
           <select name="horaArriboRet" id="horaArriboRet" class="required"><option value="" selected="true"></option>
                    <?php for($i=7; $i<=23 ; $i++){
                    for($j=0;$j<60;$j+=30){
                        if($i<10){$h="0".$i;}else{$h=$i;}
                        if($j<10){$m="0".$j;}else{$m=$j;}
                        if($h.":".$m == "12:30")
                            echo '<option value="'.$h.":".$m.'" selected >'.$h.":".$m.'</option>';
                        else
                            echo '<option value="'.$h.":".$m.'">'.$h.":".$m.'</option>';
                        }
                    }?>    
            </select> 
                </td>
            </tr>            
        </table>
        <div id="asignarPasaje" style="display: none;">
        <h2 style="text-align:center;">Asignaci&oacute;n de PASAJES </h2><hr/>
        <table width="100%" border="1px">                  
            <tr>
                <td colspan="2" style="text-align: center;" >Informaci&oacute;n de Pasaje de Ida
                </td>
                <td colspan="2" style="text-align: center;" >Informaci&oacute;n del Pasaje de Vuelta
                </td>                
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('empresaIda','Empresa de Transporte:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('empresaIda','',array('class'=>'form','id'=>'empresaIda'))?>
                </td>
                <td>
                    <?php echo Form::label('empresaRet','Empresa de Transporte:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('empresaRet','',array('class'=>'form','id'=>'empresaRet'))?>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('boletoIda','No. Boleto:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('boletoIda','',array('class'=>'form','id'=>'boletoIda'))?>
                </td>
                <td>
                    <?php echo Form::label('boletoRet','No. Boleto:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('boletoRet','',array('class'=>'form','id'=>'boletoRet'))?>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('costoIda','Costo del Pasaje:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('costoIda','0',array('class'=>'form','id'=>'costoIda'))?>
                </td>
                <td>
                    <?php echo Form::label('costoRet','Costo del Pasaje:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('costoRet','0',array('class'=>'form','id'=>'costoRet'))?>
                </td>
            </tr>
        </table>
        </div>
    </fieldset>
  <!--    <div id="asignarPasaje" style="display: none;">   
         <h2 style="text-align:center;">Asignaci&oacute;n de Pasajes </h2><hr/>
       
    <fieldset>
        <table width="100%" border="1px">
            <tr>
                <td colspan="2" style="text-align: center;" >Informaci&oacute;n de Pasaje de Ida
                </td>
                <td colspan="2" style="text-align: center;" >Informaci&oacute;n del Pasaje de Vuelta
                </td>                
            </tr>
            <tr>
                <td>
                    <?php /* echo Form::label('empresaIda','Empresa de Transporte:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('empresaIda','',array('class'=>'form','id'=>'empresaIda'))?>
                </td>
                <td>
                    <?php echo Form::label('empresaRet','Empresa de Transporte:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('empresaRet','',array('class'=>'form','id'=>'empresaRet'))?>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('boletoIda','No. Boleto:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('boletoIda','',array('class'=>'form','id'=>'boletoIda'))?>
                </td>
                <td>
                    <?php echo Form::label('boletoRet','No. Boleto:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('boletoRet','',array('class'=>'form','id'=>'boletoRet'))?>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('costoIda','Costo del Pasaje:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('costoIda','',array('class'=>'form','id'=>'costoIda'))?>
                </td>
                <td>
                    <?php echo Form::label('costoRet','Costo del Pasaje:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('costoRet','',array('class'=>'form','id'=>'costoRet'))?>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('fechaSalidaIda','Fecha de Salida:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('fechaSalidaIda','',array('class'=>'form','id'=>'fechaSalidaIda'))?>
                </td>
                <td>
                    <?php echo Form::label('fechaArriboRet','Fecha de Arribo:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php echo Form::input('fechaArriboRet','',array('class'=>'form','id'=>'fechaArriboRet'))?>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('horaSalidaIda','Hora de Salida:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php // echo Form::input('horaSalidaIda','',array('class'=>'form','id'=>'horaSalidaIda'))?>
                    <select name="horaSalidaIda" id="horaSalidaIda" class="required"><option value="" selected="true"></option>
                    <?php for($i=8; $i<=23 ; $i++){
                    for($j=0;$j<60;$j+=30){
                        if($i<10){$h="0".$i;}else{$h=$i;}
                        if($j<10){$m="0".$j;}else{$m=$j;}
                        //echo '<option value="'.$i.'">'.$h.":".$m.'</option>';
                        echo '<option value="'.$h.":".$m.'">'.$h.":".$m.'</option>';
                        }
                    }?>    
            </select> 
                </td>
                <td>
                    <?php echo Form::label('horaArriboRet','Hora de Arribo:',array('class'=>'form'));?>
                </td>
                <td>
                    <?php // echo Form::input('horaArriboRet','',array('class'=>'form','id'=>'horaArriboRet'))?>
                    <select name="horaArriboRet" id="horaArriboRet" class="required"><option value="" selected="true"></option>
                    <?php for($i=8; $i<=23 ; $i++){
                    for($j=0;$j<60;$j+=30){
                        if($i<10){$h="0".$i;}else{$h=$i;}
                        if($j<10){$m="0".$j;}else{$m=$j;}
                        //echo '<option value="'.$i.'">'.$h.":".$m.'</option>';
                        echo '<option value="'.$h.":".$m.'">'.$h.":".$m.'</option>';
                        }
                    }*/?>    
            </select> 
                </td>
            </tr>            
        </table>
    </fieldset>            
    </div>-->
    
    
    </div> 
    </div>
</div>


<div id="viaticos">
    <div class="formulario">        
    <div style="border-bottom: 1px solid #ccc; background: #F2F7FC; display: block; padding: 10px 0;   width: 125.6%;  ">    
    <h2 style="text-align:center;">Vi&aacute;ticos</h2><hr/>
    <fieldset>
        <table style="width: 100%;" border="1px">
            <tr>
                <td>
                </td>
                <td>                    
                </td>
                <td colspan="2">ASIGNACION DE VI&Aacute;TICOS                    
                </td>                
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('viaticoFinanciadoPor','Financiado por:',array('class'=>'form'));?>
                </td>
                <td>
                </td>
                <td colspan="2">                  
                </td>                
            </tr> 
             <tr>
                <td>                    
                </td>
                <td><?php echo Form::radio('viaticoFinanciadoPor','100',TRUE,array('class'=>'required','id'=>'viaticoFinanciadoPor','name'=>'viaticoFinanciadoPor'));?> </td>
                <td colspan="2"><?php echo Form::label('viaticoFinanciadoPor','Ministerio de Desarrollo Productivo y Econom&iacute;a Plural.',array('class'=>'form'));?> </td>
            </tr>
            <tr>
                <td>                    
                </td>
                <td>
                </td>
                <td colspan="2">&nbsp;                  
                </td>                
            </tr>                     
            <tr>
                <td>                    
                </td>
                <td>                    
                </td>
                <td colspan="2"><?php echo Form::label('financiadorViatico','Otra Instituci&oacute;n:',array('class'=>'form'));?>
                    <?php echo Form::input('financiadorViatico','',array('class'=>'form','size'=>'75','id'=>'financiadorViatico','class'=>'required','disabled'=>'true'));?>
                </td>
               
            </tr>            
            <tr>
                <td>                    
                </td>
                <td>                    
                </td>
                <td colspan="2"><?php echo Form::label('alcance','Alcance del Financiamiento:',array('class'=>'form'));?>
                </td>
                
            </tr>
            <tr>                
                <td>                    
                </td>
                <td><?php echo Form::radio('viaticoFinanciadoPor','70',FALSE,array('class'=>'required','id'=>'viaticoFinanciadoPor','name'=>'viaticoFinanciadoPor'));?>
                </td>
                <td colspan="2">
                <?php echo Form::label('hospedaje','S&oacute;lo Hospedaje:',array('class'=>'form'));?>
                </td>
            </tr>
            <tr>
                <td>                    
                </td>                
                <td><?php echo Form::radio('viaticoFinanciadoPor','25',FALSE,array('class'=>'required','id'=>'viaticoFinanciadoPor','name'=>'viaticoFinanciadoPor'));?>
                </td>
                <td colspan="2">
                <?php echo Form::label('alimentacion','Hospedaje y Alimentaci&oacute;n:',array('class'=>'form'));?>
                </td>
            </tr>
                         <tr>
                <td>                    
                </td>
                <td>
                </td>
                <td colspan="2">&nbsp;                  
                </td>                
            </tr> 
            <tr>
                <td>                    
                </td>
                <td><?php echo Form::radio('viaticoFinanciadoPor', '0',array('id'=>'viaticoFinanciadoPor','name'=>'viaticoFinanciadoPor'));?>
                </td>
                <td colspan="2"><?php echo Form::label('renuncia','Renuncia de Vi&aacute;ticos:',array('class'=>'form'));?>
                </td>                
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td colspan="2"><?php echo Form::label('justRenuncia','Justificaci&oacute;n por la Renuncia:',array('class'=>'form'));?>
                <textarea name="justRenuncia" id="justRenuncia" style="width: 450px;" class="required" disabled="true" ></textarea>                
                </td>                
            </tr>
            <tr>
                <td>
                </td>
                <td>                    
                </td>
                <td colspan="2">FUENTE DE FINANCIAMIENTO                    
                </td>
                
            </tr>
            <tr>
                <td>
                    <?php echo Form::label('fuentePresupuesto','Fuente Presupuestaria:',array('class'=>'form'));?>
                </td>
                <td>                    
                </td>
                <td colspan="2">
                    <select name="fuentePresupuesto" id="fuentePresupuesto" style="width: 400px;">
                        <option value="" selected="true"></option>                    
                    </select>
                    <?php //echo Form::select('fuentePresupuesto', $fuente, NULL);
                    //echo Form::select('fuentePresupuesto', NULL);?>            
                </td>                
            </tr>           
        </table>
        
    </fieldset>  
    </div>  
    </div>
</div>
</div>

<div style="border-bottom: 1px solid #ccc; background: #F2F7FC; display: block; padding: 10px 0;   width: 58.3%;  ">
<table border="1px" >     
     <tr>
        <td><?php echo Form::label('viaticos','VI&Aacute;TICO POR D&Iacute;A : ',array('class'=>'form'));?></td>
        <td><?php echo Form::input('viaticoDia','0',array('class'=>'form','id'=>'viaticoDia','size'=>'25'))?></td>
        <td><?php echo Form::input('moneda','',array('class'=>'form','id'=>'moneda','size'=>'5'))?></td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>        
        <td><?php echo Form::label('pasajes','PASAJE DE IDA : ',array('class'=>'form'));?></td>
        <td><?php echo Form::input('pasajeIda','0',array('class'=>'form','id'=>'pasajeIda','disabled'=>'true','size'=>'25'))?></td>
     </tr>
      <tr>
        <td><?php echo Form::label('dias','D&Iacute;AS : ',array('class'=>'form'));?></td>
        <td><?php echo Form::input('dias','1',array('class'=>'form','id'=>'dias_cal','name'=>'dias_cal','size'=>'25'))?></td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td></td>
        <td><?php echo Form::label('pasajes','PASAJE DE RETORNO : ',array('class'=>'form'));?></td>
        <td><?php echo Form::input('pasajeRetorno','0',array('class'=>'form','id'=>'pasajeRetorno','disabled'=>'true','size'=>'25'))?></td>
     </tr>
     <tr>
        <td><?php echo Form::label('totalViaticos','TOTAL VI&Aacute;TICOS : ',array('class'=>'form'));?></td>
        <td><?php echo Form::input('totalViaticos','0',array('class'=>'form','id'=>'totalViaticos','name'=>'totalViaticos','disabled'=>'true','size'=>'25'))?></td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td></td>
        <td><?php echo Form::label('totalPasajes','TOTAL PASAJES: ',array('class'=>'form'));?></td>
        <td><?php echo Form::input('totalPasajes','0',array('class'=>'form','id'=>'totalPasajes','name'=>'totalPasajes','disabled'=>'true','size'=>'25'))?></td>
     </tr>
</table>

</div>
<br />
<input type="hidden" id="categoria_cal" name="categoria_cal" />
<input type="submit" value="Crear documento" class="uibutton" name="submit" id="crear" title="Crear documento nuevo"  />
<input type="text" id="mensaje" name="mensaje" />
</form>
</div>