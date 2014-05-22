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
    private $idServicio;
    private $idCliente;
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

    public function getIdServicio() {
        return $this->idServicio;
    }

    public function getIdCliente() {
        return $this->idCliente;
    }

    public function setIdServicio($idServicio) {
        $this->idServicio = $idServicio;
    }

    public function setIdCliente($idCliente) {
        $this->idCliente = $idCliente;
    }

    public function getReservado() {
        return $this->reservado;
    }

    public function getExitosa() {
        return $this->exitosa;
    }

    public function getCancelada() {
        return $this->cancelada;
    }

    public function getRechazada() {
        return $this->rechazada;
    }

    private function mapearCita(Cita $cita, array $props) {
        if (array_key_exists('idCita', $props)) {
            $cita->setIdCita($props['idCita']);
        }
         if (array_key_exists('idPersona', $props)) {
            $cita->setIdPersona($props['idPersona']);
        }
        if (array_key_exists('idServicio', $props)) {
            $cita->setIdServicio($props['idServicio']);
        }
        if (array_key_exists('idCliente', $props)) {
            $cita->setIdCliente($props['idCliente']);
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
            ':idServicio' => $pro->getIdServicio(),
            ':idCliente' => $pro->getIdCliente(),
            ':fecha' => $pro->getFecha(),
            ':hora' => $pro->getHora(),
            ':estado' => $pro->getEstado()
        );
        return $parametros;
    }
        
       public function crearCita(Cita $cita) {
        $sql = "INSERT INTO cita (idPersona, idServicio, idCliente, fecha, hora, estado) VALUES ( :idPersona, :idServicio, :idCliente, :fecha, :hora, :estado)";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros($cita));
    }
    
    public function leerCitaPorId($idPersona) {
        $sql = "SELECT * FROM cita c, servicio s, persona p WHERE c.idServicio=s.idServicio AND c.idcliente=p.idPersona AND c.idPersona='".$idPersona."'";
        $this->__setSql($sql);
        return $this->consultar($sql);
        
    }
        
    public function leerCitasCompletas() {
        $sql = "SELECT * FROM cita c, servicio s, persona p WHERE c.idServicio=s.idServicio AND c.idcliente=p.idPersona";
        $this->__setSql($sql);
        return $this->consultar($sql);
        
    }
        
}

?>
