require_relative "coin_finder.rb"
require_relative "file_saver.rb"

puts ""
puts "====CONVERSOR DE MOEDA CLI===="
puts ""

puts "--Através desse conversor, você pode informar um valor em real que deseja converter em outra moeda--"
puts ""

print "Informe o valor: "
valorReal = gets.chomp.to_f

while valorReal <= 0
    print "Erro, informe um valor maior que zero (ex: 0.01): "
    valorReal = gets.chomp.to_f
end

puts ""

print "Informe para qual moeda deseja converter(ex: USD para Dólar, EUR para Euro, BTC para Bitcoin): "
moedaEscolhida = gets.chomp

motor = CoinFinder.new(moedaEscolhida, valorReal)
resultado = motor.conversor

if resultado == "moeda_invalida"
  puts "Erro! Essa moeda não existe."
else
  puts ""
  puts "O valor convertido é: #{resultado}"

  nova_conversao = {
    moeda: moedaEscolhida.upcase,
    valor_original: valorReal,
    resultado_convertido: resultado,
    data: Time.now.strftime("%Y-%m-%d %H:%M:%S")
  }
  salvador = FileSaver.new("src/historico.json")
  salvador.salvar(nova_conversao)
  
  puts ""
  puts "===Arquivo de resultado gerado com sucesso!!==="
  puts ""
end