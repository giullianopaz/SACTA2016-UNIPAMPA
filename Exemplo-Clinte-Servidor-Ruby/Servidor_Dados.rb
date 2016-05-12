=begin
	
	VIII Semana Academica do Centro Tecnologico de Alegrete(SACTA 2016 UNIPAMPA)

	-->	Minicurso: Introdução a Linguagem de Programação Ruby

	Nome: Giulliano Paz

	Linguagem: Ruby
	
	Referências: COOPER, Peter. Beginning Ruby: From Novice To Professional. New York: Apress, 2007.

>> Para executar o Server_Dados.rb

 $ ruby Server_Dados.rb [port_SA]

 port_SA: Port para o SA se conectar ao SD.

=end

require 'socket'

server_aplication = TCPServer.new ARGV[0]

def send(server, line_to_send)#funcao para envio de mensagens

	line_to_send.each do |line| ##laco para percorrer cada elemento da lista de envio

		server.puts(line)

	end

end


loop do

	a = Thread.start(server_aplication.accept) do |server_aplication| #dispara nova Thread a cada novo SA

		mensagem = []

		while line = server_aplication.gets.chomp #recebendo mensagens do SA

			break if line =~ /quit/

			puts line

			mensagem << line #adicionando mensagens na lista de mensagens

		end

		server_aplication.puts "\n    >> Mensagem recebida pelo Servidor de Dados. Processando requisicoes..."

		if mensagem.slice(0) == 'w' # se o primeiro elemento da lista eh 'w'...

			mensagem.slice!(0)#exclui elemento da posicao 0
			arq = File.new(mensagem.slice!(0), 'w+') #cria um arquivo
			arq.puts mensagem #escreve no arquivo a mensagem
			server_aplication.puts "\n    >> Arquivo salvo com sucesso no servidor de dados!\n"
			server_aplication.puts 'quit'

			puts mensagem


		elsif mensagem.slice!(0) #se a for 'r'

			server_aplication.puts "\n    >> Buscando arquivo..."

			if File.exists?(mensagem.slice(0)) #verifica se existe um arquivo com o nome buscado

				server_aplication.puts "\n\n    >> Arquivo encontrado.\n"
				server_aplication.puts "\n    >> Enviando arquivo...\n\n"

				arq = File.readlines(mensagem.slice!(0))#le arquivo
				puts arq
				send(server_aplication, arq) #envia arquivo para o SA
				server_aplication.puts 'quit'

			else #se não exister arquivo...

				server_aplication.puts "\n\n ERRO! ARQUIVO NAO ECONTRADO.\n\n"
				server_aplication.puts 'quit'
				server_aplication.close

			end

		else

			server_aplication.puts "\n\nOPERACAO REQUISITADA INVALIDA OU INEXISTENTE."
			
		end

	end

end
