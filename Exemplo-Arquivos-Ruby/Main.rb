=begin
	
	VIII Semana Academica do Centro Tecnologico de Alegrete(SACTA 2016 UNIPAMPA)

	-->	Minicurso: Introdução a Linguagem de Programação Ruby

	Nome: Giulliano Paz

	Linguagem: Ruby
	
	Referências: COOPER, Peter. Beginning Ruby: From Novice To Professional. New York: Apress, 2007.

=end

require_relative "Arquivo"


op = "a" if ARGV.include?("-a")
op = "r" if ARGV.include?("-r")
op = "w" if ARGV.include?("-w")

file = ARGV[ARGV.index("-f") + 1] if ARGV.include?('-f')
file ||= "arquivo.txt"

ARGV.clear

arq = Arquivo.new file

if op == "a"

	puts "O que deseja gravar no final do arquivo?"
	mensagem = gets.chomp
	arq.escreve_final_arquivo mensagem

	puts "\n\nDados gravados com sucesso!\n\n"

elsif op == "w"
	
	puts "O que deseja gravar no arquivo?"
	mensagem = gets.chomp
	arq.escreve_arquivo mensagem

	puts "\n\nDados gravados com sucesso!\n\n"

elsif op == "r"

	puts arq.mostrar_arquivo

else

	puts "Opção inválida sobre arquivos!!"

end