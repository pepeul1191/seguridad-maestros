# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/amenazas.rb

class Amenazas  < Model
	def listar
		stringify(@connection.query('SELECT * FROM amenazas'))
	end

    def crear(codigo, descripcion)
    		stmt = @connection.prepare('INSERT INTO amenazas (codigo, descripcion) VALUES (?,?)')
    		stmt.execute(codigo, descripcion)
    		@connection.last_id
    end

    def editar(id, codigo, descripcion)
    		stmt = @connection.prepare('UPDATE amenazas SET codigo = ?, descripcion = ? WHERE id = ?')
    		stmt.execute(codigo, descripcion, id)
    end

    def eliminar(id)
    		stmt = @connection.prepare('DELETE FROM amenazas WHERE id = ?')
    		stmt.execute(id)
    end
end