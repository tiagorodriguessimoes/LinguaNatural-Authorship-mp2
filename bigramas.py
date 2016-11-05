#!/usr/bin/python
# -*- encoding: utf-8-*-
import string
import re
import ngram
import string
import nltk
from nltk.collocations import *

# contagem de bigramas sem alisamento
def main():

	file_path = '/Users/tiagosimoes/Google Drive/IST/MEIC/LN/P/P2/Corpora/treino/AlmadaNegreiros/pg22615.txt'
	with open(file_path, 'r') as file:
		words = list()
		content = file.readlines()
		for line in content:
			for word in line.split():
				words.append(word)

		finder = BigramCollocationFinder.from_words(words)
		for k,v in finder.ngram_fd.items():
  			if v > 1 : 
  				print(k,v)

if __name__ == '__main__':
    main()