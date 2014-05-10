<?php
/* 
* To change this template, choose Tools | Templates
* and open the template in the editor.
*/

?>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="../utiles/css/style-index.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/menu.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/formularios.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/botones.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/tablas.css" rel="stylesheet" type="text/css" media="screen"/>
         <script src="../utiles/js/js.js" type="text/javascript"></script>
        <script src="../utiles/js/jquery-1.11.0.min.js" type="text/javascript"></script>
         <script type='text/javascript' src='../utiles/js/jquery-ui.custom.min.js'></script>
         
        <title>Administrador</title>
        
        <script>
            
           function cargarRegistroPersona(){
               $("#titulo").html("<h1>Gestion de Clientes</h1>");
               $("#contenido").load("/palace/administrador/registroPersona");
               
           }
           
           function cargarRegistroProducto(){
               $("#contenido").load("/palace/administrador/registroProducto");
               $("#titulo").html("<h1>Gestion de Productos</h1>");
           }
           function cargarCitas(){
               $("#contenido").load("/palace/administrador/registroCita");
               $("#titulo").html("<h1>Gestion de Citas</h1>");
           }
           function cargarGestionEmpleado(){
               $("#contenido").load("/palace/administrador/registroEmpleado");
               $("#titulo").html("<h1>Gestion de Empleados</h1>");
           }
           function cargarGestionServicio(){
               $("#contenido").load("/palace/administrador/gestionServicio");
               $("#titulo").html("<h1>Gestion de Servicios</h1>");
           }
           
            
        </script>
        
    </head> 
   
    <body>
       <div id="menu">
           <div id="cont-title">
               <h1><spam>Usuario</spam> | Administrador</h1>
               <div id="hora">
                <?php
                    date_default_timezone_set('UTC');
                     echo date("r");
                ?>    
                </div>
           </div>
        <div style="margin-top:20px;"> 
           <ul class="accordion">
               <li id="one" class="files"><a onclick="cargarRegistroPersona()" href="#">Clientes<span>495</span></a>
                           <!-- <ul class="sub-menu">
                                <li><a href="#"><em>01</em>Registrar Cliente<span</span></a></li>
                                <li><a href="#"><em>02</em>Consultar Cliente<span></span></a></li> 
                                <li><a href="#"><em>03</em>Modificar Cliente<span></span></a></li> 
                            </ul>-->
                </li>
                <li id="two" class="mail"><a onclick="cargarRegistroProducto()" href="#">Productos<span>26</span></a>
                    
                </li>
                <li id="three" class="cloud"><a onclick="cargarCitas()" href="#">Citas<span>58</span></a>
                      
                </li>
                <li id="four" class="sign"><a href="#">Inventario</a></li>
                <li id="five" class="sign"><a onclick="cargarGestionServicio()" href="#">Servicios</a></li>
                <li id="six" class="sign"><a onclick="cargarGestionEmpleado()" href="#">Empleados</a></li>
          </ul>
        </div> 
          
</div>
       </div>
        <div id="cuerpo">
            <div id="menu-horizontal">
                <div id="titulo"></div>
                <div id="cont-logo">
                    <img src="../utiles/image/logo.jpg" width="150px" height="60px"/> 
                </div>
            </div>
            
            <div id="contenido">
                
            </div>
            
        </div> 
    </body>
    
</html>