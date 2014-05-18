<script type="text/javascript">
    
    
 $('#filter').keyup(function(){
    var table = $('#table');
    var value = this.value;
    table.find('.recorrer').each(function(index, row) {
        var allCells = $(row).find('td');
        if(allCells.length > 0) {
            var found = false;
            allCells.each(function(index, td) {
                var regExp = new RegExp(value, 'i');
                if(regExp.test($(td).text())) {
                    found = true;
                    return false;
                }
            });
            if (found == true) $(row).show();
            else $(row).hide();
        }
    });
});
    
    function eliminarServicio(idServicio){
        var idPersona= $("#idPersonas").val();
        
        var data = {
            idPersona: idPersona,
            idServicio: idServicio
        };

        $.ajax({
            type: "POST",
            url: "/palace/administrador/eliminarServiciosEmpleado",
            data: data
        })
                .done(function(msg) {

                    var json = eval("(" + msg + ")");

                    if (json == "exito") {

                        consultaPersona(idPersona);

                    } else if (json == 23000) {

                        
                    }else{
                        
                    }
                });
    }
    
    function agregarServicios(){
        var idPersona= $("#idPersonas").val();
        var servicios = document.getElementById("servs").options;
        var arreglo = new Array();
        var j = 0;
        for (var i = 0; i < servicios.length; i++) {
            if (servicios[i].selected == true) {
                arreglo[j] = servicios[i].value;
                j++;
            }
        }


        var data = {
            idPersona: idPersona,
            servicios: JSON.stringify(arreglo)
        };

        $.ajax({
            type: "POST",
            url: "/palace/administrador/agregarServiciosEmpleado",
            data: data
        })
                .done(function(msg) {

                    var json = eval("(" + msg + ")");

                    if (json == "exito") {

                        consultaPersona(idPersona);

                    } else if (json == 23000) {

                        
                    }else{
                        
                    }
                });
    }
    
    
     function consultaPersona(idPersona) {
        var x = $("#mensaje");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("speed");
      

        var data = { idPersona: idPersona };

        $.ajax({
            type: "POST",
            url: "/palace/administrador/consultarPersona",
            data: data
        }).done(function(msg) {

            var json = eval("(" + msg + ")");
            $("#idPersonas").val(json.idPersona);
            $("#nombre").val(json.nombre);
            $("#pApellidos").val(json.primerApellido);
            $("#sApellidos").val(json.segundoApellido);
            $("#sexos").val(json.sexo);
            $("#fNacimientos").val(json.fechaNacimiento);
            $("#telefonos").val(json.telefono);
            $("#celulars").val(json.celular);
            $("#direccions").val(json.direccion);
            $("#correos").val(json.correo);
            ocultar();
            document.getElementById('light').style.display = 'block';
            document.getElementById('fade').style.display = 'block';
            consultarServicios(idPersona);
        });


    }  
    
    function consultarServicios(idPersona){
       
        var data = { idPersona: idPersona };

        $.ajax({
            type: "POST",
            url: "/palace/administrador/consultarServiciosPersona",
            data: data
        }).done(function(msg) {
            $("#vistaServicios").html(msg);
        });

    }
    
