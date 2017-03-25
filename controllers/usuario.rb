# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/controllers/usuario.rb

class Usuario < Controller    
    def listar
		usuarios = load_model('usuarios')
		usuarios.listar
    end

    def validar    	
    	usuario = @params['usuario']
    	contrasenia = @params['contrasenia']
    	usuarios = load_model('usuarios')
    	usuarios.validar(usuario, contrasenia).to_s
    end

    def listar_usuarios
    	usuarios = load_model('usuarios')
    	usuarios.listar_usuarios
    end

    def listar_permisos(usuario_id)
    	usuarios = load_model('usuarios')
    	usuarios.listar_permisos(usuario_id)
    end
end