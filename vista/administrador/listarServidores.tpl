<?php foreach ($personas as $persona) { ?>
<option value="<?php echo $persona->getIdPersona(); ?>"><?php echo $persona->getNombre()." ".$persona->getPApellido(); ?></option>
<?php } ?>
