import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None

    for line in sys.stdin:
        key, val = line.split("\t")
        val = int(val)
        if key == curkey:
            if val > maxi:
                maxi = val
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\n".format(curkey, maxi))
            curkey = key
            maxi = val

    sys.stdout.write("{}\t{}\n".format(curkey, maxi))