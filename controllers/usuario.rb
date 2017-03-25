# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/controllers/usuario.rb

class Usuario < Controller
    def initialize
        @usuarios = load_model('usuarios')
    end
    
    def listar
        @usuarios.listar
    end
end