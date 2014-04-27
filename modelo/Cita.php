<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Cita
 *
 * @author JuanMi Martinez
 */
class Cita extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idCita;
    private $idPersona;
    private $fecha;
    private $hora;
    private $estado;
        
    public function getIdCita() {
        return $this->idCita;
    }

    public function getIdPersona() {
        return $this->idPersona;
    }


    public function getFecha() {
        return $this->fecha;
    }
    
    public function getEstado() {
        return $this->estado;
    }
    
    public function getHora() {
        return $this->hora;
    }
    
   public function setIdCita($idCita) {
        $this->idCita = $idCita;
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

    public function setEstado($estado) {
        $this->estado = $estado;
    }



        
        
}

?>
