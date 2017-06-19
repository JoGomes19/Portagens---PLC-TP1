#############################
#Para escrever comentários ##
#############################

all : saidas entradas parques total_mes horas_parques horas_estrada mapa

saidas: saidas.awk viaverde.xml
	gawk -f saidas.awk viaverde.xml | sort

entradas: entradas.awk viaverde.xml
	gawk -f entradas.awk viaverde.xml

parques: parques.awk viaverde.xml
	gawk -f parques.awk viaverde.xml

total_mes: total_mes.awk viaverde.xml
	gawk -f total_mes.awk viaverde.xml

horas_parques: horas_parques.awk viaverde.xml
	gawk -f horas_parques.awk viaverde.xml

horas_estrada: horas_estrada.awk viaverde.xml
	gawk -f horas_estrada.awk viaverde.xml

mapa: mapa.awk portagens.awk viaverde.xml
	gawk -f portagens.awk viaverde.xml > trajetos.txt
	gawk -f mapa.awk trajetos.txt


