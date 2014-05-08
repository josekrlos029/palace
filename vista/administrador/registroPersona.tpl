 <div id="cont-form">   
     <table border="0" align="left" width="100%" >
                     <tr><td style="text-align: left;"><h2>Registro de Clientes</h2></td></tr>
                    <tr><td style="text-align: left;"><input type="text" name="idPersona" required placeholder="Cedula" class="box-text" ></td></tr>    
                    <tr><td style="text-align: left;"><input type="text" name="nombres" required placeholder="Nombres"  class="box-text" ></td></tr> 
                    <tr><td style="text-align: left;"><input type="text" name="pApellido" required placeholder="Primer Apellido"  class="box-text" ></td>      
                    <tr><td style="text-align: left;"><input type="text" name="sApellido" required placeholder="Segundo Apellido"  class="box-text" ></td></tr>
                     <tr><td style="text-align: left;"><input type="text" name="sApellido" required placeholder="Sexo"  class="box-text" ></td></tr>
                     <tr><td style="text-align: left;"><input type="text" name="sApellido" required placeholder="Fecha de Nacimiento"  class="box-text" ></td></tr>
                     <tr><td style="text-align: left;"><input type="text" name="sApellido" required placeholder="Telefono"  class="box-text" ></td></tr>
                    <tr><td style="text-align: left;"><input type="text" name="sApellido" required placeholder="Celular"  class="box-text" ></td></tr>
                    <tr><td style="text-align: left;"><input type="text" name="sApellido" required placeholder="Direccion"  class="box-text" ></td></tr>
                    <tr><td style="text-align: left;"><input type="text" name="sApellido" required placeholder="Correo Electronico"  class="box-text" ></td></tr>

                    <tr><td style="text-align:right;"><input type="submit" class="button orange large"  value="Guardar" onclick="envio()"></td></tr>
                </table>
     
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
                         <td style="text-align:right;"><input type="submit" class="button small red"  value="Ver +" onclick="envio()"></td> 
                     </tr>
                      <tr align="left">
                         <td>1065655456</td>
                         <td>Andy Yair </td>
                         <td>Bolaño Castilla</td>
                         <td>M</td>
                         <td>3215288972</td>
                         <td valign="center" style="text-align:right;"><input type="submit" class="button small red"  value="Ver +" onclick="envio()"></td> 
                     </tr>
                     </tbody>
                </table>
                </div>
                 
                </div>