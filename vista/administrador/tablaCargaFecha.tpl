<div id="mitabla">
        <table width="100%">
            <thead>
                        <th>N°</th>
                         <th width="30%">Codigo Producto</th>
                         <th width="30%">Nombre</th>
                         <th width="40%">Fecha</th>
                         <th width="30%">Cantidad</th>
                         <th width="40%">Precio Proveedor</th>
                         
            </thead>
            <tbody>
                <?php 
                    $cont=0;
                    $sum= 0;
                    foreach($detalles as $d){
                    $cont++;
                ?>
                <tr>
                    <td><?php echo $cont; ?></td>
                    <td><?php echo $d["idProducto"]; ?></td>
                    <td><?php echo $d["nombre"]; ?></td>
                    <td><?php echo $d["fechaIngreso"]; ?></td>
                    <td><?php echo $d["cantidad"]; ?></td>
                    <td><?php echo $d["precioFabrica"]; ?></td>
                </tr>
                <?php $sum +=  $d["precioFabrica"]; } ?>
            </tbody>
        </table>
    </div>
    <div style="margin-top: 5%; margin-left: 70%;">
        <a>Ingreso Total:</a>
        <input type="number" dir class="box-text" value="<?php echo $sum; ?>">
    </div>