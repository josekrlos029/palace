<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of InicioControl
 *
 * @author JoseCarlos
 */
class InicioControl extends Controlador{
    
    public function __construct($modelo, $accion) {
        parent::__construct($modelo, $accion);
        $this->setModelo($modelo);
    }
    
    /**
     * Función que Imprime El Index (página principal de la Aplicación
     * @return type
     */
    public function index(){
        try {
            
            $this->vista->set('titulo', 'Inicio');
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }
     
    public function iniciarSesion(){
        try {
             $this->vista->set('titulo', 'Inicio de Sesion');
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }
     public function verificarUsuario(){
         try {
            $nombreUsuario = isset($_POST['usuario']) ? $_POST['usuario'] : NULL;
            $clave = isset($_POST['clave']) ? $_POST['clave'] : NULL;
            $user = new Usuario();
            $usuario = $user->verificarUsuario($nombreUsuario,$clave);
            if ($usuario == NULL) {
                echo json_encode(0);
            }else{
                session_start();
                $_SESSION['idUsuario'] = $usuario->getIdPersona();
                    $this->setVista('index');
                    return $this->vista->imprimir();
            }
        } catch (Exception $exc){
            echo  json_encode('Error de aplicacion: ' . $exc->getMessage());
        }   
        }
        
}

?>