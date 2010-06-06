# To change this template, choose Tools | Templates
# and open the template in the editor.

__author__="USER"
__date__ ="$Jun 5, 2010 7:56:42 PM$"

from BeautifulSoup import BeautifulSoup as bs
import urlparse
from urllib2 import urlopen
from urllib import urlretrieve
import os
import sys

def main(url, out_folder="C:/test/"):
    """Downloads all the images at 'url' to /test/"""
    soup = bs(urlopen(url))
    parsed = list(urlparse.urlparse(url))

    for image in soup.findAll("img"):
        try:
            print "Image: %(src)s" % image
            filename = image["src"].split("/")[-1]
            parsed[2] = image["src"]
            outpath = os.path.join(out_folder, filename)
            urlretrieve(urlparse.urlunparse(parsed), outpath)
        except: pass


def _usage():
    print "usage: python dumpimages.py http://example.com [outpath]"

if __name__ == "__main__":
    """url = sys.argv[-1] """
    url="http://www.teenee.com"
    page=urlopen(url)
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
                url2 = item[:end]
                out_folder = "C:/test/"
                if not url.lower().startswith("http"):
                    out_folder = sys.argv[-1]
                    url = sys.argv[-2]
                    if not url.lower().startswith("http"):
                        _usage()
                        sys.exit(-1)
                main(url2, out_folder)
