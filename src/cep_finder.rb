class CepFinder
  def initialize(cep)
    @cep = cep
  end

  def buscaendereco
    @logradouro = "Rua dos Bobos"
    @bairro = "Centro"
    @localidade = "Ijuí"
    @uf = "RS"
    "Endereço: #{@logradouro}, #{@bairro} - #{@localidade}/#{@uf}"

  end

  def salvaendereco

  end

end