# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/usuarios.rb

class Usuarios  < Model
    def listar
       begin
          @connection['
              SELECT U.id AS id, U.usuario AS usuario, A.momento AS momento, U.correo AS correo 
              FROM usuarios U INNER JOIN accesos A ON U.id = A.usuario_id 
              GROUP BY U.usuario ORDER BY U.id'].to_a.to_json
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

    def listar_permisos(usuario_id)
       begin
          @connection[
              '''
              SELECT T.id AS id, T.nombre AS nombre, (CASE WHEN (P.existe = 1) THEN 1 ELSE 0 END) AS existe, T.llave AS llave FROM
              (
                  SELECT id, nombre, llave, 0 AS existe FROM permisos
              ) T
              LEFT JOIN
              (
                  SELECT P.id, P.nombre,  P.llave, 1 AS existe  FROM permisos P 
                  INNER JOIN usuarios_permisos UP ON P.id = UP.permiso_id
                  WHERE UP.usuario_id = ?
              ) P
              ON T.id = P.id
              ''', 
              usuario_id].to_a.to_json
       rescue Sequel::DatabaseError => e#ZeroDivisionError#LoadError
          {:tipo_mensaje => 'error', :rpta_mensaje => "Error ocurrido un error en el  código sql", :error => e}.to_json
       end
    end
end