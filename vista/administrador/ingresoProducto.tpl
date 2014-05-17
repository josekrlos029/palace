<script>
    function cargarTabla(){
        var x = $("#mensaje");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("speed");
        
        var idProducto = $("#producto").val();
        var inicio = $("#inicio").val();
        var fin = $("#fin").val();
        var data = { 
            idProducto: idProducto,
            inicio: inicio,
            fin: fin
        };

        $.ajax({
            type: "POST",
            url: "/palace/administrador/tablaIngresoProducto",
            data: data
        }).done(function(msg) {

            //var json = eval("(" + msg + ")");
            $("#cargaTabla").html(msg);
            ocultar();
            
        });


    }
</script>
<div  id="overlay"></div>
<div  id="mensaje">
    <div style="float:right">
        <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display = 'none';
                document.getElementById('fade').style.display = 'none'"><img src="../utiles/image/close.png"/></a>
    </div>

</div>
<div style=" margin-left: 5%; margin-top: 5%">
    
    <h2>Ingreso por producto</h2><br>
    <h3>Ingrese el rango de fecha que desea consultar</h3><br>
    <table width="100%">
        <tr>
            <td align="right">Fecha Inicio:</td>
            <td><input type="date" class="box-text" id="inicio"></td>
            <td align="right">Fecha Final:</td>
            <td><input type="date" class="box-text" id="fin"></td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td width="18%" align="right">Producto:</td>
            <td> 
                <select id="producto" class="box-text">
                    <?php foreach($productos as $pro){ ?>
                        <option value="<?php echo $pro->getIdProducto(); ?>"><?php echo $pro->getNombre();?></option>
                    <?php } ?>
                </select>
            </td>    
            <td style="text-align:right;"><button type="submit" class="button orange large" onclick="cargarTabla()">Buscar</button></td>
        </tr>
    </table>
    <div id="cargaTabla"></div>
</div>