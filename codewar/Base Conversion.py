def convert(input, source, target):
    s = {}
    t = {}
    for i in range(0,len(source)):
        s[source[i]] = i
    for i in range(0,len(target)):
        t[target[i]] = i
        
    
    s0 = len(source)
    dec = 0
    r = []
    result = ""
    for i in str(input):
        i0 = s[i]
        dec = dec * s0 + i0
        
    s1 = len(target)
    
    while dec >= s1:
        r.append(dec%s1)
        dec = int(dec/s1)
    r.append(dec)
    r.reverse()

            
    for j in r:
        for k, v in t.items():
            if j == v:
                result += str(k)
    return result