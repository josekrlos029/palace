   <script type="text/javascript">
function consultaCita(){
    document.getElementById('light').style.display='block';
    document.getElementById('fade').style.display='block'     
}
</script>
<div id="cont-form">   
     <table border="0" align="left" width="100%" >
                     <tr><td style="text-align: left;"><h2>Registro de Cita</h2></td></tr>
                  
                    <tr><td style="text-align: left;"><input type="text" name="idServicio" required placeholder="Codigo del servicio"  class="box-text" ></td></tr>
                    <tr><td style="text-align: left;"><input type="text" name="nombre" required placeholder="Servicio"  class="box-text" ></td></tr> 
                    <tr><td style="text-align: left;"><input type="text" name="tiempo" required placeholder="Tiempo de duracion"  class="box-text" ></td>      
                    <tr><td style="text-align: left;"><input type="text" name="precio" required placeholder="precio"  class="box-text" ></td></tr>
                     
                    

                    <tr><td style="text-align:right;"><input type="submit" class="button orange large"  value="Guardar" onclick="envio()"></td></tr>
                </table> 
 </div>
 <div id="cont-consulta">
   
                <table border="0" align="right" width="70%">
                     <tr><td style="text-align: center;"><h2>Consultar Servicios</h2></td>
                   <td style="text-align: right;"><input type="text" name="idServicio" required placeholder="Codigo del Servicio" class="box-text" ></td>
                </table>
 <div style="margin-top:10%;">
                 <table border="0" align="center" width="100%" id="mitabla">
                      <thead>
                         <th >Cedula del Servicio</th>
                         <th width="30%">Servicio</th>
                         <th >Tiempo</th>
                          <th >Precio</th>
                          <th></th>
                         </thead>
                         <tbody>
                      <tr align="left">
                         <td >10656</div></td>
                         <td >Corte de Cabello</div></td>
                         <td >20 min</div></td>
                         <td >15000</div></td>
                         <td style="text-align:right;"><input type="submit" class="button small red"  value="Ver +" onclick="consultaCita();"></td>
                         </tr>
                         
                         </tbody>
                     </tb
                </table>
                </div>
                 
                </div>
                <div id="fade" class="overlay"></div>
            <div id="light" class="modal">
              <div style="float:right">
                  <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><img src="../utiles/image/close.png"/></a>
             </div>
                
            </div>
              
                    