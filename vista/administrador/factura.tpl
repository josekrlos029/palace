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
<table>
    <tr>
        <td>Id Cliente:</td>
        <td><input id="idPersona" type="number" /></td>
    </tr>
    
    <tr>
        <td>Nombre:</td>
        <td id="nombre"></td>
    </tr>
       
    
    
</table>
<br>
<h1>Agregar Producto</h1>
<table>
    <tr>
        <td>Producto</td>
        <td>Cantidad</td>
        <td>Agregar</td>
    </tr>
    <tr>
        <td>
            <select id="producto">
                <?php foreach($productos as $pro){ ?>
                <option value="<?php echo $pro->getIdProducto(); ?>"><?php echo $pro->getNombre();?></option>
                <?php } ?>
            </select>
        </td>
        <td><input id="cantidad" type="number" /></td>
        <td><button id="agregarProducto" onclick="agregarProducto()">Agregar</button></td>
    </tr>
    
</table>
<br>
<h1>Agregar Servicio</h1>
<table>
    <tr>
        <td>Servicio</td>
        <td>Servidor</td>
        <td></td>
        <td>Agregar</td>
    </tr>
    <tr>
        <td>
            <select id="servicio" onchange="servidores()">
                <?php foreach($servicios as $ser){ ?>
                <option value="<?php echo $ser->getIdServicio(); ?>"><?php echo $ser->getNombre();?></option>
                <?php } ?>
            </select>
        </td>
        <td>
            <select id="servidor">
                
            </select>        
        </td>
        <td></td>
        <td><button id="agregarServicio" onclick="agregarServicio()">Agregar</button></td>
    </tr>
    
</table>

<table id="detallesProducto">
    <tr>
        <td>Producto</td>
        <td>Cantidad</td>
        <td>Vr.Unidad</td>
        <td>Vr.Total</td>
    </tr>
    
</table>
<table id="detallesServicio">
    <tr>
        <td>Servicio</td>
        <td>Servidor</td>
        <td>Precio</td
    </tr>
    
</table>
