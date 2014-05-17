<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Servicio
 *
 * @author JuanMi Martinez
 */
Class Servicio extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idServicio;
    private $nombre;
    private $tiempo;
    private $precio;
        
    public function getIdServicio() {
        return $this->idServicio;
    }

    public function getNombre() {
        return $this->nombre;
    }

    public function getTiempo() {
        return $this->tiempo;
    }

    public function getPrecio() {
        return $this->precio;
    }
    
   public function setIdServicio($idServicio) {
        $this->idServicio = $idServicio;
    }

    public function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    public function setTiempo($tiempo) {
        $this->tiempo = $tiempo;
    }

    public function setPrecio($precio) {
        $this->precio = $precio;
    }

    
    private function mapearServicio(Servicio $servicio, array $props) {
        if (array_key_exists('idServicio', $props)) {
            $servicio->setIdServicio($props['idServicio']);
        }
         if (array_key_exists('nombre', $props)) {
            $servicio->setNombre($props['nombre']);
        }
         if (array_key_exists('tiempo', $props)) {
            $servicio->setTiempo($props['tiempo']);
        }
        if (array_key_exists('precio', $props)) {
            $servicio->setPrecio($props['precio']);
        }
    }
    
    
  
    private function getParametros(Servicio $ser){
              
        $parametros = array(
            ':nombre' => $ser->getNombre(),
            ':tiempo' => $ser->getTiempo(),
            ':precio' => $ser->getPrecio()
        );
        return $parametros;
    }
    
    private function getParametros2(Servicio $ser){
              
        $parametros = array(
            ':idServicio' => $ser->getIdServicio(),
            ':nombre' => $ser->getNombre(),
            ':tiempo' => $ser->getTiempo(),
            ':precio' => $ser->getPrecio()
        );
        return $parametros;
    }

    
    public function leerServicios() {
        $sql = "SELECT * FROM servicio";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $servicios = array();
        foreach ($resultado as $fila) {
            $servicio = new Servicio();
            $this->mapearServicio($servicio, $fila);
            $servicios[$servicio->getIdServicio()] = $servicio;
        }
        return $servicios;
    }
        
    public function leerServicioPorId($idServicio) {
        $sql = "SELECT * FROM servicio WHERE idServicio=".$idServicio;
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $servicio = NULL;
        foreach ($resultado as $fila) {
            $servicio = new Servicio();
            $this->mapearServicio($servicio, $fila);
        }
        return $servicio;
    }
    
    public function crearServicio(Servicio $servicio) {
        $sql = "INSERT INTO servicio (nombre, tiempo, precio) VALUES ( :nombre, :tiempo, :precio)";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros($servicio));
    }
    
    public function crearServicioPersona($idServicio, $idPersona) {
        $sql = "INSERT INTO servicio_empleado (idPersona, idServicio) VALUES ( :idPersona, :idServicio)";
        $this->__setSql($sql);
        $this->ejecutar(array(":idPersona"=>$idPersona, ":idServicio"=>$idServicio));
    }
       
    public function actualizarServicio(Servicio $servicio) {
           $sql = "UPDATE servicio SET nombre=:nombre, tiempo=:tiempo, precio=:precio WHERE idServicio=:idServicio";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros2($servicio));
        
    }
        
}


?>
