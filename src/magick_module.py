# To change this template, choose Tools | Templates
# and open the template in the editor.

__author__="USER"
__date__ ="$Jun 6, 2010 5:04:36 PM$"
import os
from PythonMagickWand.image import Image
if __name__ == "__main__":
    print "Hello World"
i = Image('foo.jpg')
i.flip()
i.save('flip.png')