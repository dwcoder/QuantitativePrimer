

def IsAnagram(string1, string2):
    if len(string1) is not len(string2):
        return False
    return sorted(string1) == sorted(string2)

def IsAnagramNoSort(string1, string2):
    if len(string1) is not len(string2):
        return False
    sum = 0

    for letter in string1:
        sum += ord(letter)
    for letter in string2:
        sum -= ord(letter)

    return (sum == 0)




if __name__=='__main__':
    s1a = 'asdf'
    s2a = 'fasd'

    s1b = 'asdfasdfasdf'
    s2b = 'asdfasdfasdfasdf'

    print IsAnagram(s1a, s2a)
    print IsAnagram(s1b, s2b)

    print IsAnagramNoSort(s1a, s2a)
    print IsAnagramNoSort(s1b, s2b)