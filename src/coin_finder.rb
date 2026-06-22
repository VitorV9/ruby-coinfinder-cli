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