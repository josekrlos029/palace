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



        
        
}

?>
