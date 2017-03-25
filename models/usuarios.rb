# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/usuarios.rb

class Usuarios  < Model
    def listar
        rs = @connection[:usuarios].to_a
        stringify(rs)
    end
end