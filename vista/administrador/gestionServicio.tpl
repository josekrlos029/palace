   <script type="text/javascript">
function consultaCita(){
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
 
        
        var nombre = $("#nombre").val();
        var tiempo = $("#tiempo").val();
        var precio = $("#precio").val();
        
        var servicio ={ nombre:nombre,
                    tiempo:tiempo,
                    precio:precio                    
        };
        
        $.ajax({
                      type: "POST",
                      url: "/palace/administrador/registrarServicio",
                      data: servicio
                  })
                  .done(function(msg) {
                      
                      var json = eval("(" + msg + ")");
              
                      if (json == "exito") {
                      
                            limpiarCajas();
                            
                            x.html ( "<p>Servicio Registrado Correctamente</p>");
                            y.html();
                            exito();
                            ocultar();
                         

                      } else if(json == 23000) {

                            limpiarCajas();
                            x.html ( "<p>Error al registrar Servicio</p>");
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
                     <tr><td style="text-align: left;"><h2>Registro de Servicio</h2></td></tr>
                  
 
                    <tr><td style="text-align: left;"><input type="text" id="nombre" required placeholder="Nombre del Servicio"  class="box-text" ></td></tr> 
                    <tr><td style="text-align: left;"><input type="number" id="tiempo" required placeholder="Tiempo de duracion en min."  class="box-text" ></td>      
                    <tr><td style="text-align: left;"><input type="number" id="precio" required placeholder="Precio"  class="box-text" ></td></tr>
                     
                    

                    <tr><td style="text-align:right;"><button type="submit" class="button orange large" >Guardar</button></td></tr>
                </table>
    </form>
 </div>
 <div id="cont-consulta">
   
                <table border="0" align="right" width="70%">
                     <tr><td style="text-align: center;"><h2>Consultar Servicios</h2></td>
                   <td style="text-align: right;"><input type="text" name="idServicio" required placeholder="Codigo del Servicio" class="box-text" ></td>
                </table>
                <div style="margin-top:10%;">
                 <table border="0" align="center" width="100%" id="mitabla">
                      <thead>
                         <th >COD del Servicio</th>
                         <th width="30%">Servicio</th>
                         <th >Tiempo</th>
                          <th >Precio</th>
                          <th></th>
                         </thead>
                         <tbody>
                      <?php foreach($servicios as $servicio){ ?>
                      <tr align="left">
                         <td ><?php echo $servicio->getIdServicio(); ?></td>
                         <td ><?php echo $servicio->getNombre(); ?></td>
                         <td ><?php echo $servicio->getTiempo(); ?></td>
                         <td ><?php echo $servicio->getPrecio(); ?></td>
                         <td style="text-align:right;"><input type="submit" class="button small red"  value="Ver +" onclick="consultaCita();"></td>
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
                  