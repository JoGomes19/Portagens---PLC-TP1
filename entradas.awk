#BEGIN {IGNORECASE=1; conta=0; FS= "<|>"}   

#/<DATA_ENTRADA>/ {print $0}  # /? -> pode ou nao ter o "/"


/<DATA_ENTRADA>/	{split ($0,data,"<|>");contas[data[3]]++; }

END	 { for (dia in contas) {n+=contas[dia];
	   print dia " => " contas[dia]};
	   print "Total: " n 
	 }

