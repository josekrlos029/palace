<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DetalleProducto
 *
 * @author JuanMi Martinez
 */
class DetalleProducto extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idFactura;
    private $idProducto;
    private $cantidad;
    private $precioVenta;
        
    public function getIdFactura() {
        return $this->idFactura;
    }

    public function getIdProducto() {
        return $this->idProducto;
    }


    public function getCantidad() {
        return $this->cantidad;
    }
    
    public function getPrecioVenta() {
        return $this->precioVenta;
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

    public function setPrecioVenta($precioVenta) {
        $this->precioVenta = $precioVenta;
    }



        
        
}

?>
