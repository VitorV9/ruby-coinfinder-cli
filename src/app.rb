puts ""
puts "====CONVERSOR DE MOEDA CLI===="
puts ""

puts "--Através desse conversor, você pode informar um valor em real que deseja converter em outra moeda--"
puts ""

print "Informe o valor: "
valorReal = gets.chomp.to_f

puts ""

print "Informe para qual moeda deseja converter(ex: USD para Dólar, EUR para Euro, BTC para Bitcoin): "
moedaEscolhida = gets.chomp