   <script type="text/javascript">

    function consultaPersona(){
    document.getElementById('light').style.display='block';
    document.getElementById('fade').style.display='block'     

    }   

    $("#form").submit(function(){
        
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
                    correo:correo        
        };
        
        $.ajax({
                      type: "POST",
                      url: "/palace/administrador/registrarPersona",
                      data: persona
                  })
                  .done(function(msg) {
                      
                      var json = eval("(" + msg + ")");
              
                      if (json == "exito") {
                          alert("Persona Registrada Correctamente");

                      } else if(json == 23000) {

                          alert("La persona o el correo de la persona ya existe en el sistema");

                      }
                  });
        
    });
   
</script>
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

                    <tr><td style="text-align:right;"><input type="submit" class="button orange large"  value="Guardar"></td></tr>
     </table>
    </form>
 </div>

  <div id="cont-consulta">
   
                <table border="0" align="right" width="70%">
                     <tr><td style="text-align: center;"><h2>Consultar de Clientes</h2></td>
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
                     <tr align="left">
                         <td>1065655456</td>
                         <td>Andy Yair </td>
                         <td>Bolaño Castilla</td>
                         <td>M</td>
                         <td>3215288972</td>
                         <td style="text-align:right;"><input type="submit" class="button small red"  value="Ver +" onclick="consultaPersona();"></td> 
                     </tr>
                     
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