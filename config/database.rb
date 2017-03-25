# config/database.rb
require 'sequel'

class Database
	def initialize
		#@connection = Mysql2::Client.new(:host => 'localhost', :username => 'root', :password => '123', :database => 'db_seguridad')
		@connection = Sequel.connect(:adapter=>'sqlite', :database=>File.expand_path('../../db/db_accesos.db', __FILE__))
	end

	def connection
		@connection
	end
end

#Fuente : http://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html