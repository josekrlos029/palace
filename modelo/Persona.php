<?php
/**
 * Description of Persona
 *
 * @author JoseCarlos
 */
class Persona extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idPersona;
    private $nombres;    
    private $pApellido;
    private $sApellido;
    private $sexo;
    private $fNacimiento;
    private $telefono;
    private $direccion;
    private $celular;
    private $correo;
    
   
    
    public function getIdPersona() {
        return $this->idPersona;
    }

    public function setIdPersona($idPersona) {
        $this->idPersona = $idPersona;
    }

    public function getNombres() {
        return $this->nombres;
    }

    public function setNombres($nombres) {
        $this->nombres = $nombres;
    }

    

    public function getPApellido() {
        return $this->pApellido;
    }

    public function setPApellido($pApellido) {
        $this->pApellido = $pApellido;
    }

    public function getSApellido() {
        return $this->sApellido;
    }

    public function setSApellido($sApellido) {
        $this->sApellido = $sApellido;
    }

    public function getSexo() {
        return $this->sexo;
    }

    public function setSexo($sexo) {
        $this->sexo = $sexo;
    }

    public function getFNacimiento() {
        return $this->fechaNacimiento;
    }

    public function setFNacimiento($fNacimiento) {
        $this->fNacimiento = $fNacimiento;
    }

    public function getTelefono() {
        return $this->telefono;
    }

    public function setTelefono($telefono) {
        $this->telefono = $telefono;
    }
    
    public function getCelular() {
        return $this->celular;
    }

    public function setCelular($celular) {
        $this->celular = $celular;
    }

    public function getDireccion() {
        return $this->direccion;
    }

    public function setDireccion($direccion) {
        $this->direccion = $direccion;
    }

    public function getCorreo() {
        return $this->correo;
    }

    public function setCorreo($correo) {
        $this->correo = $correo;
    }

    

    

//Funciones CRUD
    
    private function mapearPersona(Persona $persona, array $props) {
        if (array_key_exists('id_persona', $props)) {
            $persona->setIdPersona($props['id_persona']);
        }
         if (array_key_exists('nombres', $props)) {
            $persona->setNombres($props['nombres']);
        }
         if (array_key_exists('pApellido', $props)) {
            $persona->setPApellido($props['pApellido']);
        }
        if (array_key_exists('sApellido', $props)) {
            $persona->setSApellido($props['sApellido']);
        }
        if (array_key_exists('sexo', $props)) {
            $persona->setSexo($props['sexo']);
        }
        if (array_key_exists('fNacimiento', $props)) {
            $persona->setFNacimiento(self::crearFecha($props['fNacimiento']));
        }
        if (array_key_exists('telefono', $props)) {
            $persona->setTelefono($props['telefono']);
        }
        if (array_key_exists('celular', $props)) {
            $persona->setCelular($props['celular']);
        }
        if (array_key_exists('direccion', $props)) {
            $persona->setDireccion($props['direccion']);
        }
        if (array_key_exists('correo', $props)) {
            $persona->setCorreo($props['correo']);
        }
        
        
        

    }
    
    
  
    private function getParametros(Persona $per){
              
        $parametros = array(
            ':id_persona' => $per->getIdPersona(),
            ':nombres' => $per->getNombres(),
            ':pApellido' => $per->getPApellido(),
            ':sApellido' => $per->getSApellido(),
            ':sexo' => $this->getSexo(),
            ':fNacimiento' => $per->getFNacimiento(),
            ':telefono' => $per->getTelefono(),
            ':Celular' => $per->getCelular(),
            ':direccion' => $per->getDireccion(),
            ':correo' => $per->getCorreo(),
            
            
        );
        return $parametros;
    }
    
    public function crearPersona(Persona $persona) {
        $sql = "INSERT INTO persona (idPersona, nombres, pApellido, sApellido, sexo, fNacimiento, telefono, celular, direccion, correo) VALUES ( :idPersona, :nombres :pApellido, :sApellido, :sexo, :fechaNacimiento, :telefono, :celular, :direccion, :correo)";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros($persona));
    }
    
    
    public function leerPersonas() {
        $sql = "SELECT * FROM persona";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $pers = array();
        foreach ($resultado as $fila) {
            $persona = new Persona();
            $this->mapearPersona($persona, $fila);
            $pers[$persona->getIdPersona()] = $persona;
        }
        return $pers;
    }
    
    public function leerPorRol($idRol) {
        $sql = "SELECT p.idPersona, p.nombres, p.pApellido, p.sApellido, p.sexo, p.fNacimiento, p.telefono, p.celular, p.direccion, p.correo  FROM persona p, rol_persona r WHERE p.idPersona=r.idPersona AND r.idRol='".$idRol."'";
        $resultado = $this->consultar($sql);
        $pers = array();
        foreach ($resultado as $fila) {
            $persona = new Persona();
            $this->mapearPersona($persona, $fila);
            $pers[$persona->getIdPersona()] = $persona;
        }
        return $pers;
    }
    
    public function leerPorServicio($idServicio) {
        $sql = "SELECT p.idPersona, p.nombres, p.pApellido, p.sApellido, p.sexo, p.fNacimiento, p.telefono, p.celular, p.direccion, p.correo  FROM persona p, servicio_empleado se  WHERE p.idPersona=se.idPersona AND se.idServicio=".$idServicio;
        $resultado = $this->consultar($sql);
        $pers = array();
        foreach ($resultado as $fila) {
            $persona = new Persona();
            $this->mapearPersona($persona, $fila);
            $pers[$persona->getIdPersona()] = $persona;
        }
        return $pers;
    }

    public function actualizarPersona(Persona $persona) {
        $sql = "UPDATE persona SET nombres=?, pApellido=?, sApellido=?, sexo=?, fNacimiento=?, telefono=?, celular=?, direccion=?, correo=? WHERE idPersona=?";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros($persona));        
        }
    
    
    public function eliminarPersona(Persona $persona) {
        $sql = "DELETE FROM persona where idPersona=:idPersona";
        $this->__setSql($sql);
        $param = array(':idPersona' => $persona->getIdPersona());
        $this->ejecutar($param);        
    }
    
   public function leerPorId($id){
        $sql = "SELECT idPersona, nombres, pApellido, sApellido, sexo, fNacimiento, telefono, celular, direccion, correo FROM persona ";
        $sql .= "WHERE idPersona='".$id."'";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $persona=NULL;
        foreach ($resultado as $fila) {
            $persona = new Persona();
            $this->mapearPersona($persona, $fila);
        }
        return $persona;
    }
          
           
    
}

?>
