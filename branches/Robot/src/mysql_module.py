# To change this template, choose Tools | Templates
# and open the template in the editor.

__author__="USER"
__date__ ="$Jun 6, 2010 4:10:38 PM$"
import MySQLdb
conn = MySQLdb.connect (host = "localhost",
                             user = "root",
                           passwd = "",
                               db = "test")
cursor = conn.cursor ()
cursor.execute ("SELECT VERSION()")
row = cursor.fetchone ()
print "server version:", row[0]
cursor.close ()
conn.close ()
