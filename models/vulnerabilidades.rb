# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/vulnerabilidades.rb

class Vulnerabilidades  < Model
	def listar
		stringify(@connection.query('SELECT * FROM vulnerabilidades'))
	end

    def crear(codigo, descripcion)
    		stmt = @connection.prepare('INSERT INTO vulnerabilidades (codigo, descripcion) VALUES (?,?)')
    		stmt.execute(codigo, descripcion)
    		@connection.last_id
    end

    def editar(id, codigo, descripcion)
    		stmt = @connection.prepare('UPDATE vulnerabilidades SET codigo = ?, descripcion = ? WHERE id = ?')
    		stmt.execute(codigo, descripcion, id)
    end

    def eliminar(id)
    		stmt = @connection.prepare('DELETE FROM vulnerabilidades WHERE id = ?')
    		stmt.execute(id)
    end
end