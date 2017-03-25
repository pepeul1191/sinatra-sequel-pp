# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/riesgos.rb

class Riesgos  < Model
    def listar
        stringify(@connection.query('SELECT id, codigo, descripcion, 0 AS existe FROM riesgos'))
    end

    def crear(codigo, descripcion)
            stmt = @connection.prepare('INSERT INTO riesgos (codigo, descripcion) VALUES (?,?)')
            stmt.execute(codigo, descripcion)
            @connection.last_id
    end

    def editar(id, codigo, descripcion)
            stmt = @connection.prepare('UPDATE riesgos SET codigo = ?, descripcion = ? WHERE id = ?')
            stmt.execute(codigo, descripcion, id)
    end

    def eliminar(id)
            stmt = @connection.prepare('DELETE FROM riesgos WHERE id = ?')
            stmt.execute(id)
    end
end