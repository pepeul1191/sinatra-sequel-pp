# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/usuarios.rb

class Usuarios  < Model
    def listar
       begin
          @connection[:usuarios].to_a.to_json
       rescue Sequel::DatabaseError => e#ZeroDivisionError#LoadError
          {:tipo_mensaje => 'error', :rpta_mensaje => "Error ocurrido un error en el  código sql", :error => e}.to_json
       end
    end

    def validar(usuario, contrasenia)
       begin
          @connection[:usuarios].where(:usuario => usuario, :contrasenia => contrasenia).count
       rescue Sequel::DatabaseError => e#ZeroDivisionError#LoadError
          {:tipo_mensaje => 'error', :rpta_mensaje => "Error ocurrido un error en el  código sql", :error => e}.to_json
       end
    end
    
    def listar_usuarios
       begin
          @connection[:usuarios].select(:usuario).to_a.to_json
       rescue Sequel::DatabaseError => e#ZeroDivisionError#LoadError
          {:tipo_mensaje => 'error', :rpta_mensaje => "Error ocurrido un error en el  código sql", :error => e}.to_json
       end
    end
end