# ex-map.py : Example of the mapping function

# Example from https://www.tutorialgateway.org/python-map-function/

def addition(a, b):
    return a + b
 
numbers1 = [10, 20, 30, 40, 50]
numbers2 = [150, 250, 350, 450, 550]
 
res = map(addition, numbers1, numbers2)
print(list(res))
 
fruits1 = ['apple', 'orange', 'kiwi']
fruits2 = ['banana', 'cherry', 'berry']
 
result = map(addition, fruits1, fruits2)
print(list(result))

# Additional Output
print('What kind of object comes back from map?')
print(res)
print(result)

# This line breaks in Python 3, works in Python 2
#print(res[0])

# What will happen?
dict1 = { 'Item1' : 10, 'Item2' : 20, 'Item3' : 30, 'Item4' : 40, 'Item5' : 50 }
dict2 = { 'Big1' : 150, 'Big2' : 250, 'Big3' : 350, 'BigFour' : 450, 'B1g5' : 550 }

resD = map(addition, dict1, dict2)
print(list(resD))
