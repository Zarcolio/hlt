#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os

if len(sys.argv) == 1:
    print ("\n")
    print ("Too few arguments:")
    print ("2ulb.py <inputfile> [-f]")
    print ("\n")
    sys.exit(2)

if len(sys.argv) == 3:
    sForce = sys.argv[2]
else:
    sForce = ""

scriptname = sys.argv[1]
scriptfullpath = os.path.abspath(scriptname)

chmodcmd = "chmod +x " + scriptfullpath
retval1 = os.system(chmodcmd)

scriptfilename = os.path.split(scriptfullpath)[1]
scriptname = os.path.splitext(scriptfilename)[0]

lncmd = "ln " + sForce + " -s " + "\"" + scriptfullpath + "\"" + " \"/usr/local/bin/" + scriptname + "\"" 
retval2 = os.system(lncmd)
