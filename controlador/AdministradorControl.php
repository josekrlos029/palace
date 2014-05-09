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
            
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }  
      public function registroPersona(){
        try {
           
            $this->vista->set('titulo', 'Registrar Persona');

            $persona = new Persona();
            $personas = $persona->leerPersonas();
            $this->vista->set('personas', $personas);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
      public function registroProducto(){
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
            
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function registroEmpleado(){
        try {
           
            $this->vista->set('titulo', 'Registro Empleado');
            
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function gestionServicio(){
        try {
           
            $this->vista->set('titulo', 'Gestion Servicio');
            
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
            
            $idRol = $rol->getCliente();
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
        

    
}
