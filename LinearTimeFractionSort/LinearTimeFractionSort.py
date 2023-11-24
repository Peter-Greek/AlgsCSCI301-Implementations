import math 
# Radix Sort Taken From https://www.geeksforgeeks.org/radix-sort/
def countingSort(arr, exp1):
    n = len(arr)
    output = [0] * (n)
    count = [0] * (10)
 
    for i in range(0, n):
        index = arr[i] // exp1
        count[index % 10] += 1
 
    for i in range(1, 10):
        count[i] += count[i - 1]
 
    i = n - 1
    while i >= 0:
        index = arr[i] // exp1
        output[count[index % 10] - 1] = arr[i]
        count[index % 10] -= 1
        i -= 1
 
    i = 0
    for i in range(0, len(arr)):
        arr[i] = output[i]
  
def radixSort(arr):
    max1 = max(arr)
    exp = 1
    while max1 / exp >= 1:
        countingSort(arr, exp)
        exp *= 10
 


find = {}
arr = [(11, 2), (69,198), (66,323)]
big = 0
bigI = 0
for i in range(len(arr)):
    mod = math.modf(arr[i][0] / arr[i][1])
    if len(str(mod[0])) > big:
        big = len(str(mod[0])) 
        bigI = i
big = big - 2 # remove 0.
for i in range(len(arr)):
    val = int((arr[i][0] / arr[i][1]) * (math.pow(10, big)))
    find[arr[i][0] / arr[i][1]] = arr[i]
    arr[i] = val


radixSort(arr)
 
for i in range(len(arr)):
    arr[i] = find[arr[i] / (math.pow(10, big))]
    print(arr[i], end=" ")