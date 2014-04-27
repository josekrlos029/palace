<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Factura
 *
 * @author JuanMi Martinez
 */
Class Factura extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idFactura;
    private $idPersona;
    private $fecha;
    private $hora;
        
    public function getIdFactura() {
        return $this->idFactura;
    }

    public function getIdPersona() {
        return $this->idPersona;
    }


    public function getFecha() {
        return $this->fecha;
    }
    
    public function getHora() {
        return $this->hora;
    }
    
   public function setIdFactura($idFactura) {
        $this->idFactura = $idFactura;
    }
    
    public function setIdPersona($idPersona) {
        $this->idPersona = $idPersona;
    }

    public function setFecha($fecha) {
        $this->fecha = $fecha;
    }

    public function setHora($hora) {
        $this->hora = $hora;
    }



        
        
}


?>
