require_relative "cep_finder.rb"

puts "====Localizador de CEP===="
puts ""

print "Digite o seu CEP (apenas números): "
cep_digitado = gets.chomp

buscador = CepFinder.new(cep_digitado)

puts "\nBuscando informações..."

resultado = buscador.buscaendereco

puts ""
puts resultado

buscador.salvaendereco