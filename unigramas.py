#!/usr/bin/python
# -*- encoding: utf-8-*-
import string
import re
import ngram
import string
import nltk

# contagem de unigramas sem alisamento
def main():
	unigrams = {}
	file_path = '/Users/tiagosimoes/Google Drive/IST/MEIC/LN/P/P2/Corpora/treino/AlmadaNegreiros/pg22615.txt'
	with open(file_path, 'r') as file:
		content = file.readlines()
		for line in content:
			words = line.split()
			for word in words:
				if word in unigrams:
					unigrams[word] = unigrams[word] + 1
				else:
					unigrams[word] = 1
		print unigrams
if __name__ == '__main__':
    main()