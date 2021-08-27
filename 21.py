def encChiper(text,key):
  #membuat dictionary alphabet
  alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  #menyimpan hasil string encrypt
  res = ""
  #proses loop per character
  for i in range(len(text)):
    #mencari index keberapa dalam kamus alphabet
    check = alphabet.find(text[i])
    #kondisi jika alphabet ditemukan atau tidak
    if (check != -1):
      #maka character akan bergeser sesuai key yang diberikan oleh parameter
      encrypt = alphabet.index(text[i]) + key
      #menggabungkan tiap character yang telah digeser
      res += alphabet[encrypt]
    else:
      #jika tidak ada dalam kamus alphabet maka akan memasukan kata yang sama
      res += text[i]
  #membuat menjadi lower case
  print(res.lower())

if  __name__=="__main__":
  encChiper("hello worldz",3)
  encChiper("chiper encrypt",2)