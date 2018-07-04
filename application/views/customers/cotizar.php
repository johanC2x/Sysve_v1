<?php $this->load->view("partial/header"); ?>
<script src="<?php echo base_url();?>js/lib/travel.js" type="text/javascript" language="javascript" charset="UTF-8"></script>

<div class="row">
    <div class="col-md-12">
        <div class="col-md-6">
                <?php
                    $caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"; //posibles caracteres a usar
                    $numerodeletras=4; //numero de letras para generar el texto
                    $cadena = ""; //variable para almacenar la cadena generada
                            for($i=0;$i<$numerodeletras;$i++) {
                                        $cadena .= substr($caracteres,rand(0,strlen($caracteres)),1); 
                                    }
                    $fecha = date("dm");
                ?>
        <h4 class="modal-title">Cotizacion Nro: <?php echo $this->lang->lin.strtoupper("$user_info->first_name"); ?>-<?php echo "$cadena"."-"."$fecha"; ?> </h4>
        </div>
    </div>
</div>
<hr/>
<div class="row">
        <div class="col-md-12">
                <fieldset>
                    <legend>Datos del Cliente</legend>
                </fieldset>
    <?php if (isset($datos)): ?>
            <form id="form_customer_data" role="form">
                <div class="col-md-2" class="form-group">
                    <label>Nro. de Identificacion</label>
                    <input type="text" id="customer_document" name="customer_document" value="<?php echo $datos['person_id']; ?>" class="form-control" disabled />
                    <input type="hidden" id="customer_id" name="customer_id" />
                </div>
                <div class="col-md-4" class="form-group">
                    <label>Nombres y Apellidos</label>
                    <input type="text" id="customer_name" name="customer_name" value="<?php echo $datos['firstname']; ?> <?php echo $datos['middlename']; ?> <?php echo $datos['lastname']; ?> <?php echo $datos['mother_lastname']; ?>" class="form-control" disabled/>
                </div>
                <div class="col-md-4" class="form-group">
                    <label>Email</label>
                    <input id="customer_address" name="customer_address" class="form-control" placeholder="Correo" disabled="true">
                </div>
                <div class="col-md-2" class="form-group">
                    <label>Telefonofo</label>
                    <input id="customer_address" name="customer_address" class="form-control" placeholder="Telefono" disabled="true">
                </div>
            </form>
    <?php else: echo 'La entrada no existe.'; endif; ?>
        </div>
</div>
<hr/>
<div class="row">
    <div class="col-md-12">
        <?php echo form_open('travel/saveComision',array('id'=>'form_travel_comision_save','class' => 'form-inline')); ?>
            <fieldset>
                <legend>Registro de Servicios</legend>
                  <div class="form-group mx-sm-3 mb-2">
                    <select id="cbo_comision_payment" name="cbo_comision_payment" class="form-control">
                        <option value="">Seleccionar Tipo de Servicio</option>
                        <option value="">Vuelo</option>
                        <option value="">Hotel</option>
                        <option value="">Auto</option>
                        <option value="">Seguro</option>
                        <option value="">Paquete</option>
                        <option value="">Tours</option>
                        <option value="">Crucero</option>
                        <option value="">Trenes</option>
                        <option value="">Entradas</option>
                        <option value="">Vuelos de Regreso</option>
                        <option value="">Otros</option>
                    </select>
                  </div>
                <div class="form-group">
                    <input type="number" id="amount_travel" name="amount_travel" class="form-control" value="0" style="display: none"/>
                </div>
                  <button id="btn_save_com" type="button" class="btn btn-primary">Agregar Servicio</button>
                  <button style="float: right" type="button" class="btn btn-primary btn_save_travel">Guardar Viaje</button>
            </fieldset>
            <div class="alert alert-danger alert-dismissible error_comision"></div>
        <?php echo form_close(); ?>
    </div>

    <div class="col-md-12">
        <br/>
        <form>
            <table id="table_customer_travel" class="table table-hover table-bordered" >
                <thead>
                    <tr>
                        <th class="col-md-1"><center>Nro.</center></th>
                        <th class="col-md-4"><center>Servicios</center></th>
                        <th class="col-md-4"><center>Ticket</center></th>
                        <th class="col-md-2"><center>Monto</center></th> 
                        <th colspan="3" class="col-md-1"><center>Acción</center></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="5">
                            <center>
                                No se registraron datos.
                            </center>
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
    </div>
