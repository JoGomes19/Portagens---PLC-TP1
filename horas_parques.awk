
/<HORA_ENTRADA>/{	
					split ($0,aux,"<|>");
			 		split(aux[3],hora1,":")
			 		while(aux[2] != "HORA_SAIDA"){ # para chegar a linha certa
			 			getline;
			 			split ($0,aux,"<|>")
			 		}
			 		split(aux[3],hora2,":")
			 		#print "Entrada "hora1[1]","hora1[2]
			 		#print "Saida "hora2[1]","hora2[2]
			 		hora1[1] = hora1[1]*60
			 		hora2[1] = hora2[1]*60
			 		while(aux[2] != "TIPO"){
			 			getline;
			 			split ($0,aux,"<|>")
			 		}
			 		if (aux[3] == "Parques de estacionamento"){
			 			dif = (hora2[1]+hora2[2])-(hora1[1]+hora1[2])
			 			total+=dif
			 		}
				}

END	{
	 print "Passou "int(total/60) " horas e " total%60 " minunos em parques de estacionamento";
	}