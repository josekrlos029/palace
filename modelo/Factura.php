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

    private function mapearFactura(Factura $factura, array $props) {
        if (array_key_exists('idFactura', $props)) {
            $factura->setIdFactura($props['idFactura']);
        }
         if (array_key_exists('idPersona', $props)) {
            $factura->setIdPersona($props['idPersona']);
        }
         if (array_key_exists('fecha', $props)) {
            $factura->setFecha($props['fecha']);
        }
        
        if (array_key_exists('hora', $props)) {
            $factura->setHora($props['hora']);
        }
 
    }
      
    private function getParametros(Factura $pro){
              
        $parametros = array(
            ':idPersona' => $pro->getIdPersona(),
            ':fecha' => $pro->getFecha(),
            ':hora' => $pro->getHora()
        );
        return $parametros;
    }

        public function crearFactura(Factura $factura) {
        $sql = "INSERT INTO factura (idPersona, fecha, hora) VALUES ( :idPersona, :fecha, :hora)";
        $this->__setSql($sql);
        return $this->ejecutar2($this->getParametros($factura));
    }
        
}

?>