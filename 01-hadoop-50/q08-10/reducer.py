import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    total = 0
    cuenta = 1

    for line in sys.stdin:
        key, val = line.split("\t")
        val = float(val)

        if key == curkey:
            total = total + val
            cuenta += 1
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, total , total/cuenta))
                cuenta = 1

            curkey = key
            total = val
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, total , total/cuenta))