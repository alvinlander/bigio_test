def reverseString(maxLenString):
  #array menampung character
  tempChar = []
  #memasukan karakter sampai panjang yang diinginkan
  while len(tempChar) < maxLenString:
    character = input("Masukkan Huruf : ")
    tempChar.append(character) 
  #menampilkan kata dan terbaliknya
  print("".join(tempChar) + "".join(tempChar[maxLenString-2::-1])) 


if __name__ == "__main__":
  maxLenString = int(input("Masukkan panjang kata : "))
  reverseString(maxLenString)

 