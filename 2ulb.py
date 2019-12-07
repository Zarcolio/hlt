#!/usr/bin/env python

import sys
import os

if len(sys.argv) == 1:
    print ("")
    print (" Too few arguments:")
    print ("  script2userbin <inputfile>")
    print ("")
    sys.exit(2)
    
scriptname = sys.argv[1]

chmodcmd = "chmod +x " + scriptname
retval1 = os.system(chmodcmd)

scriptpath = os.path.abspath(scriptname)
scriptname = os.path.splitext(scriptname)[0]
      
lncmd = "ln -s " + scriptpath+ " /usr/local/bin/" + scriptname
#print lncmd 

retval2 = os.system(lncmd)
