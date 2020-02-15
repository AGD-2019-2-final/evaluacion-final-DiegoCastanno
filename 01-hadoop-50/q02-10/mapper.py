import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        col = line.split(',')[3]
        var = line.split(',')[4]
        sys.stdout.write("{}\t{}\n".format(col,var))
