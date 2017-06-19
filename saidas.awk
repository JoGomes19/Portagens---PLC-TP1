

/<SAIDA>/ {split ($0,saida,"<|>"); saidas[saida[3]]++}

END {for (s in saidas){print s}}

