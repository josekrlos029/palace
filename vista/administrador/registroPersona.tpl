   <script type="text/javascript">

    
    function consultaPersona(idPersona) {
        var x = $("#mensaje");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("slow");

        var data = {idPersona: idPersona};

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
        });


    }  

    $("#form").submit(function(){
        
        var x = $("#mensaje");
        var y = $("#overlay");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("speed");
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
        
        var persona ={ idPersona:idPersona,
                    nombres: nombres,
                    pApellido: pApellido,
                    sApellido: sApellido,
                    sexo: sexo,
                    fNacimiento: fecha,
                    telefono: telefono,
                    celular:celular,
                    direccion:direccion,
                    correo:correo,
                    rol: "C"
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
                            x.html ( "<p>Cliente Registrado Correctamente</p>");
                            y.html();
                            exito();
                            ocultar();
                         

                      } else if(json == 23000) {

                            limpiarCajas();
                            x.html ( "<p>Error al registrar Cliente</p>");
                            y.html();
                            error();
                            ocultar();

                      }
                  });
        
    });
    
    function recargarTablaPersonas(){
        
    }
   
</script>
<div  id="overlay"></div>
            <div  id="mensaje">
              <div style="float:right">
                  <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><img src="../utiles/image/close.png"/></a>
             </div>
                
            </div>
<div id="cont-form">   
    <form id="form" action="javascript: return false;">
     <table border="0" align="left" width="100%" >
                     <tr><td style="text-align: left;"><h2>Registro de Clientes</h2></td></tr>
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

                    <tr><td style="text-align:right;"><button type="submit" class="button orange large"  >Guardar</button></td></tr>
     </table>
    </form>
 </div>

  <div id="cont-consulta">
   
                <table border="0" align="right" width="70%">
                     <tr><td style="text-align: center;"><h2>Consultar de Clientes</h2></td>
                   <td style="text-align: right;"><input type="text" name="idPersona" required placeholder="Cedula del cliente" class="box-text" ></td>
                </table>
                 <div id="tablaConsulta"> 
        
                 <table border="0" align="center" width="100%" id="mitabla" >
                     <thead>
                         <th width="20%">Cedula</th>
                         <th width="30%">Nombres</th>
                         <th width="30%">Apellidos</th>
                         <th width="5%">Sexo</th>
                         <th width="10%">Celular</th>
                         <th width="5%"></th>
                    </thead>

                    <tbody>
                    <?php foreach($personas as $persona){ ?>
                     <tr align="left">
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
              <div style=" margin-top: 2%;margin-left: 5%; float:left; width:45%;">
        <h2>Datos del Cliente</h2>
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
            <tr>
                <td></td>
                <td><button type="submit" class="button red small" >Modificar</button></td>
            </tr>
        </table>
    </div>  
            </div>