=begin
	
	VIII Semana Academica do Centro Tecnologico de Alegrete(SACTA 2016 UNIPAMPA)

	-->	Minicurso: Introdução a Linguagem de Programação Ruby

	Nome: Giulliano Paz

	Linguagem: Ruby
	
	Referências: COOPER, Peter. Beginning Ruby: From Novice To Professional. New York: Apress, 2007.

>> Para executar o Server_Web.rb

 $ ruby Server_Web.rb [port_Client] [host_SA] [port_SA]

 port_Client: port para o Cliente.rb se conectar ao SW.
 host_SA: Host para o SW se conectar ao SA.
 port_SA: Port para o SW se conectar ao SA.

=end

require 'socket'

client = TCPServer.new ARGV[0]

server_aplication = TCPSocket.new ARGV[1], ARGV[2]

loop do

	a = Thread.start(client.accept) do |client| #a cada novo client, dispara uma nova Thread

		mensagem = []

		# laço para receber mensagem do cliente
		while line = client.gets.chomp

			mensagem << line #adiciona mensagens recebidas a lista de mensagem

			break if line =~ /quit/

		end

		client.puts "\n    >> Mensagem recebida pelo Servido Web. Enviando mensagem para o Servidor de Aplicacao..."
		server_aplication.puts mensagem #envia mensagem para SA

		mensagem = []
		#laço para receber mensagem do SA
		while line = server_aplication.gets.chomp

			mensagem << line #adiciona mensagens recebidas a lista de mensagens

			break if line =~ /quit/

		end

		client.puts mensagem #envia resposta do SA para o Cliente
		client.puts 'quit'

	end

end
