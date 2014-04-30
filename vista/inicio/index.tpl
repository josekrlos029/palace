<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="../utiles/css/style-index.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/registroPersona.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/botones.css" rel="stylesheet" type="text/css" media="screen"/>
        <title>Inicio de sesion</title>
    </head>
    <body>
    <div style="width: 75%; height:100%; float:left;">
        <div style="margin-left:15%; margin-top:10%;"><img src="../utiles/image/logo.jpg" /></div>
    </div>
    <div style="width: 24%; height:100%; float:right; border-left:2px solid #3bc3f5;">
        <div style="margin-top: 60%; margin-left: 25%; ">
            <h1>Iniciar Sesion</h1>
        </div>
        <div style=" width: 80%; height: 20%; margin-top: 15%;margin-left: 10%; text-align: center;  ">
            <table>
                <tr>
                    <td>
                        Usuario:
                    </td>
                    <td>
                        <input type="text">
                    </td>
                </tr> 
                <tr>
                    <td>
                        Contraseña:
                    </td>
                    <td>
                        <input type="text">
                    </td>
                </tr>
            </table>
        </div>
        <div style="margin-left: 10%; width: 80% ">
        <input name="registrarPersona" id="registrarPersona" type="submit" class="button large blue " value="Iniciar Sesion" onclick="registroPersona()" />
        </div>
        <div style=" margin-top: 10%; margin-left: 30%;">¿Olvidaste tu Contraseña?</div>
    </div>
    </body>    
</html>