</div>
<!-- MODAL DE CONFIRMACIÓN -->

<div id="modal_success" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <center>
                    <h3 class="modal-title messages_modal">Operación Correcta</h3>
                    <br/>
                    <button type="button" class="btn btn-primary btn_success" data-dismiss="modal">Aceptar</button>
                </center>
            </div>
        </div>
    </div>
</div>


<div id="modal_detail_comision" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <?php echo form_open('travel/updateDetailComision',array('id'=>'form_travel_comision_update')); ?>
            <div class="modal-body">
                
                    <!--
                    <div class="row">
                    -->

            <fieldset>
                <legend>Datos del Viaje</legend>
                <div class="col-md-12">
                    <div class="col-md-4">
                        <!-- <div class="form-group">
                            <label>Tipo de Boleto:</label>
                            <select id="type_travel" name="type_travel" class="form-control" onchange="travel.showInfo();">
                                <option value="">Seleccionar</option>
                                <option value="Público">Público</option>
                                <option value="Privado">Privado</option>
                                <option value="BT o IT">BT o IT</option>
                                <option value="Re-emisión">Re-emisión</option>
                            </select>
                        </div> -->
                        <div class="form-group">
                            <label for="code_travel">Código:</label>
                            <input type="text" name="code_travel" id="code_travel" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="name_travel">Vuelo:</label>
                            <input type="text" name="name_travel" id="name_travel" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="total_servicios">Total Servicios:</label>
                            <input type="text" id="total_servicios" name="total_servicios" class="form-control" />
                        </div>

                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="">Desde:</label>
                            <input type="date" name="destiny_origin_travel" id="destiny_origin_travel" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="">Hasta:</label>
                            <input type="date" name="destiny_end_travel" id="destiny_end_travel" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="type_travel">Ubicación</label>
                            <select id="type_travel" name="type_travel" class="form-control">
                                <option value="">Seleccionar</option>
                                <option value="1">Ventana</option>
                                <option value="2">Pasillo</option>
                                <option value="3">Compra Asiento</option>
                            </select>
                        </div>
                        <div class="form-group" id="div_penalidad" style="display:none">
                            <label for="">Penalidad</label>
                            <input type="text" name="penalidad" id="penalidad" class="form-control"/>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <label>Salida:</label>
                            <input type="datetime-local" id="date_init_travel" name="date_init_travel" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Llegada:</label>
                            <input type="datetime-local" id="date_end_travel" name="date_end_travel" class="form-control"/>
                        </div>
                        <div class="form-group" id="div_feepenalidad">
                            <label>Fee Penalidad:</label>
                            <input type="datetime-local" id="fee_penalidad" name="fee_penalidad" class="form-control"/>
                        </div>
                    </div>
                </div>
            </fieldset>

                        <fieldset>
                            <legend>Información del Cliente</legend>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="dni_ruc">DNI/RUC</label>
                                    <input type="text" id="dni_ruc" name="dni_ruc" class="form-control"> 
                                </div>      
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="nombres">Nombres</label>
                                    <input type="text" id="nombres" name="nombres" class="form-control"> 
                                </div>      
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="apellidos">Apellidos</label>
                                    <input type="text" id="apellidos" name="apellidos" class="form-control">
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="direccion_fiscal">Direccion</label>
                                    <input type="text" id="direccion_fiscal" name="direccion_fiscal" class="form-control">
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                        <legend style="padding-left: 13px">Información del servicio</legend>
                        <div class="col-md-12">
                                <div class="form-group">
                                    <label for="tipo_doc">Tipo documento</label>
                                    <select id="tipo_doc" name="tipo_doc" class="form-control">
                                        <option value="">Seleccionar</option>
                                        <option value="FACTURA">FACTURA</option>
                                        <option value="BOLETA ">BOLETA </option>
                                        <option value="TICKET">TICKET</option>
                                    </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="comision_type_operator">Tipo de Operador</label>
                                <select id="comision_type_operator" name="comision_type_operator" class="form-control">
                                    <option value="">Seleccionar</option>
                                    <?php foreach ($operator as $key => $value) {?>
                                        <option value="<?= $value["id"]; ?>" data-key="<?= $value["key"]; ?>"><?= $value["name"]; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="monto_detalle">Monto de Servicio</label>
                                    <input type="text" id="monto_detalle" name="monto_detalle" class="form-control"> 
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="fee_servicio">Fee del servicio</label>
                                    <input type="text" id="fee_servicio" name="fee_servicio" class="form-control"> 
                                </div>
                            </div>
                            <div class="col-md-12">
                                <label for="comision_code">Nro de ticket</label>
                                <input type="text" id="comision_code" name="comision_code" class="form-control"/>
                                <input type="hidden" id="comision_obj_id" name="comision_obj_id"/>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="fee_servicio">Fecha Inicio del Servicio</label>
                                    <input type="date" id="fe_inicio_servicio" name="fe_inicio_servicio" class="form-control"> 
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="fee_servicio">Fecha Fin del Servicio</label>
                                    <input type="date" id="fe_fin_servicio" name="fe_fin_servicio" class="form-control"> 
                                </div>
                            </div>
                            </div>
                            <!-- <div class="col-md-6">
                                <div class="form-group">
                                    <label for="porcentaje_cobro">Porcentaje del cobro</label>
                                    <input type="text" id="porcentaje_cobro" name="porcentaje_cobro" class="form-control" 
                                            onkeyup="travel.calcularPorcentaje();"> 
                                </div>      
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="fee_servicio">Fee del servicio</label>
                                    <input type="text" id="fee_servicio" name="fee_servicio" class="form-control"> 
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="cobro_total">Cobro Total</label>
                                    <input type="text" id="cobro_total" name="cobro_total" class="form-control" readonly=""> 
                                </div>      
                            </div> -->
                        </fieldset>
                        <fieldset>
                            <legend style="padding-left: 13px">Información de Fee y Comisión</legend>
                        <div class="col-md-12">
                            <div class="col-md-6">
                                <div class="form-group" style="padding-top: 20px">
                                    <input type="radio" id="comision_fee" name="comision_fee" value="comision" checked> Comisión
                                    <input type="radio" id="comision_fee" name="comision_fee" value="fee_to_pay"> Fee por Paga
                                </div>      
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" style="padding-top: 20px">
                                    <label for="monto_comision">Monto de Fee/Comisión</label>
                                    <input type="number" id="monto_comision" name="monto_comision" class="form-control" value="0"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="comision_incentive">Incentivos de Turifax</label>
                                <input type="number" id="incentivos_turifax" name="comision_incentive" class="form-control" value="0"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="comision_incentive">Incentivos de otro operador</label>
                            <input type="number" id="incentivos_otros" name="comision_incentive" class="form-control" value="0"/>
                        </div>
                        <div class="col-md-12">
                            <label for="comentarios">Comentarios</label>
                            <textarea id="comentarios" class="form-control"></textarea>
                        </div>
                    </fieldset>
                    <!--
                    </div>
                    -->
                <?php echo form_close(); ?>
                <div class="modal-footer">
                <button class="btn btn-primary btn_update_comision" type="button">
                    Guardar
                </button>
            </div>
            </div>
            
        </div>
    </div>
</div>
<div id="modal_operacion" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                
                <h3 class="modal-title messages_modal"><span id="tipo_operacion"></span></h3>
                <?php echo form_open('travel/updateDetailComision',array('id'=>'form_travel_operacion')); ?>
                <div class="col-md-12">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="ticket_anular">Nro ticket a anular</label>
                            <input type="text" class="form-control" name="ticket_anular" id="ticket_anular">
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="ticket_anular">Diferencia tarifas</label>
                            <input type="text" class="form-control" name="diferencia_tarifa" id="diferencia_tarifa">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="ticket_anular">Penalidad</label>
                            <input type="text" class="form-control" name="" id="ticket_anular">
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="ticket_anular">Fee operador</label>
                            <input type="text" class="form-control" name="diferencia_tarifa" id="diferencia_tarifa">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="ticket_anular">Fee agencia</label>
                            <input type="text" class="form-control" name="" id="ticket_anular">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary btn_close_modal_operacion" type="button">
                        Guardar
                    </button>
                </div>
                
            </div>
            <div class="modal-body">
                
                <div class="row">

                </div>
            </div>
        </div>
    </div>
</div>
<div id="modal_cotizacion" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
<input type="hidden" id="url_nuevo_cliente" name="url_nuevo_cliente" value="<?php echo base_url();?>/index.php/customers/view/-1/width:1200">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title messages_modal">Plantilla de Cotización</h3>
            </div>
            <div class="modal-body">
                <?php echo form_open('travel/updateDetailComision',array('id'=>'form_cotizacion')); ?>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-6" style="float:right">
                                <label for="comision_incentive">N° COTIZACION</label>
                                <input type="hidden" name="json_cotizacion" id="json_cotizacion">
                            </div>
                        </div>
                        <div class="col-md-12" >
                            <div class="col-md-6" style="overflow: scroll; height: 150px">
                                <table style="text-align: center;width: 200px" id="tbl_empresas">
                                    <tr>
                                        <td style="text-align: center;width:100px">Documento</td>
                                        <td style="text-align: center;width:100px">Nro.<button class="fa fa-plus" style="float:right" onclick="travel.generarTablaDatos('datos_dni2', ['documento', 'nro'], 200);"></button></td>
                                    </tr>
                                </table>
                                <div id="datos_dni2" name="datos_dni2"></div>
                                <input type="hidden" name="json_datos_dni" id="json_datos_dni">
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="last_name">Fecha de Nacimiento:</label>
                                    <input type="text" name="fecha_nac" id="fecha_nac" class="form-control" />
                                    <label for="last_name">Nacionalidad:</label>
                                    <input type="text" name="nacionalidad" id="nacionalidad" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-4">
                                <div class="form-group">
                                     <label for="last_name">Nombre:</label>
                                        <input type="text" name="nombre" id="nombre" class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                     <label for="last_name">Penombre:</label>
                                        <input type="text" name="penombre" id="penombre" class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                     <label for="last_name">Apellido Paterno:</label>
                                        <input type="text" name="ap_paterno" id="ap_paterno" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-4">
                                <div class="form-group">
                                     <label for="last_name">Apellido Materno:</label>
                                        <input type="text" name="ap_materno" id="ap_materno" class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                     <label for="last_name">Apellido de Casada:</label>
                                        <input type="text" name="ap_casada" id="ap_casada" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <fieldset>
                                <legend>Información del Viaje</legend>
                                <table style="text-align: center;width: 574px" id="tbl_empresas">
                                    <tr>
                                        <td style="text-align: center;width:202px">N° vuelo</td>
                                        <td style="text-align: center;width:225px">Fecha</td>
                                        <td style="text-align: center;width:225px">Ruta<button class="fa fa-plus" style="float:right" onclick="travel.generarTablaDatos('datos_viaje', ['nro_vuelo', 'fecha', 'ruta'], 400);"></button></td>
                                    </tr>
                                </table>
                                <div id="datos_viaje" name="datos_viaje"></div>
                                <input type="hidden" name="json_empresa">
                                <hr>
                            </fieldset>
                        </div>
                        <div class="col-md-12">
                            <fieldset>
                                <legend>Teléfono y Correo</legend>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <table style="text-align: center;width: 300px" id="tbl_empresas">
                                            <tr>
                                                <td>Tipo de contacto</td>
                                                <td style="text-align: center;width:142px">Nro <button class="fa fa-plus" style="float:right" onclick="travel.generarTablaDatos('datos_celulares2', ['tipo_contacto', 'nro'], 400);"></button></td>
                                            </tr>
                                        </table>
                                        <div id="datos_celulares2" name="datos_celulares2"></div>
                                        <input type="hidden" name="json_empresa">
                                    </div>
                                    <div class="col-md-6">
                                        <table style="text-align: center;width: 300px" id="tbl_empresas">
                                                <tr>
                                                    <td>Tipo de email</td>
                                                    <td style="text-align: center;width:142px">Nro <button class="fa fa-plus" style="float:right" onclick="travel.generarTablaDatos('datos_emails2', ['tipo_email', 'email'], 400);"></button></td>
                                                </tr>
                                        </table>
                                        <div id="datos_emails2" name="datos_emails2"></div>
                                        <input type="hidden" name="json_empresa">
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        
                    </div>

                    </div>
                    <button class="btn btn-primary btn_cotizacion" type="button">
                        Guardar
                    </button>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view("travel/modal"); ?>
<!-- ====================== -->
<script type="text/javascript">
    $(document).ready(function(){
        $(".error_comision").hide();
        travel.setTravelCode();
        $("#search_value").on('input', function () {
           travel.setCustomerFilter();
        });
        $("#btn_save_com").click(function(){
            travel.addComision();
        });
        $(".btn_success").click(function(){
            location.reload();
        });
        $('.btn_save_travel').on("click", function () {
            var validator = $('#form_travel_save').data('bootstrapValidator');
            validator.validate();
            return validator.isValid();
        });
        $('.btn_update_comision').on("click", function () {
            var validator = $('#form_travel_comision_update').data('bootstrapValidator');
            validator.validate();
            return validator.isValid();
        });

        $('.btn_cotizacion').on("click", function () {
            $("#modal_cotizacion").modal("hide");
            travel.saveInfoTablas();
        });

        $('#showLastTravel').hide();

        $('form input').on('keypress', function(e) {
            return e.which !== 13;
        });

        $('#div_penalidad').hide();
        $('#div_feepenalidad').hide();

        travel.saveCustomer();
        //travel.addComision('fee');
        travel.validateFormTravel();
        travel.validateFormUpdateComision();
        travel.formCotizacion();
        travel.getViajes();

        $('#btn_nuevo_cliente2').click(function(){
            $('#modal_cotizacion').modal('show');
        });

        /* BOTON DE AGREGADO DE DIRECCIONES */
        if(document.getElementById("btn_add_customer_travel") !== null){
            const btn_add_customer_travel = document.getElementById("btn_add_customer_travel");
            btn_add_customer_travel.addEventListener("click" ,() => {
                travel.saveCustomerAddress();
            });
        }

        /* BOTON DE AGREGADO DE PASAPORTES */
        if(document.getElementById("btn_add_customer_passport") !== null){
            const btn_add_customer_passport = document.getElementById("btn_add_customer_passport");
            btn_add_customer_passport.addEventListener("click" ,() => {
                travel.saveCustomerPassport();
            });
        }

        /* BOTON DE AGREGADO DE PASAPORTES */
        if(document.getElementById("btn_add_customer_card") !== null){
            const btn_add_customer_card = document.getElementById("btn_add_customer_card");
            btn_add_customer_card.addEventListener("click" ,() => {
                travel.saveCustomerCard();
            });
        }

        /* BOTON DE AGREGADO DE PASAPORTES */
        if(document.getElementById("btn_add_customer_company") !== null){
            const btn_add_customer_company = document.getElementById("btn_add_customer_company");
            btn_add_customer_company.addEventListener("click" ,() => {
                travel.saveCustomerCompany();
            });
        }

    });

</script>
<?php $this->load->view("partial/footer"); ?>
















