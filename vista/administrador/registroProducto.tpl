<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="../utiles/css/style-index.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/formularios.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/botones.css" rel="stylesheet" type="text/css" media="screen"/>
        <title>Administrador</title>
    </head>   
    <body>
       <div id="menu">
           <div id="cont-title">
               <h1><spam>Usuario</spam> | Administrador</h1>
           </div>
       </div>
        <div id="cuerpo">
            <div id="menu-horizontal">
                <div id="titulo"> <h1>Gestion de Productos</h1></div>
                <div id="cont-logo"><img src="../utiles/image/logo.jpg" width="150px" height="60px"/> </div>
            </div>
      
            
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
   
                <table border="0" align="left" width="100%" >
                     <tr><td style="text-align: left;"><h2>consultar Productos</h2></td>
                   <td style="text-align: left;"><input type="text" name="idPersona" required placeholder="Codigo Producto" class="box-text" ></td>  
                    <td style="text-align:right;"><input type="submit" class="button orange large"  value="Consultar" onclick="envio()"></td></tr>
                </table>
                 
                <div style="margin-top:20%;">
                 <table border="0" align="right" width="50%" >
                     <tr>
                         <td style="text-align: left;"><div class="title">Codigo:</div></td>
                         <td style="text-align:right;">10656554546</td></tr
                     <tr>
                         <td style="text-align: left;"><div class="title">Nombre:</div></td>
                         <td style="text-align:right;">HEadShoulders</td></tr>
                     <tr>
                         <td style="text-align: left;"><div class="title">Precio Proveedor:</div></td>
                         <td style="text-align:right;">$10000</td></tr>
                     <tr>
                         <td style="text-align: left;"><div class="title">Precio de Venta:</div></td>
                         <td style="text-align:right;">$12000</td></tr>
                </table>
                </div>
                 
                </div>
               
        </div> 
    </body>
</html>