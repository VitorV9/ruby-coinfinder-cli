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

#criar objeto e seguri com respostas do usuário