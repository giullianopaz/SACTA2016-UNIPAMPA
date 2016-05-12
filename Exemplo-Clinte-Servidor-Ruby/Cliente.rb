=begin
	
	VIII Semana Academica do Centro Tecnologico de Alegrete(SACTA 2016 UNIPAMPA)

	-->	Minicurso: Introdução a Linguagem de Programação Ruby

	Nome: Giulliano Paz

	Linguagem: Ruby
	
	Referências: COOPER, Peter. Beginning Ruby: From Novice To Professional. New York: Apress, 2007.

 >> Para executar o Cliente.rb

  $ ruby Cliente.rb [host_SW] [port_SW] [r/w] [nome_arquivo]

	host_SW: Host para se conectar ao servidor Web.
  port_SW: Port para se conectar ao servidor Web.
	r/w: 'r' para ler um arquivo do servidor de dados e 'w' para enviar um arquivo ao servidor de dados.
	nome_arquivo: nome do arquivo a ser buscado ou enviado.

=end
require 'socket'

server = TCPSocket.new ARGV[0], ARGV[1]

line_to_send = []

def send(server, line_to_send)#funcao para envio de mensagens

	line_to_send.each do |line| ##laco para percorrer cada elemento da lista de envio

		server.puts(line)

	end

end

if ARGV[2] == 'w' #se ARGV[2] for 'w', envia ['w', nome_do_arquivo_a_ser_enviado, Conteudo_arquivo, quit]

	line_to_send = ['w', ARGV[3], File.read(ARGV[3]), "quit"]

elsif ARGV[2] == 'r' #se ARGV[2] for 'r', envia ['r', nome_do_arquivo_a_ser_buscado, quit]

	line_to_send = ['r', ARGV[3], "quit"]

else

	puts "\n\nOPERACAO REQUISITADA INVALIDA OU INEXISTENTE.\n"

end

send(server, line_to_send) #chama funcao de envio de mensagens

while line = server.gets #laco para receber mensagens do SW

	break if line =~ /quit/

	puts line #mostra mensgens recebidas do SW

end
