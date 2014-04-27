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
            <select id="servicio">
                
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
<table id="detallesservicio">
    <tr>
        <td>Servicio</td>
        <td>Servidor</td>
        <td>Precio</td>
    </tr>
    
</table>
