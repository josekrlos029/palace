   <script type="text/javascript">
function consultaPersona(){
    document.getElementById('light').style.display='block';
    document.getElementById('fade').style.display='block'     
}

$("#form").submit(function(){
        
        var x = $("#mensaje");
        var y = $("#overlay");
        cargando();
        x.html ("<p>Cargando...</p>");
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
        var j=0;
        for (var i=0; i<servicios.length; i++){ 
         if (servicios[i].selected == true){
          arreglo[j]=servicios[i].value;
          j++;
          }
        }
        
        
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
                            x.html ( "<p>Empleado Registrado Correctamente</p>");
                            y.html();
                            exito();
                            ocultar();
                         

                      } else if(json == 23000) {

                            limpiarCajas();
                            x.html ( "<p>Error al registrar Empleado</p>");
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
                  <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><img src="../utiles/image/close.png"/></a>
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
                    <tr><td style="text-align: left;"><select multiple="" id="servicios">
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
                   <td style="text-align: right;"><input type="text" name="idPersona" required placeholder="Cedula del cliente" class="box-text" ></td>
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
                
            </div>