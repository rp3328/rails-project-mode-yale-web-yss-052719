# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

path = File.join(File.dirname(__FILE__), "pokemon.csv")
pokemons = CSV.read(path, headers: true)


pokemons.each do |p|
    pokemon = Pokemon.new
    Pokemon.column_names.each do |stat|
        pokemon[stat] = p[stat]
    end
    pokemon.save
end

