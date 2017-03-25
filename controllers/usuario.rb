# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/controllers/usuario.rb

class Usuario < Controller    
    def listar
		@usuarios = load_model('usuarios')
		@usuarios.listar
    end
end