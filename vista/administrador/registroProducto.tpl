  <script type="text/javascript">
function consultaProducto(){
    document.getElementById('light').style.display='block';
    document.getElementById('fade').style.display='block'     
}
</script>
<div id="cont-form">
      
                <table border="0" align="left" width="100%" >
                     <tr><td style="text-align: left;"><h2>Registro de Productos</h2></td></tr>
                    <tr><td style="text-align: left;"><input type="text" name="idPersona" required placeholder="Codigo Producto" class="box-text" ></td></tr>    
                    <tr><td style="text-align: left;"><input type="text" name="nombres" required placeholder="Nombre"  class="box-text" ></td></tr> 
                    <tr><td style="text-align: left;"><input type="text" name="pApellido" required placeholder="Precio Proveedor"  class="box-text" ></td>      
                    <tr><td style="text-align: left;"><input type="text" name="sApellido" required placeholder="Precio Venta"  class="box-text" ></td></tr>
                     <tr><td style="text-align:right;"><input type="submit" class="button orange large"  value="Guardar" onclick="envio()"></td></tr>
                </table>
                
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
                         <th >Precio Proveerdor</th>
                         <th >Precion Venta</th>
                         <th  width="5%"</th>
                         </thead>
                         <tbody>
                      <tr align="left">
                         <td >1065655456</div></td>
                         <td >Head and Shoulder</div></td>
                         <td >10000</div></td>
                         <td >50000</div></td>
                         <td style="text-align:right;"><input type="submit" class="button small red"  value="Ver +" onclick="consultaProducto();"></td>
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