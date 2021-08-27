def reverseString(text):
  if(len(text)>0):
    print(text[len(text)-1],end="")
    reverseString(text[:len(text)-1])

if __name__=="__main__":
  reverseString("oke")
  print("\n")
  reverseString("crypto")
  print("\n")
  reverseString("kasur")

""" Explaination of the function:
1.check panjang dari kata, jika panjang kata lebih dari 0 maka masuk ke kondisi
2. cetak huruf dari kata terakhir secara horizontal
3. panggil fungsi rekursif dengan parameter kata di kurang dari huruf terakhirnya
4. fungsi akan terus terpanggil ketika panjang kata sama dengan 0
"""