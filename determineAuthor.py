#!/usr/bin/python
# -*- encoding: utf-8-*-
# Grupo	29
# Joao Pinheiro	73302
# Tiago Simoes	73100

import string
import re
import sys
import csv
def main():
	results_file = sys.argv[1]

	stream = open(results_file, "rw+")
	reader = [x.strip().split(' ') for x in stream]
	sortedlist = sorted(reader, key=lambda row: int(row[0]), reverse=True)

	print sortedlist[-1][1]

if __name__ == '__main__':
	main()