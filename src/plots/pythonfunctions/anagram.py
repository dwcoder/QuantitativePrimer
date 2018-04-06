

def IsAnagram(string1, string2):
    if len(string1) is not len(string2):
        return False
    return sorted(string1) == sorted(string2)

def LetterToNumber(letter):
    return ord(letter)-ord('a')

def IsAnagramNoSort(string1, string2):
    if len(string1) is not len(string2):
        return False

    lettercounts = [0 for i in range(26)]

    for letter in string1:
        lettercounts[LetterToNumber(letter)] += 1
    for letter in string2:
        lettercounts[LetterToNumber(letter)] -= 1

    for count in lettercounts:
        if count != 0:
            return False

    return True




if __name__=='__main__':
    for letter in 'abcdefghijklmnopqxyz':
        print '{} : {}'.format(letter, LetterToNumber(letter))

    s1a = 'asdf'
    s2a = 'fasd'

    s1b = 'asdfasdfasdf'
    s2b = 'asdfasdfasdfasdf'

    assert(IsAnagram(s1a, s2a))
    assert(not(IsAnagram(s1b, s2b)))

    assert(IsAnagramNoSort(s1a, s2a))
    assert(not(IsAnagramNoSort(s1b, s2b)))