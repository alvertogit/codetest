#!/usr/bin/env python

'''
function.py: It contents translate functions solutions to Exercise 1.
'''

__author__      = "alvertogit"
__copyright__   = "Copyright 2018-2020"

import sys
import re

def translate (intValue):
    """Function translate takes an integer and return a string representation of 
    that integer with commas separating groups of 3 digits. For example:

    print translate (1234)
    '1,234'
    print translate (123456789)
    '123,456,789'

    Args:
        intValue (int): The integer parameter to be translated.

    Returns:
        str: The return value with commas.

    Raises:
        ValueError: If intValue is not an integer.

    """

    try:
        int(intValue)
    except ValueError:
        print("Error: Input is not an integer")
        sys.exit(1)
    
    # integer input is transformed into string
    strValue = str(intValue)
    # total length of tranformed string
    totLen = len(strValue)
    # separating groups of 3 digits
    groupSize = 3
    # string result with commas to be returned
    result = ''
    
    # loop over strValue to build result adding commas
    for i, c in enumerate(strValue):
        # digit is added to result
        result = result+c
        # comma is added between groups of 3 digits except at the end
        if((totLen-1-i)%groupSize == 0 and i != totLen-1):
            result = result+','
            
    return result

def translate_regex (intValue):
    """Function translate takes an integer and return a string representation of 
    that integer with commas separating groups of 3 digits using regular expression.
    For example:

    print translate_regex (1234)
    '1,234'
    print translate_regex (123456789)
    '123,456,789'

    Args:
        intValue (int): The integer parameter to be translated.

    Returns:
        str: The return value with commas.
    
    Raises:
        ValueError: If intValue is not an integer.
        
    """

    try:
        int(intValue)
    except ValueError:
        print("Error: Input is not an integer")
        sys.exit(1)
    
    # integer input is transformed into string
    strValue = str(intValue)
    # string result with commas to be returned
    result = ''
    
    # comma is added between groups of 3 digits except at the end using regex
    result = re.sub(r'(?<=\d)(?=(\d\d\d)+(?!\d))', ',', strValue)
    
    return result
