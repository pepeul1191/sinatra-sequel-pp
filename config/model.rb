# config/model.rb

require_relative 'database'

class Model
	def initialize
		db = Database.new
		@connection = db.connection
		@last_id = nil
	end

	def  stringify(rpta_query)
		array_json = Array.new 
		begin
			#cuando hay algo en el select
			x = 0 
			rpta_query.each do |row|
			  	#array_json << JSON[row]
			  	#array_json.to_json
			  	array_json << JSON[row]
			end 
			array_json
		rescue ZeroDivisionError => e#ZeroDivisionError#LoadError
			#set_last_id(@connection.last_id)
		end
	end
end