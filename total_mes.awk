#BEGIN {IGNORECASE=1; conta=0; FS= "<|>"}   

#/<DATA_ENTRADA>/ {print $0}  # /? -> pode ou nao ter o "/"

/<DATA_SAIDA>/ {split ($0,data,"<|>");
				split(data[3],mes,"-");#mes[2] = mes
				#print "Soma  => " datas[mes[2]]
				while(data[2]!= "IMPORTANCIA"){
					getline; # proxima linha
					split ($0,data,"<|>");
				}
				split($0, valor,"<|>");
				sub(",",".",valor[3]);#para substituir a virgula pelo ponto
				#print "Valor => " valor[3];
				#print "Mes => " mes[2];
				datas[mes[2]]+=valor[3];
				total+=valor[3];
				}

END	 {for (d in datas){print "Gasto do mês "d " => " datas[d]};
		print "Total gasto: " total;
	}

