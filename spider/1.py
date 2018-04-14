import urllib.request
import re
import urllib.error
import time
def getcontent(url,page):
    #header
    head1 = ('User-Agent','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0')
    opener = urllib.request.build_opener()
    opener.addheaders = [head1]


    #install opener
    urllib.request.install_opener(opener)
    try:
        data = urllib.request.urlopen(url).read().decode("utf-8")
    except urllib.error.HTTPError as e:
        print(e.code)
        print(e.reason)
    except urllib.error.URLError as e:
        print(e.reason)
    #re of User
    userpat = '<h2>(.*?)</h2>'

    #re of content
    contentpat='<span>(.*?)</span>'

    #seach users
    userlist = re.compile(userpat, re.S).findall(data)

    #seach content
    contentlist = re.compile(contentpat,re.S).findall(data)

    x=1
    for content in contentlist:
        content = content.replace("<br/>","\n")
        name = "content"+str(x)
        exec(name+'=content')
        x+=1
    
    y=1
    for user in userlist:
        name = 'content'+str(y)
        print("user "+str(page)+str(y)+'is: '+user)
        print("content is: ")
        exec("print("+name+")")
        print("\n")
        y+=1
    
for i in range(1,30):
    url = "https://www.qiushibaike.com/8hr/page/" + str(i)
    time.sleep(1)
    getcontent(url,i)