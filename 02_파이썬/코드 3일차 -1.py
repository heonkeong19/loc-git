 
#for문 정삼각형

#c = 1
#a = int (input())
#b = int (a/2 + 1)
#d , i = b, 0

#for i in range (0, b, 1) :
#    for i in range (1, d, 1) :
#        print (" ", end = "")
#    for i in range (0, c, 1) :
#        print ("*", end = "")
#    print ("")
#    c = c+2
#    d = d-1



# 역직각삼각형


#a = int (input ("숫자"))
#b = 0
#c = 1
#d = a
#while b < a :
#    while b < d-1 :
#        print (" ", end = "")
#        d = d-1
#    while b < c :
#        print ("*", end = "")       
#        b = b+1
#    print ("")
#    c = c+1
#    b = 0
#    a = a-1
#    d = a


#직각삼각형

#a = int (input ("숫자"))
#b = 0
#c = 1
#while b < a :
#    while b < c :
#        print ("*", end = "")       
#        b = b+1
#    print ("")
#    c = c+1
#    b = 0
#    a = a-1


#상하 반전 직각삼각형

#a = int (input ("숫자"))
#b = 0
#c = a
#while b < a :
#    while b < c :
#        print ("*", end = "")       
#        b = b+1
#    print ("")
#    a = a-1
#    b = 0
#    c = a






#역 정삼각형

#a = int (input ("숫자"))
#b, d = 0, 0
#c = a
#e = 0
#while b < a :
#    while b < d :
#        print (" ", end = "")
#        b = b+1
#    while e < c :
#        print ("*", end = "")       
#        e = e+1
#    print ("")
#    b = 0
#    a = a-2
#    d = d+1
#    c = a
#    e = 0




#상하 좌우 반전 직각 삼각형

#a = int (input ("숫자"))
#b = 0
#c = a
#d = 0
#e = 0
#while b < a :
#    while b < d :
#        print (" ", end = "")
#        b = b+1
#    while e < c :
#        print ("*", end = "")       
#        c = c-1
#    print ("")
#    b = 0
#    a = a-1
#    d = d+1
#    c = a





#l> 이모양

#a = int (input ("숫자"))
#e = a
#b = 0
#c = 1
#d = a
#f = a-1
#while b < a :
#    while b < c :
#        print ("*", end = "")       
#        b = b+1
#    print ("")
#    c = c+1
#    b = 0
#    a = a-1
#while b < e :
#    while b < f :
#        print ("*", end = "")       
#        b = b+1
#    print ("")
#    e = e-1
#    b = 0
#    f = f-1



#<l 이 모양 


#a = int (input ("숫자"))
#b = 0
#c, g = 1, 1
#d = a
#e = a
#f = a-1
#z = 0

#while b < a :
#    while b < d-1 :
#        print (" ", end = "")
#        d = d-1
#    while b < c :
#        print ("*", end = "")       
#        b = b+1
#    print ("")
#    c = c+1
#    b = 0
#    a = a-1
#    d = a
#while b < e :
#    while b < g :
#        print (" ", end = "")
#        b = b+1
#    while z < f :
#        print ("*", end = "")       
#        z = z+1
#    print ("")
#    b = 0
#    e = e-1
#    g = g+1
#    f = f-1
#    z = 0
    





#정삼각형

#a = int (input("숫자"))
#b, e = 0, 0
#c = a//2 
#d = 1

#while b < a :
#    while b < c :
#        print (" ", end = "")
#        b = b + 1
#    while e < d :
#        print ("*", end = "")
#        e = e + 1
#    print ("")
#    b, e = 0, 0
#    a = a-2
#    c = c-1
#    d = d+2



#마름모


#a = int (input("숫자"))
#b, e = 0, 0
#c = a//2 
#d, y = 1,-1
#f = a
#z = a -2
#x = a

#while b < a :
#    while b < c :
#        print (" ", end = "")
#        b = b + 1
#    while e < d :
#        print ("*", end = "")
#        e = e + 1
#    print ("")
#    b, e = 0, 0
#    a = a-2
#    c = c-1
#    d = d+2
#while b < f :
#    while y < e :
#        print (" ", end = "")
#        y = y+1
#    while b < z :
#        print ("*", end = "")       
#        b = b+1
#    print ("")
#    b = 0
#    f = f-1
#    e = e+1
#    z = z-2
#    y = -1



#모래시계




#a = int (input ("숫자"))
#b, d, e = 0, 0, 0
#c = a
#f = a -1
#x = a//2 -1
#y = 3
#z = a -1
#while b < a :
#    while b < d :
#        print (" ", end = "")
#        b = b+1
#    while e < c :
#        print ("*", end = "")       
#        e = e+1
#    print ("")
#    b = 0
#    a = a-2
#    d = d+1
#    c = a
#    e = 0
#while b < f :
#    while b < x :
#        print (" ", end = "")
#        b = b + 1
#    while e < y :
#        print ("*", end = "")
#        e = e + 1
#    print ("")
#    b, e = 0, 0
#    f = f-2
#    x = x-1
#    y = y+2



# 1- 6


#a = int (input ("숫자"))
#b, d, e = 0, 0, 0
#c = 1
#f = a
#x = a
#while b < a :
#    while b < c :
#        print ("*", end = "")       
#        b = b+1
#    print ("")
#    c = c+1
#    b = 0
#    a = a-1
#while b < x :
#    while b < d :
#        print (" ", end = "")
#        b = b+1
#    while e < f :
#        print ("*", end = "")       
#        f = f-1
#    print ("")
#    b = 0
#    x = x-1
#    d = d+1
#    f = x



#2-6



#a = int (input ("숫자"))
#b = 0
#c = 1
#d = a
#x, y = a, a
#while b < a :
#    while b < d-1 :
#        print (" ", end = "")
#        d = d-1
#    while b < c :
#        print ("*", end = "")       
#        b = b+1
#    print ("")
#    c = c+1
#    b = 0
#    a = a-1
#    d = a
#while b < x :
#    while b < y :
#        print ("*", end = "")       
#        b = b+1
#    print ("")
#    x = x-1
#    b = 0
#    y = x





# 별


#a = int (input("숫자"))
#b, e = 0, 0
#c = a//2 
#d = 1

#while b < a :
#    while b < c :
#        print (" ", end = "")
#        b = b + 1
#    while e < d :
#        print ("*", end = "")
#        e = e + 1
#    print ("")
#    b, e = 0, 0
#    a = a-2
#    c = c-1
#    d = d+2