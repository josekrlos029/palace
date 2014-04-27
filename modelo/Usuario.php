<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Usuario
 *
 * @author JoseCarlos
 */
class Usuario extends Modelo{
    
    private $idPersona;
    private $usuario;
    private $clave;
    
    public function getIdPersona() {
        return $this->idPersona;
    }

    public function getUsuario() {
        return $this->usuario;
    }

    public function getClave() {
        return $this->clave;
    }

    public function setIdPersona($idPersona) {
        $this->idPersona = $idPersona;
    }

    public function setUsuario($usuario) {
        $this->usuario = $usuario;
    }

    public function setClave($clave) {
        $this->clave = $clave;
    }
    
    private function mapearUsuario(Usuario $usuario, array $props) {
        if (array_key_exists('idPersona', $props)) {
            $usuario->setIdPersona($props['idPersona']);
        }
         if (array_key_exists('usuario', $props)) {
            $usuario->setUsuario($props['usuario']);
        }
        if (array_key_exists('clave', $props)) {
            $usuario->setClave($props['clave']);
        }
        
    }
  
    private function getParametros(Usuario $adm){
              
        $parametros = array(
            ':idPersona' => $adm->getIdPersona(),
            ':usuario' => $adm->getUsuario(),
            ':clave' => sha1( $adm->getContraseña())
            );
        return $parametros;
    }

 public function verificarUsuario($usuario, $clave) {
        $sql = "SELECT * FROM usuario WHERE usuario=? AND clave=?";
        $clave1= sha1($clave);
        $param = array($usuario,$clave1);
        $this->__setSql($sql);
        $res = $this->consultar($sql, $param);
        $usuario = NULL;
        foreach ($res as $fila) {
            $usuario = new Usuario();
            
            $this->mapearUsuario($usuario, $fila);
        }
        return $usuario;
  
    }
    
}