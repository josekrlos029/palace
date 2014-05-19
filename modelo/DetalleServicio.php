<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DetalleServicio
 *
 * @author JuanMi Martinez
 */
class DetalleServicio extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idFactura;
    private $idServicio;
    private $idPersona;
    private $precio;
    
    public function getIdFactura() {
        return $this->idFactura;
    }

    public function getIdServicio() {
        return $this->idServicio;
    }

    public function getIdPersona() {
        return $this->idPersona;
    }

    public function getPrecio() {
        return $this->precio;
    }

    public function setIdFactura($idFactura) {
        $this->idFactura = $idFactura;
    }

    public function setIdServicio($idServicio) {
        $this->idServicio = $idServicio;
    }

    public function setIdPersona($idPersona) {
        $this->idPersona = $idPersona;
    }

    public function setPrecio($precio) {
        $this->precio = $precio;
    }

    
private function mapearDetalleServicio(DetalleServicio $servicio, array $props) {
        if (array_key_exists('idFactura', $props)) {
            $servicio->setIdFactura($props['idFactura']);
        }
         if (array_key_exists('idServicio', $props)) {
            $servicio->setIdServicio($props['idServicio']);
        }
         if (array_key_exists('idPersona', $props)) {
            $servicio->setIdPersona($props['idPersona']);
        }
        
        if (array_key_exists('precio', $props)) {
            $servicio->setPrecio($props['precio']);
        }
 
    }
      
    private function getParametros(DetalleServicio $pro){
              
        $parametros = array(
            ':idFactura' => $pro->getIdFactura(),
            ':idServicio' => $pro->getIdServicio(),
            ':idPersona' => $pro->getIdPersona(),
            ':precio' => $pro->getPrecio()
        );
        return $parametros;
    }
    
    public function leerServiciosPorIdFactura($idFactura){
        $sql = "SELECT * FROM detalles_servicio ds, persona p, servicio s WHERE ds.idServicio=s.idServicio AND ds.idPersona=p.idPersona AND ds.idFactura=".$idFactura;
        $this->__setSql($sql);
        return $this->consultar($sql);
        
        }

        public function crearDetalleServicio(DetalleServicio $factura) {
        $sql = "INSERT INTO detalles_servicio (idFactura,idServicio, idPersona, precio) VALUES ( :idFactura,:idServicio, :idPersona, :precio)";
        $this->__setSql($sql);
        return $this->ejecutar2($this->getParametros($factura));
        }
        
        public function leerPagosPorIdServicioyRangoFecha($idServicio,$inicio,$fin){
        $sql = "SELECT ds.idFactura, ds.idServicio, p.nombres, p.sApellido, p.pApellido, ds.precio, f.fecha FROM detalles_servicio ds, factura f, persona p WHERE ds.idFactura=f.idFactura AND ds.idPersona=p.idPersona AND ds.idServicio='".$idServicio."' AND f.fecha BETWEEN '".$inicio."' AND '".$fin."' ORDER BY f.fecha DESC";
        $this->__setSql($sql);
        return $this->consultar($sql);
        
        }
        
        public function leerServiciosPorIdPersonayRangoFecha($idPersona,$inicio,$fin){
        $sql = "SELECT ds.idFactura, ds.idServicio, p.nombres, p.sApellido, p.pApellido, ds.precio, f.fecha, s.nombre FROM detalles_servicio ds, factura f, persona p, servicio s WHERE ds.idFactura=f.idFactura AND ds.idPersona=p.idPersona AND ds.idServicio=s.idServicio AND ds.idPersona='".$idPersona."' AND f.fecha BETWEEN '".$inicio."' AND '".$fin."' ORDER BY f.fecha DESC";
        $this->__setSql($sql);
        return $this->consultar($sql);
        
        }
}

?>
