<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of AdministradorControl
 *
 * @author JoseCarlos
 */
class AdministradorControl extends Controlador{
    
    public function __construct($modelo, $accion) {
        parent::__construct($modelo, $accion);
    }
    public function usuarioAdministrador(){
        try {
           
            $this->vista->set('titulo', 'Usuario Administrador');
            $persona = new Persona();
            $rol = new Rol();
            $personas = $persona->leerPersonasPorRol($rol->getCliente());
            $this->vista->set('personas', $personas);
            $producto = new Producto();
            $productos = $producto->leerProductos();
            $this->vista->set('productos', $productos);
            $empleado = new Persona();
            $servicio = new Servicio();
            $empleados = $empleado->leerPersonasPorRol($rol->getEmpleado());
            $servicios = $servicio->leerServicios();
            $this->vista->set('empleados', $empleados);
            $this->vista->set('servicios', $servicios);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }  
      public function registroPersona(){
        try {
           
            $this->vista->set('titulo', 'Registrar Persona');

            $rol = new Rol();
            $persona = new Persona();
            
            $personas = $persona->leerPersonasPorRol($rol->getCliente());
            $this->vista->set('personas', $personas);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
      public function inventarioProducto(){
        try {
           
            $this->vista->set('titulo', 'Registrar Persona');
            $producto = new Producto();
            $productos = $producto->leerProductos();
            $this->vista->set('productos', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function registroCita(){
        try {
           
            $this->vista->set('titulo', 'Registrar Persona');
            $servicio = new Servicio();
            $servicios = $servicio->leerServicios();
            $this->vista->set('servicios', $servicios);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function registroEmpleado(){
        try {
           
            $this->vista->set('titulo', 'Registro Empleado');
             $rol = new Rol();
            $persona = new Persona();
            $servicio = new Servicio();
            $personas = $persona->leerPersonasPorRol($rol->getEmpleado());
            $servicios = $servicio->leerServicios();
            $this->vista->set('personas', $personas);
            $this->vista->set('servicios', $servicios);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function gestionServicio(){
        try {
           
            $this->vista->set('titulo', 'Gestion Servicio');
            $servicio = new Servicio();
            $productos = $servicio->leerServicios();
            $this->vista->set('servicios', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function consultas(){
        try {
           
            $this->vista->set('titulo', 'Consultas');
            $servicio = new Servicio();
            $productos = $servicio->leerServicios();
            $this->vista->set('consultas', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function ingresoTotal(){
        try {
           
            $this->vista->set('titulo', 'Ingresos Totales');
            $servicio = new Servicio();
            $productos = $servicio->leerServicios();
            $this->vista->set('ingreso total', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function ingresoEmpleado(){
        try {
           
            $this->vista->set('titulo', 'Ingresos por Empleado');
            $servicio = new Servicio();
            $productos = $servicio->leerServicios();
            $this->vista->set('ingresos por empleado', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function ingresoServicio(){
        try {
           
            $this->vista->set('titulo', 'Ingresos por Servicio');
            $servicio = new Servicio();
            $servicios = $servicio->leerServicios();
            $this->vista->set('servicios', $servicios);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function ingresoProducto(){
        try {
           
            $this->vista->set('titulo', 'Ingresos por producto');
            $producto = new Producto();
            $productos = $producto->leerProductos();
            $this->vista->set('productos', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function cargaFecha(){
        try {
           
            $this->vista->set('titulo', 'Cargas por fecha');
            $producto = new Producto();
            $productos = $producto->leerProductos();
            $this->vista->set('productos', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function cargaProducto(){
        try {
           
            $this->vista->set('titulo', 'Cargas por producto');
            $producto = new Producto();
            $productos = $producto->leerProductos();
            $this->vista->set('productos', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        
    public function registrarPersona(){
        try {
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $nombres = isset($_POST['nombres']) ? $_POST['nombres'] : NULL;
            $pApellido = isset($_POST['pApellido']) ? $_POST['pApellido'] : NULL;
            $sApellido = isset($_POST['sApellido']) ? $_POST['sApellido'] : NULL;
            $sexo = isset($_POST['sexo']) ? $_POST['sexo'] : NULL;
            $fNacimiento = isset($_POST['fNacimiento']) ? $_POST['fNacimiento'] : NULL;
            $telefono = isset($_POST['telefono']) ? $_POST['telefono'] : NULL;
            $celular = isset($_POST['celular']) ? $_POST['celular'] : NULL;
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : NULL;
            $correo = isset($_POST['correo']) ? $_POST['correo'] : NULL;
            $r = isset($_POST['rol']) ? $_POST['rol'] : NULL;
            
            
            $persona = new Persona();

            $persona->setIdPersona($idPersona);
            $persona->setNombres($nombres);
            $persona->setPApellido($pApellido);
            $persona->setSApellido($sApellido);
            $persona->setSexo($sexo);
            $persona->setFNacimiento($fNacimiento);
            $persona->setTelefono($telefono);
            $persona->setCelular($celular);
            $persona->setDireccion($direccion);
            $persona->setCorreo($correo);

            $persona->crearPersona($persona);
            
            $rol = new Rol();
            if($r == "C"){
                $idRol = $rol->getCliente();
            }elseif($r == "E"){
                $idRol = $rol->getEmpleado();
                $servicios = isset($_POST['servicios']) ? $_POST['servicios'] : NULL;
                $servicios = json_decode($servicios);
                
                $servicio = new Servicio();
                foreach ($servicios as $a){
                    
                    $servicio->crearServicioPersona($a, $idPersona);
                }
                
            }
            
            $rol->crearRolPersona($idPersona, $idRol);
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }

        
        
    }
    
    public function registrarProducto(){
        
        try {
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : NULL;
            $precioVenta = isset($_POST['pVenta']) ? $_POST['pVenta'] : NULL;
            

            $producto = new Producto();

            $producto->setNombre($nombre);
            $producto->setPrecioVenta($precioVenta);
            

            $producto->crearProducto($producto);
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }

    }
    
    public function registrarIngresoProducto(){
        
        try {
            $idProducto = isset($_POST['idProducto']) ? $_POST['idProducto'] : NULL;
            $precio = isset($_POST['precio']) ? $_POST['precio'] : NULL;
            $cantidad = isset($_POST['unidades']) ? $_POST['unidades'] : NULL;
            
            $fecha = getdate();
            $FechaTxt=$fecha["year"]."-".$fecha["mon"]."-".$fecha["mday"];
            $producto = new IngresoProducto();
            $producto->setIdProducto($idProducto);
            $producto->setCantidad($cantidad);
            $producto->setPrecioFabrica($precio);
            $producto->setFechaIngreso($FechaTxt);
            
            $producto->crearProducto($producto);
            
            $p = new Producto();
            $pro = $p->leerProductoPorId($idProducto);
            
            $p->actualizarUnidades($idProducto, $pro->getUnidades()+$cantidad);
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }

    }
    
    public function registrarServicio(){
        
        try {
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : NULL;
            $tiempo = isset($_POST['tiempo']) ? $_POST['tiempo'] : NULL;
            $precio = isset($_POST['precio']) ? $_POST['precio'] : NULL;
            

            $servicio = new Servicio();

            $servicio->setNombre($nombre);
            $servicio->setTiempo($tiempo);
            $servicio->setPrecio($precio);
            

            $servicio->crearServicio($servicio);
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }

    }
    
    public function factura(){
        try {
           
            $this->vista->set('titulo', 'Facturar');
            
            $producto = new Producto();
            $productos = $producto->leerProductos();
                        
            $servicio = new Servicio();
            $servicios = $servicio->leerServicios();
            
            $this->vista->set('productos', $productos);
            $this->vista->set('servicios', $servicios);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
    }
        
    public function gestionCita(){
        try {
           
            $this->vista->set('titulo', 'Gestionar Cita');
            
            $servicio = new Servicio();
            $servicios = $servicio->leerServicios();
            
            $this->vista->set('servicios', $servicios);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
    }
        
    public function listarServidores($idServicio){
        
        try {
            $persona = new Persona();
        
        $personas = $persona->leerPorServicio($idServicio);
        
        $this->vista->set('personas', $personas);
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }

        
        
    }
    
    public function consultarProducto(){
        try {
                 $idProducto = isset($_POST['idProducto']) ? $_POST['idProducto'] : NULL;
                 $producto = new Producto();
                 $p = $producto->leerProductoPorId($idProducto);
                 
                 $ingresos = $producto->leerIngresoProducto($idProducto);
                 
                 foreach($ingresos as $ingreso){
                     
                     $p->setPrecioFabrica($ingreso["precioFabrica"]);
                     break;
                 }
                 
                 echo json_encode(array("idProducto"=>$p->getIdProducto(),"nombre"=>$p->getNombre(),"precio"=>$p->getPrecioVenta(),"precioFabrica"=>$p->getPrecioFabrica(),"unidades"=>$p->getUnidades()));      
                 
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }

    }
    
    public function consultarServicio(){
        try {
                 $idServicio = isset($_POST['idServicio']) ? $_POST['idServicio'] : NULL;
                 $servicio = new Servicio();
                 $s = $servicio->leerServicioPorId($idServicio);
                 
                 echo json_encode(array("idServicio"=>$s->getIdServicio(),"nombre"=>$s->getNombre(),"tiempo"=>$s->getTiempo(),"precio"=>$s->getPrecio()));      
                 
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }

    }
    public function consultarPersona(){
        try {
                 $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
                 $persona = new Persona();
                 $p = $persona->leerPorId($idPersona);
                 
                 echo json_encode(array("idPersona"=>$p->getIdPersona(),"nombre"=>$p->getNombres(),"primerApellido"=>$p->getPApellido(),"segundoApellido"=>$p->getSApellido(),"sexo"=>$p->getSexo(),"fechaNacimiento"=>$p->getFNacimiento()->format('Y-m-d'),"telefono"=>$p->getTelefono(),"celular"=>$p->getCelular(),"direccion"=>$p->getDireccion(),"correo"=>$p->getCorreo()));      
                 
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }

    }
    
    public function consultarNombrePersona(){
        try {
                 $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
                 $persona = new Persona();
                 $p = $persona->leerPorId($idPersona);
                 
                 if($p){
                     echo json_encode($p->getNombres()." ".$p->getPApellido()." ".$p->getSApellido());      
                 }else{
                     echo json_encode("No existe en la Base de Datos");      
                 }
                 
                 
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }

    }
    
    public function consultarPersonaPorServicio($idServicio){
        try {
           
            $this->vista->set('titulo', 'Gestionar Cita');
            
            $persona = new Persona();
            $personas = $persona->leerPersonasPorServicio($idServicio);
            
            $this->vista->set('personas', $personas);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
    }
    
    public function modificarPersona(){
        try {
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $nombres = isset($_POST['nombres']) ? $_POST['nombres'] : NULL;
            $pApellido = isset($_POST['pApellido']) ? $_POST['pApellido'] : NULL;
            $sApellido = isset($_POST['sApellido']) ? $_POST['sApellido'] : NULL;
            $sexo = isset($_POST['sexo']) ? $_POST['sexo'] : NULL;
            $fNacimiento = isset($_POST['fNacimiento']) ? $_POST['fNacimiento'] : NULL;
            $telefono = isset($_POST['telefono']) ? $_POST['telefono'] : NULL;
            $celular = isset($_POST['celular']) ? $_POST['celular'] : NULL;
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : NULL;
            $correo = isset($_POST['correo']) ? $_POST['correo'] : NULL;
            
            $persona = new Persona();

            $persona->setIdPersona($idPersona);
            $persona->setNombres($nombres);
            $persona->setPApellido($pApellido);
            $persona->setSApellido($sApellido);
            $persona->setSexo($sexo);
            $persona->setFNacimiento($fNacimiento);
            $persona->setTelefono($telefono);
            $persona->setCelular($celular);
            $persona->setDireccion($direccion);
            $persona->setCorreo($correo);

            $persona->actualizarPersona($persona);
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }
   
    }

     public function modificarServicio(){
        try {
            
            $idServicio = isset($_POST['codServic']) ? $_POST['codServic'] : NULL;
            $nombreServicio = isset($_POST['nombreServic']) ? $_POST['nombreServic'] : NULL;
            $tiempoServicio = isset($_POST['tServic']) ? $_POST['tServic'] : NULL;
            $precioServicio = isset($_POST['pServic']) ? $_POST['pServic'] : NULL;
           
            
            $servicio = new Servicio();
            $servicio->setIdServicio($idServicio);
            $servicio->setNombre($nombreServicio);
            $servicio->setPrecio($precioServicio);
            $servicio->setTiempo($tiempoServicio);

            $servicio->actualizarServicio($servicio);
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }

        
        
    }

    
    public function guardarFactura(){
        try {
            $servicios = isset($_POST['servicios']) ? $_POST['servicios'] : NULL;
            $servicios = json_decode($servicios);
            $productos = isset($_POST['productos']) ? $_POST['productos'] : NULL;
            $productos = json_decode($productos);
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $fecha = getdate();
            $fecha = $fecha["year"]."-".$fecha["mon"]."-".$fecha["mday"];
            $hora = date("H:i:s");
            $factura = new Factura();
            $factura->setIdPersona($idPersona);
            $factura->setFecha($fecha);
            $factura->setHora($hora);
            $idFactura = $factura->crearFactura($factura);
            
            foreach ($productos as $p){
                
                $df = new DetalleProducto();
                $df->setIdFactura($idFactura);
                $df->setIdProducto($p[0]);
                $df->setCantidad($p[1]);
                $df->setPrecioVenta($p[2]);
                $df->crearDetalleProducto($df);
                
                $producto = new Producto();
                $pro = $producto->leerProductoPorId($p[0]);
                $producto->actualizarUnidades($pro->getIdProducto(), $pro->getUnidades() - $p[1]);
            }
            
            foreach ($servicios as $s){
                $ds = new DetalleServicio();
                $ds->setIdFactura($idFactura);
                $ds->setIdServicio($s[0]);
                $ds->setIdPersona($s[1]);
                $ds->setPrecio($s[2]);
                $ds->crearDetalleServicio($ds);
            }
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getTraceAsString());
        }
        }
        
 public function tablaIngresoProducto(){
     $idProducto = isset($_POST['idProducto']) ? $_POST['idProducto'] : NULL;
     $inicio= isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
     $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;
     
     
     $dp = new DetalleProducto();
     $detalles = $dp->leerPagosPorIdProductoyRangoFecha($idProducto, $inicio, $fin);
     
     $this->vista->set('detalles', $detalles);
     return $this->vista->imprimir();
     
 }       
 
 public function tablaIngresoServicio(){
     $idServicio = isset($_POST['idServicio']) ? $_POST['idServicio'] : NULL;
     $inicio= isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
     $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;
     
     
     $ds = new DetalleServicio();
     $detalles = $ds->leerPagosPorIdServicioyRangoFecha($idServicio, $inicio, $fin);
     
     $this->vista->set('detalles', $detalles);
     return $this->vista->imprimir();
     
 }
 
 public function tablaIngresoEmpleado(){
     
     $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
     $inicio= isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
     $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;
     
     $ds = new DetalleServicio();
     $detalles = $ds->leerServiciosPorIdPersonayRangoFecha($idPersona, $inicio, $fin);
     $this->vista->set('detalles', $detalles);
     return $this->vista->imprimir();
 }
        
    
 public function tablaIngresoTotal(){
  
     $inicio= isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
     $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;
     
     $factura = new Factura();
     $detalles = $factura->leerFacturaPorRangoFecha($inicio, $fin);
     $this->vista->set('detalles', $detalles);
     return $this->vista->imprimir();   
 }
 
 public function consultarServiciosPersona() {
     $idPersona= isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
     
     $s = new Servicio();
     $servs = $s->leerServicios();
     $servicios = $s->leerServicioPorPersona($idPersona);
     
     $this->vista->set('servs', $servs);
     $this->vista->set('servicios', $servicios);
     return $this->vista->imprimir();   
     
 }
 
 public function agregarServiciosEmpleado(){
        try {
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $servicios = isset($_POST['servicios']) ? $_POST['servicios'] : NULL;
            $servicios = json_decode($servicios);
                
                $servicio = new Servicio();
                foreach ($servicios as $a){
                    
                    $s = $servicio->leerServicioPorIdServicioyPersona($idPersona, $a);
                    if($s == NULL){
                        $servicio->crearServicioPersona($a, $idPersona);
                    }
                    
                }
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }

        
        
    }

    public function eliminarServiciosEmpleado(){
        try {
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $idServicio = isset($_POST['idServicio']) ? $_POST['idServicio'] : NULL;
            
            $servicio = new Servicio();
            $servicio->eliminarServicioPersona($idPersona, $idServicio);
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }
   
    }
    
    public function detallesFactura(){
        $idFactura= isset($_POST['idFactura']) ? $_POST['idFactura'] : NULL;
        
        $ds = new DetalleServicio();
        $dp = new DetalleProducto();
        
        $dServicios = $ds->leerServiciosPorIdFactura($idFactura);
        $dProductos = $dp->leerProductosPorIdFactura($idFactura);
     
        $this->vista->set('ds', $dServicios);
        $this->vista->set('dp', $dProductos);
        return $this->vista->imprimir();   
    }
}
