<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="../utiles/css/style-index.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/menu.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/paciente.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/formularios.css" rel="stylesheet" type="text/css" media="screen"/>
        <script type='text/javascript' src='../utiles/js/jquery-1.9.1.min.js'></script>
         <script type='text/javascript' src='../utiles/js/jquery-ui.custom.min.js'></script>
        <title>Medico</title>
    </head> 
   
    <body>
       <div id="menu">
           <div id="cont-title">
               <h1><spam>Usuario</spam> | Mèdico</h1>
               <div id="hora">
                <?php
                    date_default_timezone_set('UTC');
                     echo date("r");
                ?>    
                </div>
           </div>
        <div style="margin-top:20px;"> 
           <ul class="accordion">
                <li id="one" class="files"><a href="#one">Pacientes<span>495</span></a>
                           <!-- <ul class="sub-menu">
                                <li><a href="#"><em>01</em>Registrar Cliente<span</span></a></li>
                                <li><a href="#"><em>02</em>Consultar Cliente<span></span></a></li> 
                                <li><a href="#"><em>03</em>Modificar Cliente<span></span></a></li> 
                            </ul>-->
                </li>
                <li id="two" class="mail"><a href="#two">Medicamentos y Productos<span>26</span></a>
                    
                </li>
                <li id="three" class="cloud"><a href="#three">Citas<span>58</span></a>
                      
                </li>
                
          </ul>
        </div> 
          
</div>
       </div>
        <div id="cuerpo">
            <div id="menu-horizontal">
                <div id="cont-logo">
                    <img src="../utiles/image/logo.jpg" width="150px" height="60px"/> 
                </div>
            </div>
            <div id="paciente">
                <table width="45%">
                    <tr>
                        <td>
                            <h2>Consultar Pacientes</h2>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <input class="box-text" type="text" placeholder="Nombre del Paciente">
                        </td>
                    </tr>
                </table>
            </div>       
                <br><br>
                <div style=" margin-left: 5%; width: 90%">
                    <table id="tablaPaciente" width="100%"  >
                    <tr align="center">
                        <td >
                            Cedula
                        </td>  
                        <td>
                            Nombre
                        </td>  
                        <td>
                            Apellido
                        </td> 
                        <td>
                            Sexo
                        </td> 
                        <td>
                            Fecha de Nacimiento
                        </td> 
                        <td>
                            Telefono
                        </td> 
                        <td>
                            Celular
                        </td> 
                        <td>
                            Direccion
                        </td> 
                        <td>
                            Correo
                        </td> 
                        <td>
                            Historial
                        </td> 
                    </tr>
                </table>
                </div>     
                
            
        </div> 
    </body>
    
</html>