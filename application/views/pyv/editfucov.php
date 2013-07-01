<script type="text/javascript">   
    CKEDITOR.config.scayt_autoStartup = false;  
    // needs to migrate your pages to licensed server version from trial          
    CKEDITOR.config.scayt_maxSuggestions = 4;  
    // needs to migrate to hosted service from trial  
    // set up encrypted customer id           
    // set up SCAYT default language   
    CKEDITOR.config.scayt_sLang ="es_ES"; 
    function InsertHTML(imagen)
    {
        // Get the editor instance that we want to interact with.
        var oEditor = CKEDITOR.instances.descripcion;
        //var value = document.getElementById( 'plainArea' ).value;
        var value='<img src="'+imagen+'" />';
        // Check the active editing mode.
        if ( oEditor.mode == 'wysiwyg' )
        {
            // Insert the desired HTML.
            oEditor.insertHtml( value );
        }
        else
            alert( 'You must be on WYSIWYG mode!' );
    }
    $(function(){
        var tabContainers=$('div.tabs > div');
        tabContainers.hide().filter(':first').show();
        $('div.tabs ul.tabNavigation a').click(function(){
            tabContainers.hide();
            tabContainers.filter(this.hash).show();
            $('div.tabs ul.tabNavigation a').removeClass('selected');
            $(this).addClass('selected');
            return false;
        }).filter(':first').click();
    
    
        $('#frmEditar').validate();
        var config={
            toolbar : [ ['Maximize','Preview','SelectAll','Cut', 'Copy','Paste', 'Pagebreak','PasteFromWord','PasteText','-','Bold','Italic','Underline','FontSize','Font','TextColor','BGColor',,'NumberedList','BulletedList'],
                ['Undo','Redo','-','SpellChecker','Scayt','-','Find','Replace','-','Table','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock']]
        }
        $('textarea#descripcion').ckeditor(config);
        $('#insertarImagen').click(function(){
            var left=screen.availWidth;
            var top=screen.availHeight;
            left=(left-700)/2;
            top=(top-500)/2;
            var r=window.showModalDialog("../otros/imagenes","","center:0;dialogWidth:600px;dialogHeight:450px;scroll=yes;resizable=yes;status=yes;"+"dialogLeft:"+left+"px;dialogTop:"+top+"px");
            InsertHTML(r[0]);
        });
        $('#subirImagen').click(function(){
            var left=screen.availWidth;
            var top=screen.availHeight;
            left=(left-700)/2;
            top=(top-500)/2;
            var r=window.showModalDialog("../otros/subirImagen","","center:0;dialogWidth:600px;dialogHeight:450px;scroll=yes;resizable=yes;status=yes;"+"dialogLeft:"+left+"px;dialogTop:"+top+"px");
            InsertHTML(r[0]);
        });

        $('#cambiarImagen').click(function(){
            var left=screen.availWidth;
            var top=screen.availHeight;
            left=(left-700)/2;
            top=(top-500)/2;
            var r=window.showModalDialog("../otros/imagenes2","","center:0;dialogWidth:600px;dialogHeight:450px;scroll=yes;resizable=yes;status=yes;"+"dialogLeft:"+left+"px;dialogTop:"+top+"px");
            $('#foto').val(r[0]);
            $('#fotox').attr('src',r[0]);
        });
        //incluir destinatario
        $('a.destino').click(function(){
            var nombre=$(this).attr('nombre');   
            var cargo=$(this).attr('cargo');   
            var via=$(this).attr('via');   
            var cargo_via=$(this).attr('cargo_via');   
            $('#destinatario').val(nombre);
            $('#cargo_des').val(cargo);
    
            if(via==undefined)
                $('#via').val("");
            else $('#via').val(via);
            if(cargo_via==undefined)
                $('#cargovia').val("");
            else $('#cargovia').val(cargo_via);
    
            $('#referencia').focus();
            return false;
        });
    
    
    
        $('#btnword').click(function(){
            $('#word').val(1);
            return true

        });
        $('#save').click(function(){
            $('#frmEditar').submit();        
        });
        $('#subir').click(function(){
            var id=$(this).attr('rel');
            var left=screen.availWidth;
            var top=screen.availHeight;
            left=(left-700)/2;
            top=(top-500)/2;
            var r=window.showModalDialog("/archivo/add/"+id,"","center:0;dialogWidth:600px;dialogHeight:450px;scroll=yes;resizable=yes;status=yes;"+"dialogLeft:"+left+"px;dialogTop:"+top+"px");
            alert(r);
            return false;
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

</style>
<h2 class="subtitulo">Editar <?php echo $documento->codigo; ?> - <b><?php echo $documento->nur; ?></b><br/><span> Editar Fucov <?php echo $documento->codigo; ?> </span></h2>
<div class="tabs">
    <ul class="tabNavigation">
        <li><a href="#editar">Edición</a></li>
        <li><a href="#declaratoria">Declaratoria en Comisi&oacute;n</a></li>        
    </ul>
<div id="editar"> 
    <div class="formulario"  >  
        <div style="border-bottom: 1px solid #ccc; background: #F2F7FC; display: block; padding: 10px 0;   width: 150.8%;">    
            <a href="#" class="link save" id="save" title="Guardar cambios hechos al documento" > Guardar</a>
            | <a href="/pdf/<?php echo $tipo->action ?>.php?id=<?php echo $documento->id; ?>" class="link pdf" target="_blank" title="Imprimir PDF" >PDF</a>
            |  
            <?php if ($documento->estado == 1): ?> 
                <a href="/seguimiento/?nur=<?php echo $documento->nur; ?>" class="link derivar" title="Ver seguimiento" >Derivado</a>      
            <?php else: ?>
                    <a href="/hojaruta/derivar/?id_doc=<?php echo $documento->id; ?>" class="link derivar" title="Derivar a partir del documento, si ya esta derivado muestra el seguimiento" >Derivar</a>      
                <?php endif; ?>
                <?php
                $session = Session::instance();
                if ($session->get('super') == 1):
                    ?>
                    |  <a href="/word/print.php?id=<?php echo $documento->id; ?>" class="link word" target="_blank" title="Editar este documento en word" >Editar en Word</a>       
<?php endif; ?>
            </div>
            <form action="/pyv/editar/<?php echo $documento->id; ?>" method="post" id="frmEditar" >  
<?php if (sizeof($mensajes) > 0): ?>
                    <div class="info">
                        <p><span style="float: left; margin-right: .3em;" class="ui-icon-info"></span>
                        <?php foreach ($mensajes as $k => $v): ?>
                                <strong><?= $k ?>: </strong> <?php echo $v; ?></p>
                    <?php endforeach; ?>
                    </div>
                <?php endif; ?>        
                <br/>
                <?php
                if ($documento->id_tipo == 5):
                    echo Form::hidden('proceso', 1);
                else:
                    ?>        
                    <fieldset> <legend>Proceso: <?php echo Form::select('proceso', $options, $documento->id_proceso); ?></legend>
                                <?php endif; ?>            
                    <table width="100%">
                        <tr>
                            <td style=" border-right:1px dashed #ccc; padding-left: 5px;">
<?php if ($documento->id_tipo == '5'): ?>
                                    <p>
                                        <label>Titulo:</label>
                                        <select name="titulo" class="required">
                                            <option></option>
                                            <option <?php if ($documento->titulo == 'Señor') {
        echo 'selected';
    } ?> >Señor</option>
                                            <option <?php if ($documento->titulo == 'Señora') {
                                    echo 'selected';
                                } ?>>Señora</option>
                                            <option <?php if ($documento->titulo == 'Señores') {
                                    echo 'selected';
                                } ?>>Señores</option>    
                                        </select>
                                    </p>
<?php else: ?>
                                    <input type="hidden" name="titulo" />   
                                    <?php endif; ?>    
                                <p>
                                    <?php
                                    echo Form::hidden('id_doc', $documento->id);
                                    echo Form::label('destinatario', 'Nombre del destinatario:', array('class' => 'form'));
                                    echo Form::input('destinatario', $documento->nombre_destinatario, array('id' => 'destinatario', 'size' => 45, 'class' => 'required'));
                                    ?>
                                </p>
                                <p>
<?php
echo Form::label('destinatario', 'Cargo Destinatario:', array('class' => 'form'));
echo Form::input('cargo_des', $documento->cargo_destinatario, array('id' => 'cargo_des', 'size' => 45, 'class' => 'required'));
?>
                                </p> 
<?php /* if ($documento->id_tipo == 5): ?>
                                    <p>
                                        <label>Institución Destinatario</label>
                                        <input type="text" size="40" value="<?php echo $documento->institucion_destinatario; ?>" name="institucion_des" />    
                                    </p>
                                    <input type="hidden" size="40" value="" name="via" />    
                                    <input type="hidden" size="40" value="" name="cargovia" />    
                                    <?php else: ?>
                                    <input type="hidden" size="40" value="" name="institucion_des" />    

                                    <p>
    <?php
    echo Form::label('via', 'Via:', array('class' => 'form'));
    echo Form::input('via', $documento->nombre_via, array('id' => 'via', 'size' => 45));
    ?>
                                        <?php
                                        echo Form::label('cargovia', 'Cargo Via:', array('class' => 'form'));
                                        echo Form::input('cargovia', $documento->cargo_via, array('id' => 'cargovia', 'size' => 45));
                                        ?>
                                    <?php endif; */?>

                                </p>
                            </td>
                            <td style=" border-right:1px dashed #ccc; padding-left: 5px;">
                                <p>
                                    <?php
                                    echo Form::label('remitente', 'Nombre del remitente: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mosca', array('class' => 'form'));
                                    //echo Form::input('remitente', $user->nombre, array('id' => 'remitente', 'size' => 32, 'class' => 'required'));
                                    echo Form::input('remitente', $documento->nombre_remitente, array('id' => 'remitente', 'size' => 32, 'class' => 'required'));
                                    ?>            
                                    <?php
                                    //  echo Form::label('mosca','Mosca:');
                                    //echo Form::input('mosca', $user->mosca, array('id' => 'mosca', 'size' => 4));
                                    echo Form::input('mosca', $documento->mosca_remitente, array('id' => 'mosca', 'size' => 4));
                                    ?>
                                    <?php
                                    echo Form::label('cargo', 'Cargo Remitente:', array('class' => 'form'));
                                    echo Form::input('cargo_rem', $documento->cargo_remitente, array('id' => 'cargo_rem', 'size' => 45, 'class' => 'required'));
                                    ?>
<?php
echo Form::label('adjuntos', 'Adjunto:', array('class' => 'form'));
echo Form::input('adjuntos', $documento->adjuntos, array('id' => 'adjuntos', 'size' => 45/* ,'class'=>'required','title'=>'Ejemplo: Lo citado' */));
?>
<?php
echo Form::label('copias', 'Con copia a:', array('class' => 'form'));
echo Form::input('copias', $documento->copias, array('id' => 'adjuntos', 'size' => 45/* ,'class'=>'required' */));
?>
                                </p>
                            </td>



                            <td rowspan="2" style="padding-left: 5px;">
                                        <?php /* echo Form::label('dest', 'Mis destinatarios:'); ?>
                                <div id="vias">
                                    <ul>

                                        <!-- Vias -->    

                                        <!-- Destinatario -->    
                                        <?php foreach ($vias as $v): ?>
                                            <li class="<?php echo $v['genero'] ?>"><?php echo HTML::anchor('#', $v['nombre'], array('class' => 'destino', 'nombre' => $v['nombre'], 'title' => $v['cargo'], 'cargo' => $v['cargo'], 'via' => $v['via'], 'cargo_via' => $v['cargo_via'])); ?></li>
                                        <?php endforeach; ?>

                                        <!-- Inmediato superior -->    
<?php //foreach($superior  as $v){  ?>
                                        <li class="<?php //echo $v['genero'] ?>"><?php //echo HTML::anchor('#',$v['nombre'],array('class'=>'destino','nombre'=>$v['nombre'],'title'=>$v['cargo'],'cargo'=>$v['cargo'],'via'=>'','cargo_via'=>'')); ?></li>
<?php //}  ?>
                                        <!-- dependientes -->    
<?php // foreach($dependientes  as $v){  ?>
                                        <li class="<?php // echo $v['genero'] ?>"><?php //echo HTML::anchor('#',$v['nombre'],array('class'=>'destino','nombre'=>$v['nombre'],'title'=>$v['cargo'],'cargo'=>$v['cargo'],'via'=>'','cargo_via'=>'')); ?></li>
<?php //}  ?>
                                    </ul>
                                </div><?php */?>
                            </td>


                        </tr>

                        <tr>
                            <td colspan="2" style="padding-left: 5px;">
<?php
echo Form::label('referencia', 'Referencia:', array('class' => 'form'));
?>
                                <textarea name="referencia" id="referencia" style="width: 510px;" class="required"><?php echo $documento->referencia ?></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <input type="hidden" id="word" value="0" name="word"  />
                            </td>
                        </tr>
                    </table>

                    <div style="width: 595px;float: left; ">
<?php
echo Form::textarea('descripcion', $documento->contenido, array('id' => 'descripcion', 'cols' => 50, 'rows' => 20));
?>
                    </div>  
                    <div id="op">
                        <!-- <a href="#" class="link imagen">Insertar Imagen</a>
                         <a href="#" class="link imagen">Seleccionar todo</a>    -->
                    </div>
                    <div style="clear:both; display: block;"></div>
                    <input type="hidden" id="con" value="<?php echo strlen($documento->contenido . $documento->referencia); ?> "/>
                    <p>
                    <hr/>
                    <input type="submit" name="documento" value="Modificar documento" class="uibutton" />   
                    </p>
                </fieldset>

            </form>
</div>
</div>
<div id="declaratoria"> 
<div class="formulario"  > 
<div style="border-bottom: 1px solid #ccc; background: #F2F7FC; display: block; padding: 10px 0;   width: 150.8%;  ">    
<h2 align="center">Informaci&oacute;n del Memor&aacute;ndun</h2>
<br />
<fieldset>
<table width="100%" border="1px">
    <tr>
        <td>
            <p>
                <?php                  
                echo Form::label('areas', 'Area Funcional:',array('class'=>'form'));                
                ?>
                </p>
        </td>
        <td>
        <select name="areas" id="areas" class="required" style="width: 400px;"><option value="" selected="true"></option>
            <?php foreach($areafuncional as $v=>$value){
                if ($v == $fucov->id_area_funcional)
                    echo '<option value="'.$v.'" selected>'.$value.'</option>';
                else
                    echo '<option value="'.$v.'">'.$value.'</option>';
                }?>    
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
        <select id="funcionario" name="funcionario" style="width: 400px;" class="required" ><option value="" selected="true"></option>
            <?php foreach($usercomision as $v=>$value){
                if ($v == $fucov->id_user_comision)
                    echo '<option value="'.$v.'" selected>'.$value.'</option>';
                else
                    echo '<option value="'.$v.'">'.$value.'</option>';
                }?>
        </select>                
        </td>
        
    </tr>
    <tr>
    <td><?php
                echo Form::label('cargo','Cargo del Funcionario',array('class'=>'form'));
            ?>
        </td>
        <td>
            <input id="cargo" name="cargo" type="text" class="required" size="75" value="<?php echo $fucov->cargo_user_comision; ?>"/>            
        </td>
    </tr>   
    <tr>
        <td>
            <?php
                echo Form::label('autorizadoPor','Autorizado por:',array('class'=>'form'));                
            ?> 
        </td>
        <td>            
            <select id="autorizadoPor" name="autorizadoPor" style="width: 400px;" class="required" ><option value="" selected="true"></option>
            <?php  foreach ($aut as $d):?> 
            <?php if($fucov->id_area_inmediato_superior == $d['id']) $sel = 'selected';
                  else $sel = '';?>
                        <option value="<?php echo $d['id'];?>" <?php echo $sel;?> ><?php  echo $d['oficina'];?></option>                          
            <?php   endforeach; ?>
            </select>
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
                echo Form::label('finicios','Fecha de Inicio de Comici&oacute;n:',array('class'=>'form'));
            ?> 
        </td>
        <td>
            <input type="text" name="finicio" id="finicio" class="required" value="<?php echo $fucov->fecha_ini_comision;?>"/>
        </td>
    </tr>
    <tr>
        <td><?php
                echo Form::label('hinicio','Hora de Inicio de Comisi&oacute;n:',array('class'=>'form'));
            ?> 
        </td>
        <td>
            <select name="hinicio" id="hinicio" class="required"><option value="" selected="true"></option>
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
    </tr>
    <tr>
        <td><?php
                echo Form::label('fconclusion','Fecha de concluci&oacute;n Comici&oacute;n:',array('class'=>'form'));
            ?> 
        </td>
        <td>
            <input type="text" name="fconclusion" id="fconclusion" class="required" value="<?php //echo date('D d-m-Y');?>"/>
        </td>
    </tr>
    <tr>
        <td><?php
                echo Form::label('hconclusion','Hora de conclusi&oacute;n Comisi&oacute;n:',array('class'=>'form'));
            ?> 
        </td>
        <td><select name="hconclusion" id="hconclusion" class="required"><option value="" selected="true"></option>
            <?php for($i=8; $i<=23 ; $i++){
                    for($j=0;$j<60;$j+=30){
                        if($i<10){$h="0".$i;}else{$h=$i;}
                        if($j<10){$m="0".$j;}else{$m=$j;}
                        echo '<option value="'.$h.":".$m.'">'.$h.":".$m.'</option>';
                    }
                }?>    
            </select>
        </td>
    </tr><!--
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
</div>