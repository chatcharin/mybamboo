# To change this template, choose Tools | Templates
# and open the template in the editor.

__author__="USER"
__date__ ="$Jun 5, 2010 7:31:53 PM$"

import urllib2
url="http://www.teenee.com"
page=urllib2.urlopen(url)
data=page.read().split("</a>")
tag="<a href=\""
endtag="\">"
for item in data:
    if "<a href" in item:
        try:
            ind = item.index(tag)
            item= item[ind+len(tag):]
            end=item.index(endtag)
        except: pass
        else:
            print item[:end]
