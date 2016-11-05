import nltk
from nltk import bigrams
from nltk import trigrams

raw = "wefwearsaew ewqrgfwqe gwerg weqrgwergeqwgteq5r ewrg erwg erg ewr g we gw4e gwe45rg w45ergrte r"
tokens = nltk.word_tokenize(raw)

#Create your bigrams
bgs = nltk.trigrams(tokens)

#compute frequency distribution for all the bigrams in the text
fdist = nltk.FreqDist(bgs)
for k,v in fdist.items():
    print k,v