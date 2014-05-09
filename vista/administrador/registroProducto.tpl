
</head>
<script type="text/javascript">

    function consultaProducto(){
    document.getElementById('light').style.display='block';
    document.getElementById('fade').style.display='block' ;    
}

$("#form").submit(function(){

    var nombre = $("#nombre").val();
    var pVenta = $("#pVenta").val();
    
    
    var producto = {
        
        nombre: nombre,
        pVenta: pVenta    
    };
    
    $.ajax({
                      type: "POST",
                      url: "/palace/administrador/registrarProducto",
                      data: producto
                  })
                  .done(function(msg) {
                      
                      var json = eval("(" + msg + ")");
              
                      if (json == "exito") {
                          alert("exito");
                            //x.html ( "<p>Producto Registrada Correctamente</p>");
                            //exito();
                            //ocultar();
                         

                      } else if(json == 23000) {

                          alert("El producto ya Existe en el sistema");

                      }
                  });



});
</script>
<div id="cont-form">
    <form action="javascript: return false;" id="form">
                <table border="0" align="left" width="100%" >
                     <tr><td style="text-align: left;"><h2>Registro de Productos</h2></td></tr>
                    <tr><td style="text-align: left;"><input type="text" id="nombre" required placeholder="Nombre"  class="box-text" ></td></tr>
                    <tr><td style="text-align: left;"><input type="text" id="pVenta" required placeholder="Precio Venta"  class="box-text" ></td></tr>
                     <tr><td style="text-align:right;"><input type="submit" class="button orange large"  value="Guardar"></td></tr>
                </table>
    </form>            
                </div>
               <div id="cont-consulta">
   
                <table border="0" align="right" width="70%">
                     <tr><td style="text-align: center;"><h2>Consultar Productos</h2></td>
                   <td style="text-align: right;"><input type="text" name="idPersona" required placeholder="Nombre del Produto" class="box-text" ></td>
                </table>
                
                <div style="margin-top:10%;">
                 <table border="0" align="center" width="100%" id="mitabla">
                      <thead>
                         <th >Codigo</th>
                         <th width="30%">Nombre</th>
                         <th >Precion Venta</th>
                         <th  width="5%"</th>
                         </thead>
                         <tbody>
                      <tr align="left">
                          <?php foreach($productos as $producto){ ?>
                         <td ><?php echo $producto->getIdProducto(); ?></td>
                         <td ><?php echo $producto->getNombre(); ?></td>
                         <td ><?php echo $producto->getPrecioVenta(); ?></td>
                         <td style="text-align:right;"><input type="submit" class="button small red"  value="Ver +" onclick="consultaProducto();"></td>
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
                <div style=" margin-top: 5%; margin-left: 10%;">
                    <h2>Datos del producto</h2>
                    <br><br>
                    <table width="70%">
                      <tr>
                          <td>
                              Codigo:
                          </td>
                          <td>
                              <input type="text" class="box-text"/>
                          </td>                          
                      </tr>
                      <tr>
                          <td>
                              Nombre:
                          </td>
                          <td>
                              <input type="text" class="box-text"/>
                          </td>                          
                      </tr>
                      <tr>
                          <td>
                              Precio Proveedor:
                          </td>
                          <td>
                              <input type="text" class="box-text" />
                          </td>                          
                      </tr>
                      <tr>
                          <td>
                              Precio Venta:
                          </td>
                          <td>
                              <input type="text" class="box-text"/>
                          </td>                          
                      </tr>
                  </table>
                </div>
                
            </div>