function modificarPersona(){
   
        var x = $("#mensaje");
        var y = $("#overlay");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("speed");
        y.show("speed");
      
 
        var idPersona = $("#idPersonas").val();
        var nombres = $("#nombre").val();
        var pApellido = $("#pApellidos").val();
        var sApellido = $("#sApellidos").val();
        var sexo = $("#sexos").val();
        var fecha = $("#fNacimientos").val();
        var telefono = $("#telefonos").val();
        var celular = $("#celulars").val();
        var direccion = $("#direccions").val();
        var correo = $("#correos").val();
        
        var persona ={ idPersona:idPersona,
                    nombres: nombres,
                    pApellido: pApellido,
                    sApellido: sApellido,
                    sexo: sexo,
                    fNacimiento: fecha,
                    telefono: telefono,
                    celular:celular,
                    direccion:direccion,
                    correo:correo
                    
        };
        
        $.ajax({
                      type: "POST",
                      url: "/palace/administrador/modificarPersona",
                      data: persona
                  })
                  .done(function(msg) {
                      
                      var json = eval("(" + msg + ")");
              
                      if (json == "exito") {
                      
                         document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'
                         
                            
                            x.html ( "<p>Empleado Modificado Correctamente</p>");
                            y.html();
                            exito();
                            ocultar();
                      } else if(json == 23000) {

                            limpiarCajas();
                            x.html ( "<p>Error al Modificar Empleado</p>");
                            y.html();
                            error();
                            ocultar();

                      }
                  });
    }

    $("#form").submit(function() {

        var x = $("#mensaje");
        var y = $("#overlay");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("slow");
        y.show("speed");

        var idPersona = $("#idPersona").val();
        var nombres = $("#nombres").val();
        var pApellido = $("#pApellido").val();
        var sApellido = $("#sApellido").val();
        var sexo = $("#sexo").val();
        var fecha = $("#fNacimiento").val();
        var telefono = $("#telefono").val();
        var celular = $("#celular").val();
        var direccion = $("#direccion").val();
        var correo = $("#correo").val();

        var servicios = document.getElementById("servicios").options;
        var arreglo = new Array();
        var j = 0;
        for (var i = 0; i < servicios.length; i++) {
            if (servicios[i].selected == true) {
                arreglo[j] = servicios[i].value;
                j++;
            }
        }


        var persona = { idPersona: idPersona,
            nombres: nombres,
            pApellido: pApellido,
            sApellido: sApellido,
            sexo: sexo,
            fNacimiento: fecha,
            telefono: telefono,
            celular: celular,
            direccion: direccion,
            correo: correo,
            rol: "E",
            servicios: JSON.stringify(arreglo)
        };

        $.ajax({
            type: "POST",
            url: "/palace/administrador/registrarPersona",
            data: persona
        })
                .done(function(msg) {

                    var json = eval("(" + msg + ")");

                    if (json == "exito") {

                        limpiarCajas();
                        x.html("<p>Empleado Registrado Correctamente</p>");
                        y.html();
                        exito();
                        ocultar();


                    } else if (json == 23000) {

                        limpiarCajas();
                        x.html("<p>Error al registrar Empleado</p>");
                        y.html();
                        error();
                        ocultar();

                    }
                });

    });
</script>
<div  id="overlay"></div>
<div  id="mensaje">
    <div style="float:right">
        <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display = 'none';
                document.getElementById('fade').style.display = 'none'"><img src="../utiles/image/close.png"/></a>
    </div>

</div>
<div id="cont-form">   
    <form id="form" action="javascript: return false;">
        <table border="0" align="left" width="100%" >
            <tr><td style="text-align: left;"><h2>Registro de Empleados</h2></td></tr>
            <tr><td style="text-align: left;"><input type="number" id="idPersona" name="idPersona" required placeholder="Cedula" class="box-text" ></td></tr>    
            <tr><td style="text-align: left;"><input type="text" name="nombres" id="nombres" required placeholder="Nombres"  class="box-text" ></td></tr> 
            <tr><td style="text-align: left;"><input type="text" name="pApellido" id="pApellido" required placeholder="Primer Apellido"  class="box-text" ></td>      
            <tr><td style="text-align: left;"><input type="text" name="sApellido" id="sApellido" required placeholder="Segundo Apellido"  class="box-text" ></td></tr>
            <tr><td style="text-align: left;"><select id="sexo"><option>M</option><option>F</option></select></td></tr>
            <tr><td style="text-align: left;"><input type="date" id="fNacimiento" required placeholder="Fecha de Nacimiento"  class="box-text" ></td></tr>
            <tr><td style="text-align: left;"><input type="number" id="telefono" required placeholder="Telefono"  class="box-text" ></td></tr>
            <tr><td style="text-align: left;"><input type="number" id="celular" required placeholder="Celular"  class="box-text" ></td></tr>
            <tr><td style="text-align: left;"><input type="text" id="direccion" required placeholder="Direccion"  class="box-text" ></td></tr>
            <tr><td style="text-align: left;"><input type="email" id="correo" required placeholder="Correo Electronico"  class="box-text" ></td></tr>
            <tr><td style="text-align: left;"><select multiple="" id="servicios" class="box-text" >
                        <?php foreach($servicios as $servicio){ ?>
                        <option value="<?php echo $servicio->getIdServicio(); ?>"><?php echo $servicio->getNombre(); ?></option>
                        <?php } ?>
                    </select></td>
            </tr>
            <tr><td style="text-align:right;"><button type="submit" class="button orange large"  >Guardar</button></td></tr>
        </table>
    </form>
