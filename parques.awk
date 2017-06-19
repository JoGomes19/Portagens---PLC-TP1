#BEGIN {IGNORECASE=1; conta=0; FS= "<|>"}   


/<DATA_SAIDA>/ {split ($0,data,"<|>");
				split(data[3],mes,"-");#mes[2] = mes
				#print "Soma  => " datas[mes[2]]
				while(data[2]!= "IMPORTANCIA"){
					getline; # proxima linha
					split ($0,data,"<|>");
				}
				split($0, valor,"<|>");
				sub(",",".",valor[3]);
				#print valor[3];
				while(data[2] != "TIPO"){
					getline;
					split ($0,data,"<|>");
				}
				#print data[3]
				if(data[3] == "Parques de estacionamento"){
					datas[mes[2]]+=valor[3];
					total+=valor[3];
				}
				}

END	 {for (d in datas){print "Gasto do mês "d " => " datas[d]};
	  print "Total gasto em parques: " total;
	 }

