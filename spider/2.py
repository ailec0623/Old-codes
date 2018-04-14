import urllib.request
import urllib.parse
import http.cookiejar

url = "https://coes-stud.must.edu.mo/coes/login.do"
info = "https://coes-stud.must.edu.mo/coes/StudentInfo.do"
logout = "https://coes-stud.must.edu.mo/coes/logout.do"
postdata = urllib.parse.urlencode({"userid":"1509853V-I011-0026",
                                   "password":"25391839"}).encode('utf-8')
head1=('User-Agent','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0')

cj = http.cookiejar.CookieJar()
opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))
opener.addheaders = [head1]
urllib.request.install_opener(opener)

req = urllib.request.Request(url,postdata)
urllib.request.urlopen(req).read()

req = urllib.request.Request(info,postdata)
data = urllib.request.urlopen(req).read()

req = urllib.request.Request(logout,postdata)
urllib.request.urlopen(req).read()

f = open("E:/1.html","wb")
f.write(data)
f.close()