# ex-lambda.py

# From https://www.w3schools.com/python/python_lambda.asp
x = lambda a : a + 10
print(x(5))
print(x(-30))
print(x(3.14))

# Extra output
print()
print(x)

# Would this work?
try: 
    theL = [ 5, 15, 30 ]
    print(x(theL))
except:
    print('Nope!')

# What about as a map?
try:
    theL = [ 5, 15, 30 ]
    mapL = map(x, theL)
    print(list(mapL))
except:
    print('Nope, nope!')

