require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(name:, type:, db:, id:nil)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES(?,?);
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
    new_pokemon = Pokemon.new(name:pokemon[1], type:pokemon[2], db:db, id:id)
  end

 # def alter_hp
 # end

end
