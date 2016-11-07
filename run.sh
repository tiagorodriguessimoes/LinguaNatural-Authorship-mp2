# !/bin/bash
# Grupo	29
# Joao Pinheiro	73302
# Tiago Simoes	73100
# -------------------------------------
# ---Campos a editar pelo utilizador---
# -------------------------------------
# Local dos ficheiros de treino
dirTrainingFiles="./Corpora/treino/"
# Local dos ficheiros de teste
dirTestingFiles="./Corpora/teste/"
# Local da instalacao do ngram-count
ngramcountpath="/Applications/srilm-1.7.1/bin/macosx/ngram-count"
# -------------------------------------

dirTrainingProcessedFiles="./tmptreino/"
dirTestingProcessedFiles="./tmpteste/"

txtextension=".txt"
lmextension=".lm"
rmstopwords="_rmstopwords"

experiencia1="_nosmooth_nolower_stopwords_unigrams"
experiencia2="_nosmooth_nolower_stopwords_bigrams"
experiencia3="_nosmooth_lower_stopwords_unigrams"
experiencia4="_nosmooth_lower_stopwords_bigrams"
experiencia5="_wbsmooth_lower_stopwords_unigrams"
experiencia6="_wbsmooth_lower_stopwords_bigrams"
experiencia7="_wbsmooth_lower_rmstopwords_unigrams"
experiencia8="_wbsmooth_lower_rmstopwords_bigrams"

#---------------------------------------
# criar directorios temporarios para trabalhar
rm -rf tmpteste
rm -rf tmptreino
rm -rf answers

mkdir tmpteste
mkdir tmptreino
mkdir answers

