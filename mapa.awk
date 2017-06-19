BEGIN {link = "https://www.google.pt/maps/dir";
	   l=0;
	  }
	NR > 0 {
		split($0,trajeto," --> ");
		origem  = "/" trajeto[1];
		destino = "/" trajeto[2];
		mapa = link origem destino
		l++;
		print "\""mapa"\"" > "links.txt";
	}
END {
	l++;
	print "Qual o seu sistema operativo ?(1 - Linux / 2 - Mac OSX)\n";
	getline so < "/dev/tty"; # para ler mesmo do teclado
	print "Pretende visualizar algum dos seus percursos ?(S/N)\n";
	getline x < "/dev/tty"; # para ler mesmo do teclado

	if (x == "S"){
		print "Esta é a lista de percursos que fez:\n";
		i = 1;
		while(i <= l){
			getline t < "trajetos.txt";
			print i " --> " t;
			i++;
		}
	print "Insira os trajetos que pretende ver? (0 para cancelar) "
	mp=1		
 	while (mp!=0){
		getline mp < "/dev/tty" 
		if (mp==0) exit 1
		else
			if (so==1) system("awk 'NR==" mp "'"  " links.txt | xargs google-chrome"); # xargs poe os argumentos a frente do open
			if (so==2) system("awk 'NR==" mp "'"  " links.txt | xargs open"); # xargs poe os argumentos a frente do open
		}

	}
	}






