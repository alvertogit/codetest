#!/usr/bin/env python

'''
main.py: It executes translate function examples for Exercise 1.
'''

__author__      = "alvertogit"
__copyright__   = "Copyright 2018-2024"

from function import translate, translate_regex

if __name__ == '__main__':
    print("Executing translate function")
    print(translate(1234))
    print(translate(123456789))
    print("Executing translate_regex function")
    print(translate_regex(1234))
    print(translate_regex(123456789))
    print(translate_regex("12345a"))
