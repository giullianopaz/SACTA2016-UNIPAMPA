=begin
	
	VIII Semana Academica do Centro Tecnologico de Alegrete(SACTA 2016 UNIPAMPA)

	-->	Minicurso: Introdução a Linguagem de Programação Ruby

	Nome: Giulliano Paz

	Linguagem: Ruby
	
	Referências: COOPER, Peter. Beginning Ruby: From Novice To Professional. New York: Apress, 2007.

=end


class Arquivo

	private #Métodos privados -------------------

	def initialize nome_arquivo #método de inicialização

		@nome_arquivo = nome_arquivo

	end

	public #Métodos publicos ----------------------

	def mostrar_arquivo #Método para ler e mostrar arquivo

		return File.read(@nome_arquivo)

	end

	def escreve_arquivo mensagem #Métod para escrever ou sobrescrever em um arquivo

		arq = File.write(@nome_arquivo, mensagem + "\n")

	end

	def escreve_final_arquivo mensagem #Método para escrever no final de um arquivo

		arq = File.new(@nome_arquivo, "a")
		arq.write mensagem + "\n"

	end
end