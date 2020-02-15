import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    vector =[]
    for line in sys.stdin:
        valor = line.split('\t')[0]
        letra = line.split('\t')[1]
        for i in letra.split(','):
            vector.append((valor,i))
    for line in vector:
        sys.stdout.write("{}\t{}\n".format(line[1].strip(), line[0].strip()))