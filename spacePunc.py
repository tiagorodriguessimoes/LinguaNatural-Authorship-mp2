#!/usr/bin/python
# -*- encoding: utf-8-*-
import string
import re

def main():
	file_path = '/Users/tiagosimoes/Google Drive/IST/MEIC/LN/P/P2/Corpora/treino/AlmadaNegreiros/pg22615.txt'
	with open(file_path, 'r') as file:
		content = file.readlines()
		for line in content:
			separatePunctuation(line)

def separatePunctuation(s):
	list_punctuation = '([:._,!?()])'
	s = re.sub(list_punctuation, r' \1 ', s)
	s = re.sub('\s{2,}', ' ', s)
	print s

if __name__ == '__main__':
    main()