<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Producto
 *
 * @author JuanMi Martinez
 */
Class Producto extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idProducto;
    private $nombre;
    private $precioVenta;
        
    public function getIdProducto() {
        return $this->idProducto;
    }

    public function getNombre() {
        return $this->nombre;
    }


    public function getPrecioVenta() {
        return $this->precioVenta;
    }
    
   public function setIdProducto($idProducto) {
        $this->idProducto = $idProducto;
    }

    public function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    public function setPrecioVenta($precioVenta) {
        $this->precioVenta = $precioVenta;
    }

    
    private function mapearProducto(Producto $producto, array $props) {
        if (array_key_exists('idProducto', $props)) {
            $producto->setIdProducto($props['idProducto']);
        }
         if (array_key_exists('nombre', $props)) {
            $producto->setNombre($props['nombre']);
        }
         if (array_key_exists('precioVento', $props)) {
            $producto->setPrecioVenta($props['precioVento']);
        }
    }
    
    
  
    private function getParametros(Producto $pro){
              
        $parametros = array(
            ':idProducto' => $pro->getIdProducto(),
            ':nombre' => $pro->getNombre(),
            ':precioVenta' => $pro->getPrecioVenta()
        );
        return $parametros;
    }

    
    public function leerProductos() {
        $sql = "SELECT * FROM producto";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $productos = array();
        foreach ($resultado as $fila) {
            $producto = new Producto();
            $this->mapearProducto($producto, $fila);
            $productos[$producto->getIdProducto()] = $producto;
        }
        return $productos;
    }
        
        
}

?>
