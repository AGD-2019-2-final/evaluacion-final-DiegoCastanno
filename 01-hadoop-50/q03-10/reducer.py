import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    valor = 0

    for line in sys.stdin:
        key, val = line.split("\t")
        #key = int(key.replace("\n",""))
        if curkey is not None:
            sys.stdout.write("{},{}\n".format(valor.replace("\n",""), curkey))
        curkey = key
        valor = val

    sys.stdout.write("{},{}".format(valor.replace("\n",""), curkey))