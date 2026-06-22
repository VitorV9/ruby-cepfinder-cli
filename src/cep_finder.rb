require 'uri'
require 'net/http'
require 'json'

class CepFinder
  def initialize(cep)
    @cep = cep
  end

  def buscaendereco
    url_string = "https://viacep.com.br/ws/#{@cep}/json/"
    uri = URI(url_string)
    response = Net::HTTP.get(uri)
    dados_da_api = JSON.parse(response)

    @logradouro = dados_da_api["logradouro"]
    @bairro = dados_da_api["bairro"]
    @localidade = dados_da_api["localidade"]
    @uf = dados_da_api["uf"]
    
    "Endereço: #{@logradouro}, #{@bairro} - #{@localidade}/#{@uf}"
  end

  def salvaendereco
    current_time = Time.now.strftime("%d-%m-%y_%H-%M")
    filename = "#{current_time}.txt"

    File.open(filename, 'w') do |file|
      file.puts "--Localização com base no CEP---"
      file.puts "O logradouro é: #{@logradouro}"
      file.puts "O bairro é: #{@bairro}"
      file.puts "A localidade é: #{@localidade}"
      file.puts "A uf(estado) é: #{@uf}"
    end
  end
end