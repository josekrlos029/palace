<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="../utiles/css/style-index.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/registroPersona.css" rel="stylesheet" type="text/css" media="screen"/>
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
                <div id="cont-logo"><img src="../utiles/image/logo.jpg" width="150px" height="60px"/> </div>
            </div>
            <div>
                <div style="text-align: center; margin-top: 5% "><h1>Registrar Persona</h1></div>
                <table class="tablaRegsitro">
                    <tr>
                        <td>Codigo Producto:<td>
                        <td style="text-align: left;"><input type="text" name="idPersona" required></td>    
                        <td>Nombre:</td>    
                        <td style="text-align: left;"><input type="text" name="nombres" required></td> 
                    </tr>
                    <tr>
                        <td>Precio Proveedor:<td>
                        <td style="text-align: left;"><input type="text" name="pApellido" required></td>      
                        <td>Precio de Venta:</td>  
                        <td style="text-align: left;"><input type="text" name="sApellido" required></td>  
                    </tr>
                    
                </table>
                
                <div style="width:20%; margin-left: 60%; margin-top: 3%;">
                            <input type="submit" class="button green large"  value="Guardar" onclick="envio()">
                </div>
            </div>        
        </div> 
    </body>
</html>