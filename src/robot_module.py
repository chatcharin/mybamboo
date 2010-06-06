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
    try:
        """Downloads all the images at 'url' to /test/"""
        soup = bs(urlopen(url))
        parsed = list(urlparse.urlparse(url))
        for image in soup.findAll("img"):
            try:
                print "Image: %(src)s" % image
                filename = image["src"].split("/")[-1]
                parsed[2] = image["src"]
                tmp = urlopen(urlparse.urlunparse(parsed))
                meta = tmp.info()
                print urlparse.urlunparse(parsed)
                print meta.getheaders("Content-Length")[0]
                length = int(meta.getheaders("Content-Length")[0])
                size   = 40000
                if (length  > size) :
                           print "start write"
                           outpath = os.path.join(out_folder, filename)
                           urlretrieve(urlparse.urlunparse(parsed), outpath)
                           print "end  write"
                else: findlink(url)
            except:pass
    except: pass

def _usage():
    print "usage: python dumpimages.py http://example.com [outpath]"

def findlink(url):
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
                try:
                    print item[:end]
                    url2 = item[:end]
                    out_folder = "C:/test/"
                    print "========="
                    print url2
                    print url
                    print "========="
                    str1 = url2.split(".")
                    str2 = url.split(".")
                    print str1[1]
                    print str2[1]
                    if not url2.lower().startswith("http"):
                        url2 = url+url2
                        print url2+"  =========="
                        """ out_folder = sys.argv[-1] """
                        """if not url.lower().startswith("http"):
                            _usage()
                            sys.exit(-1) """
                    main(url2, out_folder)
                    """ if not str1[1] == str2[1]:findlink(url2) """
                except:pass

if __name__ == "__main__":
    """url = sys.argv[-1] """
    urlstart="http://www.bigfoto.com/"
    findlink("http://picasaweb.google.co.th/lh/explore")
    findlink("http://www.flickr.com/explore/")