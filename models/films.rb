require_relative("../db/sql_runner")

class Film
    attr_reader :id
    attr_accessor :title, :price


    def initialize(options)
      @id = options['id'].to_i if options['id']
      @title = options['title']
      @price = options['price'].to_s
    end

    def save()
      sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
      values = [@title, @price]
      film = SqlRunner.run(sql, values).first
      @id = film['id'].to_i
    end

    def update()
      sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3;"
      values = [@title, @price, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE * FROM films WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
    end

#Which customers are coming to see one film

    def customers()
      sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE film_id = $1;"
      values = [@id]
      customer_data = SqlRunner.run(sql, values)
      return customer_data.map{|customer| Customer.new(customer)}
    end


    

    # # How many customers are going to watch a certain film
    # def films_watched()
    #   sql = "SELECT * FROM tickets WHERE film_id = $1;"
    #   values = [@id]
    #   film_data = SqlRunner.run(sql, values)
    #   return film_data.map{|film| Film.new(film)}
    # end


    def self.delete_all()
      sql = "DELETE FROM films;"
      SqlRunner.run(sql)
    end



end
