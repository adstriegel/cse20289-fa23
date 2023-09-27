
for theNumber in range(1,101):
    if theNumber % 3 == 0 and theNumber % 5 == 0:
        print("FizzBuzz")
    elif theNumber % 3 == 0:
        print("Fizz")
    elif theNumber % 5 == 0:
        print("Buzz")
    else:
        print(theNumber)