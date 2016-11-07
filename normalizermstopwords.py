#!/usr/bin/python
# -*- coding: utf-8-*-
# Grupo	29
# Joao Pinheiro	73302
# Tiago Simoes	73100
import re
import sys
import string
from nltk.corpus import stopwords 

def main():
	file_path = sys.argv[1]
	list_strings = []

	with open(file_path, 'r') as file:
		content = file.readlines()
		for line in content:
			line_no_punct = separatePunctuation(line)
			line_no_punct_no_stopwords = removeStopwords(line_no_punct)
			# Remover paragrafos sem conteudo.
			if(line_no_punct_no_stopwords != '\n'):
				list_strings.append(line_no_punct_no_stopwords)
	for string in list_strings:
		print string

def separatePunctuation(s):
# return a string without punctuation
	list_punctuation = '([:.+^*%\/_,!?(\[\])])'
	s = re.sub(list_punctuation, r' \1 ', s)
	s = re.sub('\s{2,}', ' ', s)
	#print s
	return s

def removeStopwords(string):
	#returns a string without stopwords
	stop = set(stopwords.words('portuguese'))
	list_message = [i for i in string.split() if i not in stop]
	str_message = ''
	for word in list_message:
		str_message += word + ' '
	return str_message[:-1]


if __name__ == '__main__':
	main()