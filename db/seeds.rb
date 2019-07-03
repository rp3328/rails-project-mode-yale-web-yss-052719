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

Type.create(name: "grass")
Type.create(name: "poison")
Type.create(name: "fire")
Type.create(name: "flying")
Type.create(name: "water")
Type.create(name: "bug")
Type.create(name: "normal")
Type.create(name: "dark")
Type.create(name: "electric")
Type.create(name: "ground")
Type.create(name: "ice")
Type.create(name: "fairy")
Type.create(name: "fighting")
Type.create(name: "psychic")
Type.create(name: "rock")
Type.create(name: "steel")
Type.create(name: "ghost")
Type.create(name: "dragon")

Pokemon.all.each do |poke|
    Type.all.each do |type|
        if type.name == poke.type1
            PokemonType.create(pokemon_id: poke.id, type_id: type.id)
        elsif type.name == poke.type2
            PokemonType.create(pokemon_id: poke.id, type_id: type.id)
        end
    end
end