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
	file_testing = sys.argv[1]
	file_training = sys.argv[2]
	threshold = 500
	heuristic = 0

	training = open(file_training, "rw+")
	trainingreader = [x.strip().split('\t') for x in training]
	trainingsortedlist = sorted(trainingreader, key=lambda row: int(row[1]), reverse=True)
	training_sum_count = sum(int(row[1]) for row in trainingsortedlist)
	filtered_training = trainingsortedlist[:threshold]
	filtered_keys = [item[0] for item in filtered_training]

	testing = open(file_testing, "rw+")
	testingreader = [y.strip().split('\t') for y in testing]
	testsortedlist = sorted(testingreader, key=lambda row: int(row[1]), reverse=True)
	test_sum_count = sum(int(row[1]) for row in testsortedlist)
	filtered_test = testsortedlist[:threshold]

	for item_ngram in filtered_test: 
		if item_ngram[0] in filtered_keys: # and float(item_ngram[1]) / float(training_sum_count) < 0.01:
			index_test = filtered_test.index(item_ngram)
			index_training = filtered_keys.index(item_ngram[0])
			heuristic += abs(index_test - index_training)
		else:
			heuristic += threshold
	print heuristic

if __name__ == '__main__':
	main()