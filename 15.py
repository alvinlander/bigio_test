def mirrorTriangle(t):
	# membuat segitiga terbalik sisi atas
	for i in range(t):
		print(i*" " +(t-i)*"* ")
	#membuat segitiga sisi bawah
	for j in range(2,t+1):
		print((t-j)*" " + j*"* ")

if __name__=="__main__":
	mirrorTriangle(5)
	print("\n")
	mirrorTriangle(3)
