=begin
	
	VIII Semana Academica do Centro Tecnologico de Alegrete(SACTA 2016 UNIPAMPA)

	-->	Minicurso: Introdução a Linguagem de Programação Ruby

	Nome: Giulliano Paz

	Linguagem: Ruby
	
	Referências: COOPER, Peter. Beginning Ruby: From Novice To Professional. New York: Apress, 2007.

>> Para executar o Server_Aplication.rb

 $ ruby Server_Aplication.rb [port_SW] [host_SD] [port_SD]

 port_SW: port para o Server_Web.rb se conectar ao SA.
 host_SD: Host para o SA se conectar ao SD.
 port_SD: Port para o SA se conectar ao SD.

=end

require 'socket'

server_web = TCPServer.new ARGV[0]

server_data = TCPSocket.new ARGV[1], ARGV[2]

loop do

	a = Thread.start(server_web.accept) do |server_web| #discapara uma nova Thread a cada novo SW

		mensagem = []

		# laço para receber mensagem do SW
		while line = server_web.gets

			mensagem << line #adiciona mensagens recebidas a lista de mensagens

			break if line =~ /quit/

		end

		server_web.puts "\n    >> Mensagem recebida pelo Servidor de Aplicacao. Enviando mensagem para o Servidor de Dados..."
		server_data.puts mensagem #envia mensagem para SD

		mensagem = []

		#laço para receber mensagens de SD
		while line = server_data.gets

			mensagem << line #adiciona mensagens recebidas a lista de mensagens

			break if line =~ /quit/

		end

		server_web.puts mensagem #envia mensagens recebidas do SD para o SW
		server_web.puts 'quit'

	end

end
