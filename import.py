#!/usr/bin/python
# -*- encoding: utf-8-*-
import string
import re
import ngram
import string
import nltk
from nltk.collocations import *
import glob
import os


def main():
	# path = '/Users/tiagosimoes/Google Drive/IST/MEIC/LN/P/P2/Corpora/treino/AlmadaNegreiros/'
	# for filename in glob.glob(os.path.join(path, '*.txt')):
	# # do your stuff
	# 	print filename

	path = '/Users/tiagosimoes/Google Drive/IST/MEIC/LN/P/P2/Corpora/treino/'
	for filename in os.listdir(path):
		print filename

	for root, dirs, files in os.walk(path):
		print 'root : ', root
		print 'dirs : ', dirs
		print 'files : ',files
		for file in files:
			#with open(os.path.join(root, file), "r") as auto:
			if os.path.join(root, file) == '*.txt'
				print file

if __name__ == '__main__':
    main()