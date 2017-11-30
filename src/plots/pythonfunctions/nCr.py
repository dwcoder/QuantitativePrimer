

def factorial(n):
    if n==0:
        return 1
    return(n * factorial(n-1) )



def nCr(n,k):
    return factorial(n)/(factorial(k) * factorial(n-k))



#The product function will also work for 0!
def product(number_list):
    prod = 1
    for number in number_list:
        prod = prod*number

    return prod

def nCr_norecur(n,k):
    nominator = product(list(range(k+1,n+1)))
    denominator = product(range(1,n-k+1))

    return nominator/denominator


if __name__=='__main__':

    print 'factorial(3) = ', factorial(3)
    print 'factorial(5) = ', factorial(5)

    print 'nCr(4,2) = ', nCr(4,2)

    print 'nCr(5,2) = ', nCr(5,2)

    print 'nCr(5,0) = ', nCr(5,0)


    print 'nCr_norecur(4,2) = ', nCr_norecur(4,2)

    print 'nCr_norecur(5,2) = ', nCr_norecur(5,2)

    print 'nCr_norecur(5,0) = ', nCr_norecur(5,0)