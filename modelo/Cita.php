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
         
    private $reservado = "reservado";
    private $exitosa = "exitosa";
    private $cancelada = "cancelada";
    private $rechazada = "rechazada"; // se apartó la cita.. y no fue


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


private function mapearCita(Cita $cita, array $props) {
        if (array_key_exists('idCita', $props)) {
            $cita->setIdCita($props['idCita']);
        }
         if (array_key_exists('idPersona', $props)) {
            $cita->setIdPersona($props['idPersona']);
        }
         if (array_key_exists('fecha', $props)) {
            $cita->setFecha($props['fecha']);
        }
        
        if (array_key_exists('hora', $props)) {
            $cita->setHora($props['hora']);
        }
        if (array_key_exists('estado', $props)) {
            $cita->setEstado($props['estado']);
        }
    }
      
    private function getParametros(Cita $pro){
              
        $parametros = array(
            ':idPersona' => $pro->getIdPersona(),
            ':fecha' => $pro->getFecha(),
            ':hora' => $pro->getHora(),
            ':estado' => $pro->getEstado()
        );
        return $parametros;
    }
        
       public function crearCita(Cita $cita) {
        $sql = "INSERT INTO cita (idPersona, fecha, hora, estado) VALUES ( :idPersona, :fecha, :hora, :estado)";
        $this->__setSql($sql);
        return $this->ejecutar2($this->getParametros($cita));
    }
    
    public function leerCitaPorId($idPersona) {
        $sql = "SELECT * FROM cita c, servicio s WHERE c.idServicio=s.idServicio AND c.idPersona='".$idPersona."'";
        $this->__setSql($sql);
        return $this->consultar($sql);
        
    }
        
}

?>
