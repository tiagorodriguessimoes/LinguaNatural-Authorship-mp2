#!/usr/bin/python
# -*- encoding: utf-8-*-
import string
import re
import sys
import ngram
import string
import nltk
from nltk.collocations import *
# /Users/tiagosimoes/Google Drive/IST/MEIC/LN/P/P2/Corpora/treino/AlmadaNegreiros/pg22615.txt
def main():
	file_path = sys.argv[1]
	list_strings = []

	with open(file_path, 'r') as file:
		content = file.readlines()
		for line in content:
			line_no_punct = separatePunctuation(line)
			# Remover paragrafos sem conteudo.
			if(line_no_punct != '\n'):
				list_strings.append(line_no_punct)
		print unigrams(lowercase(list_strings))
		#print bigrams(lowercase(list_strings))

def lowercase(list_strings):
# returns a lowercase string
	list_string_lowercase = []
	for line in list_strings:
		list_string_lowercase.append(line.lower())
	return list_string_lowercase

def separatePunctuation(s):
# return a string without punctuation
	list_punctuation = '([:._,!?()])'
	s = re.sub(list_punctuation, r' \1 ', s)
	s = re.sub('\s{2,}', ' ', s)
	#print s
	return s

def unigrams(list_strings):
	unigrams = {}
	for line in list_strings:
		for word in line.split():
			if word in unigrams:
				unigrams[word] = unigrams[word] + 1
			else:
				unigrams[word] = 1

	for k, v in unigrams.iteritems():
			print k, v

def bigrams(list_strings):
	words = list()
	for line in list_strings:
		for word in line.split():
			words.append(word)

	finder = BigramCollocationFinder.from_words(words)
	for k,v in finder.ngram_fd.items():
  		if v > 1: 
  			print k[0], k[1], v
  	return

if __name__ == '__main__':
    main()