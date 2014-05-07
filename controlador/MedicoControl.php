<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of MedicoControl
 *
 * @author JuanMi Martinez
 */
class MedicoControl extends Controlador {
     public function __construct($modelo, $accion) {
        parent::__construct($modelo, $accion);
    }
    public function usuarioMedico(){
        try {
           
            $this->vista->set('titulo', 'Usuario Medico');
            
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }  
    
    public function paciente(){
        try {
           
            $this->vista->set('titulo', 'Informacion de Pacientes');
            
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
    public function medicamentos(){
        try {
           
            $this->vista->set('titulo', 'Informacion de Medicamentos');
            
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }    
    
}

?>
