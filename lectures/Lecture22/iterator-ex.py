
x = range(1,10)

print(x)

try:
    print(x[1])
except:
    print('Nope - negative on x[0]')

theX = iter(x)

print(theX)

try:
    print(theX[1])
except:
    print('Nope - negative on theIter[0]')

print(next(theX))

print(next(theX))
