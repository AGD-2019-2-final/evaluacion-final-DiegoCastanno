import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    vector=[]
    for line in sys.stdin:
        letra, fecha, valor = line.split("\t")
        valor = int(valor)

        vector.append((letra,fecha,valor))

    vector.sort(key=lambda orden: (orden[2]))
    contador = 1
    limite = 7
    for line in vector:
        if contador < limite:
            sys.stdout.write("{}   {}   {}\n".format(line[0],line[1].strip(),line[2]))
            contador += 1


 