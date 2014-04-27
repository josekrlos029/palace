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
                <table class="tablaRegsitro">
                    <tr>
                        <td>Cedula:<td>
                        <td style="text-align: left;"><input type="text"></td>    
                        <td>Nombre:</td>    
                        <td style="text-align: left;"><input type="text"></td> 
                    </tr>
                    <tr>
                        <td>Primer Apellido:<td>
                        <td style="text-align: left;"><input type="text"></td>      
                        <td>Segundo Apellido:</td>  
                        <td style="text-align: left;"><input type="text"></td>  
                    </tr>
                    <tr>
                        <td>Sexo:<td>
                        <td style="text-align: left;"><input type="text"></td>      
                        <td>Fecha de Nacimiento:</td>  
                        <td style="text-align: left;"><input type="date"></td>  
                    </tr>
                    <tr>
                        <td>Telefono<td>
                        <td style="text-align: left;"><input type="text"></td>      
                        <td>Celular</td> 
                        <td style="text-align: left;"><input type="text"></td>  
                    </tr>
                    <tr>
                        <td>Direccion<td>
                        <td style="text-align: left;"><input type="text"></td>      
                        <td>Correo</td>   
                        <td style="text-align: left;"><input type="text"></td>  
                    </tr>
                </table>
                
                <div style="width:20%; margin-left: 60%; margin-top: 5%;">
                            <input type="submit" class="button green large"  value="Guardar" onclick="envio()">
                </div>
            </div>        
        </div> 
    </body>
</html>