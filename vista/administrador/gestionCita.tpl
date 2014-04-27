<link href="../utiles/css/fullcalendar.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="../utiles/css/fullcalendar.print.css" rel="stylesheet" type="text/css" media="screen"/>
<script src="../utiles/js/jquery-1.11.0.min.js"></script>
<script src="../utiles/js/jquery-ui.custom.min.js"></script>
<script src="../utiles/js/fullcalendar.min.js"></script>
<script>
  
   function disponibilidad(){
      
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
   
   
   
        
        $(document).ready(function(){
            $('#calendar').fullCalendar({
		
			editable: false,
			
			events: "",
			
			eventDrop: function(event, delta) {
				alert(event.title + ' was moved ' + delta + ' days\n' +
					'(should probably update your database)');
			},
			
			loading: function(bool) {
				if (bool) $('#loading').show();
				else $('#loading').hide();
			}
			
		});
		
	});    
       
   
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
<h1>Agregar Servicio a Cita</h1>
<table>
    <tr>
        <td>Fecha</td>
        <td>Servicio</td>
        <td>Servidor</td>
        
    </tr>
    <tr>
        <td>
            <input id="fecha" type="date" />
        </td>
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
        
    </tr>
    
</table>
<div class="calendario-agenda">
            <div id="loading"></div>
            <div id="calendar" style="width: 500px; margin: 0 auto;" ></div>
</div>
