require 'uri' # Transforma a string do link em um objeto de rota (endereço oficial) que o Net::HTTP aceita
require 'json' # Converte o texto bruto da API em uma Hash (dicionário) para podermos ler o preço da moeda
require 'net/http' #Faz a viagem até a internet para buscar o texto bruto com as cotações da API

class CoinFinder
  def initialize(moeda,valor)
    @moeda = moeda
    @valor = valor
  end

  def conversor
    url_string = "https://economia.awesomeapi.com.br/json/last/#{@moeda.upcase}-BRL"
    uri = URI(url_string)
    response = Net::HTTP.get(uri)

    dadosbrutos_api = JSON.parse(response)

    chave_mae = "#{@moeda.upcase}BRL"
    
    if dadosbrutos_api[chave_mae].nil?
    return "moeda_invalida" 
    else
    preco_texto = dadosbrutos_api[chave_mae]["bid"]
    preco_texto = preco_texto.to_f
    resultado = (@valor / preco_texto).round (2)
    end
  end
end