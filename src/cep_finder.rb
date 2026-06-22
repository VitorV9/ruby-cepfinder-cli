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

  end

end