# corpus treino
for f in $dirTrainingFiles* ; do

	mkdir tmptreino/${f##*/}
	mkdir tmptreino/${f##*/}/normalized
	mkdir tmptreino/${f##*/}/lm
	mkdir tmptreino/${f##*/}/experiencia1
	mkdir tmptreino/${f##*/}/experiencia2
	mkdir tmptreino/${f##*/}/experiencia3
	mkdir tmptreino/${f##*/}/experiencia4
	mkdir tmptreino/${f##*/}/experiencia5
	mkdir tmptreino/${f##*/}/experiencia6
	mkdir tmptreino/${f##*/}/experiencia7
	mkdir tmptreino/${f##*/}/experiencia8	

	filepath="./tmptreino/${f##*/}/"
	alltxt="all.txt"
	joinfile="$filepath$alltxt"
	normalized="normalized/${f##*/}$txtextension"
	normalizedrmstopwords="normalized/${f##*/}$rmstopwords$txtextension"

	for d in $f*/* ; do
		cat "$d" >> "$joinfile"
	done;

	python normalize.py "$joinfile" > "$filepath$normalized"
	python normalizermstopwords.py "$joinfile" > "$filepath$normalizedrmstopwords"

	experiencia1file="experiencia1/${f##*/}$experiencia1$txtextension"
	experiencia2file="experiencia2/${f##*/}$experiencia2$txtextension"
	experiencia12lm="lm/${f##*/}$lmextension"

	experiencia3file="experiencia3/${f##*/}$experiencia3$txtextension"
	experiencia4file="experiencia4/${f##*/}$experiencia4$txtextension"
	experiencia34lm="lm/${f##*/}$lmextension"

	experiencia5file="experiencia5/${f##*/}$experiencia5$txtextension"
	experiencia6file="experiencia6/${f##*/}$experiencia6$txtextension"
	experiencia56lm="lm/${f##*/}$lmextension"


	experiencia7file="experiencia7/${f##*/}$experiencia7$txtextension"
	experiencia8file="experiencia8/${f##*/}$experiencia8$txtextension"
	experiencia78lm="lm/${f##*/}$lmextension"

	# EXPERIENCIAS 1 e 2

	$ngramcountpath -text "$filepath$normalized" \
	-order 2 -write1 "$filepath$experiencia1file" \
	-write2 "$filepath$experiencia2file" \
	-lm "$filepath$experiencia12lm"

	# EXPERIENCIAS 3 e 4

	$ngramcountpath -text "$filepath$normalized" -tolower \
	-order 2 -write1 "$filepath$experiencia3file" \
	-write2 "$filepath$experiencia4file" \
	-lm "$filepath$experiencia34lm"

	# EXPERIENCIAS 5 e 6

	$ngramcountpath -text "$filepath$normalized" -tolower \
	-order 2 -wbdiscount1 -wbdiscount2 -write1 "$filepath$experiencia5file" \
	-write2 "$filepath$experiencia6file" \
	-lm "$filepath$experiencia56lm"

	# EXPERIENCIAS 7 e 8

	$ngramcountpath -text "$filepath$normalizedrmstopwords" -tolower \
	-order 2 -wbdiscount1 -wbdiscount2 -write1 "$filepath$experiencia7file" \
	-write2 "$filepath$experiencia8file" \
	-lm "$filepath$experiencia78lm"

done;

echo "Corpora de treino processado!"

# corpus teste
for f in $dirTestingFiles* ; do
	mkdir tmpteste/${f##*/}
	mkdir tmpteste/${f##*/}/normalized
	mkdir tmpteste/${f##*/}/lm
	mkdir tmpteste/${f##*/}/experiencia1
	mkdir tmpteste/${f##*/}/experiencia2
	mkdir tmpteste/${f##*/}/experiencia3
	mkdir tmpteste/${f##*/}/experiencia4
	mkdir tmpteste/${f##*/}/experiencia5
	mkdir tmpteste/${f##*/}/experiencia6
	mkdir tmpteste/${f##*/}/experiencia7
	mkdir tmpteste/${f##*/}/experiencia8

	filepath="./tmpteste/${f##*/}/"

	i=1
	for d in $f*/* ; do

		normalized="normalized/$i$txtextension"
		normalizedrmstopwords="normalized/$i$rmstopwords$txtextension"
		results="results$txtextension"
		answerspath="./answers/"
		answere1="answers_experiencia1"
		answere2="answers_experiencia2"
		answere3="answers_experiencia3"
		answere4="answers_experiencia4"
		answere5="answers_experiencia5"
		answere6="answers_experiencia6"
		answere7="answers_experiencia7"
		answere8="answers_experiencia8"

		experiencia1file="experiencia1/$i$experiencia1$txtextension"
		experiencia2file="experiencia2/$i$experiencia2$txtextension"
		experiencia12lm="lm/${f##*/}$i$lmextension"

		experiencia3file="experiencia3/$i$experiencia3$txtextension"
		experiencia4file="experiencia4/$i$experiencia4$txtextension"
		experiencia34lm="lm/${f##*/}$i$lmextension"

		experiencia5file="experiencia5/$i$experiencia5$txtextension"
		experiencia6file="experiencia6/$i$experiencia6$txtextension"
		experiencia56lm="lm/${f##*/}$i$lmextension"


		experiencia7file="experiencia7/$i$experiencia7$txtextension"
		experiencia8file="experiencia8/$i$experiencia8$txtextension"
		experiencia78lm="lm/${f##*/}$i$lmextension"

		python normalize.py "$d" > "$filepath$normalized"
		python normalizermstopwords.py "$d" > "$filepath$normalizedrmstopwords"
		
		# EXPERIENCIAS 1 e 2

		$ngramcountpath -text "$filepath$normalized" \
		-order 2 -write1 "$filepath$experiencia1file" \
		-write2 "$filepath$experiencia2file" \
		-lm "$filepath$experiencia12lm"

		for author in $dirTrainingProcessedFiles*/experiencia1/* ; do
			echo `python authorship.py "$author" "$filepath$experiencia1file"`	"${author%/*/*}" >> "$filepath${d##*/}$experiencia1$results"
		done

		echo `python determineAuthor.py "$filepath${d##*/}$experiencia1$results"` "${f##*/}" >> "$answerspath$answere1${d##*/}"

		for author in $dirTrainingProcessedFiles*/experiencia2/* ; do
			echo `python authorship.py "$author" "$filepath$experiencia2file"`	"${author%/*/*}" >> "$filepath${d##*/}$experiencia2$results"
		done

		echo `python determineAuthor.py "$filepath${d##*/}$experiencia2$results"` "${f##*/}" >> "$answerspath$answere2${d##*/}"

		# EXPERIENCIAS 3 e 4

		$ngramcountpath -text "$filepath$normalized" -tolower \
		-order 2 -write1 "$filepath$experiencia3file" \
		-write2 "$filepath$experiencia4file" \
		-lm "$filepath$experiencia34lm"

		for author in $dirTrainingProcessedFiles*/experiencia3/* ; do
			echo `python authorship.py "$author" "$filepath$experiencia3file"`	"${author%/*/*}" >> "$filepath${d##*/}$experiencia3$results"
		done

		echo `python determineAuthor.py "$filepath${d##*/}$experiencia3$results"` "${f##*/}" >> "$answerspath$answere3${d##*/}"

		for author in $dirTrainingProcessedFiles*/experiencia4/* ; do
			echo `python authorship.py "$author" "$filepath$experiencia4file"`	"${author%/*/*}" >> "$filepath${d##*/}$experiencia4$results"
		done

		echo `python determineAuthor.py "$filepath${d##*/}$experiencia4$results"` "${f##*/}" >> "$answerspath$answere4${d##*/}"

		# EXPERIENCIAS 5 e 6

		$ngramcountpath -text "$filepath$normalized" -tolower \
		-order 2 -wbdiscount1 -wbdiscount2 -write1 "$filepath$experiencia5file" \
		-write2 "$filepath$experiencia6file" \
		-lm "$filepath$experiencia56lm"

		for author in $dirTrainingProcessedFiles*/experiencia5/* ; do
			echo `python authorship.py "$author" "$filepath$experiencia5file"`	"${author%/*/*}" >> "$filepath${d##*/}$experiencia5$results"
		done

		echo `python determineAuthor.py "$filepath${d##*/}$experiencia5$results"` "${f##*/}" >> "$answerspath$answere5${d##*/}"

		for author in $dirTrainingProcessedFiles*/experiencia6/* ; do
			echo `python authorship.py "$author" "$filepath$experiencia6file"`	"${author%/*/*}" >> "$filepath${d##*/}$experiencia6$results"
		done

		echo `python determineAuthor.py "$filepath${d##*/}$experiencia6$results"` "${f##*/}" >> "$answerspath$answere6${d##*/}"

		# EXPERIENCIAS 7 e 8

		$ngramcountpath -text "$filepath$normalizedrmstopwords" -tolower \
		-order 2 -wbdiscount1 -wbdiscount2 -write1 "$filepath$experiencia7file" \
		-write2 "$filepath$experiencia8file" \
		-lm "$filepath$experiencia78lm"

		for author in $dirTrainingProcessedFiles*/experiencia7/* ; do
			echo `python authorship.py "$author" "$filepath$experiencia7file"`	"${author%/*/*}" >> "$filepath${d##*/}$experiencia7$results"
		done

		echo `python determineAuthor.py "$filepath${d##*/}$experiencia7$results"` "${f##*/}" >> "$answerspath$answere7${d##*/}"

		for author in $dirTrainingProcessedFiles*/experiencia8/* ; do
			echo `python authorship.py "$author" "$filepath$experiencia8file"`	"${author%/*/*}" >> "$filepath${d##*/}$experiencia8$results"
		done

		echo `python determineAuthor.py "$filepath${d##*/}$experiencia8$results"` "${f##*/}" >> "$answerspath$answere8${d##*/}"

		((i++))
	done;
done;

echo "Corpora de teste processado!"

