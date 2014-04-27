<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of IngresoProducto
 *
 * @author JuanMi Martinez
 */
Class IngresoProducto extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idFactura;
    private $idProducto;
    private $cantidad;
    private $fechaIngreso;
    private $precioFabrica;
        
    public function getIdFactura() {
        return $this->idFactura;
    }

    public function getIdProducto() {
        return $this->idProducto;
    }


    public function getCantidad() {
        return $this->cantidad;
    }
    
    public function getFechaingreso() {
        return $this->fechaIngreso;
    }
    
    public function getPrecioFabrica() {
        return $this->precioFabrica;
    }
    
   public function setIdFactura($idFactura) {
        $this->idFactura = $idFactura;
    }
    
    public function setIdProducto($idProducto) {
        $this->idProducto = $idProducto;
    }
    
    public function setCantidad($cantidad) {
        $this->cantidad = $cantidad;
    }

    public function setFechaIngreso($fechaIngreso) {
        $this->fechaIngreso = $fechaIngreso;
    }

    public function setPrecioFabrica($precioFabrica) {
        $this->precioFabrica = $precioFabrica;
    }



        
        
}

?>
