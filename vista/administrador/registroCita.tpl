<script type="text/javascript">
    function consultaDisponibilidad(idPersona) {
        document.getElementById('light').style.display = 'block';
        document.getElementById('fade').style.display = 'block';

        $("#consultaServidor").html("...");

    }

    function buscar() {

        var idServicio = $("#servicio").val();
        $("#consulta").load("/palace/administrador/consultarPersonaPorServicio/" + idServicio);

    }

</script>
<div id="cont-form">   
    <table border="0" align="left" width="100%" >
        <tr><td style="text-align: left;"><h2>Servicios</h2></td></tr>

        <tr>
            <td style="text-align: left;">
                <select id="servicio" onchange="buscar();">
                    <option> </option>
                    <?php foreach($servicios as $servicio){ ?>
                    <option value="<?php echo $servicio->getIdServicio(); ?>"><?php echo $servicio->getNombre(); ?></option>
                    <?php } ?>
                </select>
            </td>
        </tr>

    </table> 
    <br>
    <div id="consulta">

    </div>


</div>
<div id="cont-consulta">

    <table border="0" align="right" width="70%">
        <tr><td style="text-align: center;"><h2>Consultar Citas</h2></td>
            <td style="text-align: right;"><input type="text" name="idPersona" required placeholder="Cedula del Cliente" class="box-text" ></td>
    </table>
    <div style="margin-top:10%;">
        <table border="0" align="center" width="100%" id="mitabla">
            <thead>
            <th >Cedula del Cliente</th>
            <th width="30%">Nombre del Cliente</th>
            <th >fecha</th>
            <th >Hora</th>
            <th></th>
            </thead>
            <tbody>
                <tr align="left">
                    <td >1065655456</div></td>
                    <td >Jose Carlos Jimenez</div></td>
                    <td >10000</div></td>
                    <td >50000</div></td>
                    <td style="text-align:right;"><button type="submit" class="button small red"  onclick="consultaCita();">...</button></td>
                </tr>

            </tbody>

        </table>
    </div>

</div>
<div id="fade" class="overlay"></div>
<div id="light" class="modal1">
    <div style="float:right">
        <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display = 'none';
           document.getElementById('fade').style.display = 'none'"><img src="../utiles/image/close.png"/></a>
       
    </div>  
    <div style="margin-top: 5%; margin-left: 10%">
           <h1>Horario Servidor</h1>
           <br><br>
           <table width="70%">
               <tr>
                   <td>
                       hora inicio:
                   </td>
                   <td>
                       <input type="time" class="box-text">
                   </td>
                   <td>
                       Duracion:
                   </td>
                   <td>
                       <input type="number" class="box-text">
                   </td>
               </tr>
           </table>
       </div>
    <div style="margin-top: 40%; margin-left: 80%;">
        <button class="button small red"> Agendar</button>
    </div>
    <div id="consultaServidor" style="float: left;"></div>

</div>


