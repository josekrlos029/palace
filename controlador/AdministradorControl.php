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
     public function modificarProducto(){
        try {
            $idProducto = isset($_POST['codProduct']) ? $_POST['codProduct'] : NULL;
            $nombre = isset($_POST['nombreProduct']) ? $_POST['nombreProduct'] : NULL;
            $precioVenta = isset($_POST['pVentaProduct']) ? $_POST['pVentaProduct'] : NULL;
           
            
            $producto = new Producto();
            $producto->setIdProducto($idProducto);
            $producto->setNombre($nombre);
            $producto->setPrecioVenta($precioVenta);
          

            $producto->actualizarProducto($producto);
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }

        
        
    }
}
