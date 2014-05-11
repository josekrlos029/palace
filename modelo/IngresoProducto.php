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
    
    private $idPedido;
    private $idProducto;
    private $cantidad;
    private $fechaIngreso;
    private $precioFabrica;
        
    public function getIdPedido() {
        return $this->idPedido;
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
    
   public function setIdPedido($idFactura) {
        $this->idPedido = $idFactura;
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

    
    
    private function mapearPedido(IngresoProducto $producto, array $props) {
        if (array_key_exists('idIngreso', $props)) {
            $producto->setIdPedido($props['idIngreso']);
        }
        if (array_key_exists('idProducto', $props)) {
            $producto->setIdProducto($props['idProducto']);
        }
         if (array_key_exists('cantidad', $props)) {
            $producto->setCantidad($props['cantidad']);
        }
         if (array_key_exists('fechaIngreso', $props)) {
            $producto->setFechaIngreso($props['fechaIngreso']);
        }
        
        if (array_key_exists('precioFabrica', $props)) {
            $producto->setPrecioFabrica($props['precioFabrica']);
        }
 
    }
      
    private function getParametros(IngresoProducto $pro){
              
        $parametros = array(
            ':idProducto' => $pro->getIdProducto(),
            ':cantidad' => $pro->getCantidad(),
            ':fechaIngreso' => $pro->getFechaingreso(),
            ':precioFabrica' => $pro->getPrecioFabrica()
        );
        return $parametros;
    }

    
    
public function crearProducto(IngresoProducto $producto) {
        $sql = "INSERT INTO ingreso_producto (idProducto, cantidad, fechaIngreso, precioFabrica) VALUES (:idProducto, :cantidad, :fechaIngreso, :precioFabrica)";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros($producto));
    }

        
}

?>