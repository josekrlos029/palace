<div id="mitabla">
        <table width="100%">
            <thead> 
                        <th>N°</th>
                         <th width="30%">Codigo Venta</th>
                         <th width="30%">Fecha</th>
                         <th width="40%">Valor</th>
                         
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
                    <td><?php echo $d["idFactura"]; ?></td>
                    <td><?php echo $d["fecha"]; ?></td>
                    <td><?php echo $d["sumaServicios"]+$d["sumaProductos"]; ?></td>
                    
                    
                </tr>
                <?php $sum += $d["sumaServicios"]+$d["sumaProductos"]; } ?>
            </tbody>
        </table>
    </div>
    <div style="margin-top: 5%; margin-left: 70%;">
        <a>Ingreso Total:</a>
        <input type="number" class="box-text" value="<?php echo $sum; ?>" disabled>
    </div>