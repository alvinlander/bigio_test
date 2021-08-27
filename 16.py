def patternH(max):
  tempS = "" #menampung string sementara
  #loop untuk membuat pola sisi atas
  for i in range(1,max):
    tempS+= str(i)
    print(tempS + (2*(max-i)-1) * " " + tempS[::-1])
  #menampilkan sisi tengah tanpa spasi
  print(tempS + str(max) + tempS[::-1])
  #loop untuk membuat pola sisi bawah
  for i in range(1,max):
    print(tempS[:max-i] + ((2*i)-i) * " " + (i-1)*" "+tempS[-i::-1])

if __name__=="__main__":
  patternH(7)
  print("\n")
  patternH(5)
