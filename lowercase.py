#!/usr/bin/python
# -*- coding: utf-8-*-
import re
import string
from nltk.corpus import stopwords 


def lowercase(string):
		#returns a lowercase string
		str_lowercase = string.lower()

def removeStopwords(string):
		#returns a string without stopwords
		stop = set(stopwords.words('portuguese'))
		list_message = [i for i in string.split() if i not in stop]
		str_message = ''
		for word in list_message:
			str_message += word + ' '
		return str_message[:-1]