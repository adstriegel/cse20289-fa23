# conditional.py

import random

number = random.randint(0, 10)
if number % 3 == 0:
	print('Fizz')
elif number % 5 == 0:
	print('Buzz')
else:
	print(number)
