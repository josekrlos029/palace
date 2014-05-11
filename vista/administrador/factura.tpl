<html>
   
<script src="../utiles/js/jquery-1.11.0.min.js"></script>
<script>
  
   function servidores(){
      
        var servicio = document.getElementById("servicio").value;
          
            $.ajax({
                type: "POST",
                url: "/palace/administrador/listarServidores/"+servicio,
                data: { }
              })
                .done(function( msg ) {
                    $("#servidor").html(msg);
                });
            
   }
   
   function agregarProducto(){
       var producto=$("#producto  option:selected").html();
       var cantidad=$("#cantidad").val();
       
       $("#detallesProducto").append("<tr><td>"+producto+"</td><td>"+cantidad+"</td><td></td><td></td></tr>");
   }
   
   function agregarServicio(){
       
       var servicio=$("#servicio  option:selected").html();
       var servidor=$("#servidor  option:selected").html();
       
       $("#detallesServicio").append("<tr><td>"+servicio+"</td><td>"+servidor+"</td><td></td></tr>");
   }
</script>

      
        <div style=" width: 80%; margin-left: 10%; margin-top: 3%;"> 
        <div style="margin-left: 40%"> 
            <table width="100%" id="mitabla">
                <tr>
                    <td>Codigo Factura:</td>
                    <td><input type="number"  class="box-text"></td>
                    <td>Fecha:</td>
                    <td><input type="date" class="box-text"></td>
                    
                </tr>
            </table>
        </div>    
        <div> <h2> Datos Personales</h2></div> 
        <br><br>
        <table width="60%" >
             <tr>
                <td>Cedula:</td>
                <td><input id="idPersona" class="box-text" type="number" /></td>
             </tr>
    
            <tr >
                <td>Nombre Cliente:</td>
                <td id="nombre">
                    Juan Miguel Martinez
                </td>
            </tr>
                      
        </table>
        <br>
            <table id="mitabla" width="100%" >
                <thead>
                    <th width="10%">Codigo</th>
                    <th>Producto</th>
                    <th>Servicio</th>
                    <th>Servidor</th>
                    <th width="10%">Cantidad</th>
                    <th width="15%">Precio Unid.</th>
                    <th width="15%">Precio total</th>
                    <th width="8%">Agregar</th>
                </thead>
                <tr>
                    <td><input class="box-text" id="cantidad" type="number" /></td>
                    <td >
                        
                        <select class="box-text" id="producto">
                        <?php foreach($productos as $pro){ ?>
                        <option value="<?php echo $pro->getIdProducto(); ?>"><?php echo $pro->getNombre();?></option>
                        <?php } ?>
                        </select>
                    </td>
                    <td >
                        <select id="servicio" class="box-text" onchange="servidores()">
                        <?php foreach($servicios as $ser){ ?>
                        <option value="<?php echo $ser->getIdServicio(); ?>"><?php echo $ser->getNombre();?></option>
                        <?php } ?>
                        </select>
                    </td>
                    <td>
                        <select class="box-text" id="servidor">
                
                        </select>  
                    </td>
                    <td><input class="box-text" id="cantidad" type="number" /></td>
                    <td><input class="box-text" id="precioUnid" type="number" /></td>
                    <td ><input class="box-text" id="precioTotal" type="number" /></td>
                    <td><button id="agregarProducto" class="button small red" onclick="agregarProducto()">Agregar</button></td>
                </tr>
    
            </table>
            <div style="margin-left: 70%;">
                <table>
                    <tr>
                        <td>
                            Total:
                        </td>
                        <td>
                           <input class="box-text" id="precioTotal" type="number" />
                        </td>
                    </tr>
                </table>
            </div>
            <div style="margin-left: 70%; margin-top: 3%;"> 
                <button type="submit" class="button small red"> Guardar</button>
                <button type="submit" class="button small red"> Imprimir</button>
            </div>
            <br>
            
            
            
         </div>

</html>            
