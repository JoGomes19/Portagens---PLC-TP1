
/<ENTRADA>/	{split ($0,local,"<|>");
			 entrada = local[3];
			 while(local[2] != "SAIDA"){
			 	getline;
			 	split ($0,local,"<|>")
			 }
			 print entrada " --> " local[3] > "trajetos.txt";
			}

END	 {}