</div>

<div id="cont-consulta">

    <table border="0" align="right" width="70%">
        <tr><td style="text-align: center;"><h2>Consulta de Empleados</h2></td>
            <td style="text-align: right;"><input type="text" name="idPersona" required placeholder="Buscar" class="box-text" id="filter"></td>
    </table>

    <div style="margin-top:10%;">
        <table border="0" align="center" width="100%" id="mitabla" >
            <thead>
            <th>Cedula</th>
            <th>Nombres</th>
            <th width="30%">Apellidos</th>
            <th width="5%">Sexo</th>
            <th>Celular</th>
            <th width="5%"></th>
            </thead>
            <tbody id="table">
                <?php foreach($personas as $persona){ ?>
                <tr class="recorrer" align="left">
                    <td width="20%"><?php echo $persona->getIdPersona(); ?></td>
                    <td width="30%"><?php echo $persona->getNombres(); ?></td>
                    <td width="30%" ><?php echo $persona->getpApellido()." ".$persona->getsApellido(); ?></td>
                    <td width="5%"><?php echo $persona->getSexo(); ?></td>
                    <td width="10%"><?php echo $persona->getCelular(); ?></td>
                    <td width="5%" style="text-align:right;"><buttom type="submit" class="button small red"  onclick="consultaPersona('<?php echo $persona->getIdPersona(); ?>');">...</buttom></td> 
            </tr>
            <?php } ?>

            </tbody>
        </table>
    </div>

</div>
<div id="fade" class="overlay"></div>
<div id="light" class="modal">
              <div style="float:right">
                  <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><img src="../utiles/image/close.png"/></a>
             </div>
                
       <div style=" margin-top: 5%;margin-left: 5%; float:left; width:45%;">
        <h2>Datos del Empleado</h2>
        </br>
        <table width="100%">
            <tr>
                <td>
                    cedula:
                </td>
                <td>
                    <input class="box-text-disable" value="" id="idPersonas" type="text" disabled >
                </td>                          
            </tr>
            <tr>
                <td>
                    Nombres:
                </td>
                <td>
                    <input class="box-text" value="" id="nombre" type="text" >
                </td>                          
            </tr>
            <tr>
                <td>
                    Primer Apellido:
                </td>
                <td>
                    <input class="box-text" value="" id="pApellidos" type="text">
                </td>                          
            </tr>
            <tr>
                <td>
                    Segundo Apellido:
                </td>
                <td>
                    <input class="box-text" value="" id="sApellidos" type="text" >
                </td>                          
            </tr>
            <tr>
                <td>
                    sexo:
                </td>
                <td>
                    <input class="box-text-disable" value="" id="sexos" type="text" disabled >
                </td>                          
            </tr>
            <tr>
                <td>
                    fecha de Nacimiento:
                </td>
                <td>
                    <input class="box-text" value="" id="fNacimientos" type="date" >
                </td>                          
            </tr>
            <tr>
                <td>
                    telefono:
                </td>
                <td>
                    <input class="box-text" value="" id="telefonos" type="number">
                </td>                          
            </tr>
            <tr>
                <td>
                    Celular:
                </td>
                <td>
                    <input class="box-text" value="" id="celulars" type="number" >
                </td>                          
            </tr>
            <tr>
                <td>
                    Direccion:
                </td>
                <td>
                    <input class="box-text" value="" id="direccions" type="text" >
                </td>                          
            </tr>
            <tr>
                <td>
                    Correo:
                </td>
                <td>
                    <input  class="box-text" value="" id="correos" type="text"  >
                </td>                          
            </tr>
           <tr><td align="right"><button type="submit" class="button red small" onclick="modificarPersona()">Modificar</button></td></tr>
        </table>
        </div>
    <div style=" margin-top: 5%; margin-left:5%;float:right; width: 40%;" id="vistaServicios">
        
    </div>
    </div>  
          