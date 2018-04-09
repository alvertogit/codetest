#!/usr/bin/env python

'''
main.py: It executes translate function examples for Exercise 1.
'''

__author__      = "alvertogit"
__copyright__   = "Copyright 2018"

from function import translate, translate_regex

if __name__ == '__main__':
    print "\nExecuting translate function\n"
    print translate (1234)
    print translate (123456789)
    print "\nExecuting translate_regex function\n"
    print translate_regex (1234)
    print translate_regex (123456789)
    print translate_regex ("12345a")
