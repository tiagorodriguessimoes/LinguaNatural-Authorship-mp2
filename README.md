# LinguaNatural-Authorship-mp2
[Página da Cadeira](https://fenix.tecnico.ulisboa.pt/disciplinas/LN35179/2016-2017/1-semestre/pagina-inicial)

LÍNGUA NATURAL 2016/2017 
Mini-Projecto No 2 — MP2

Data limite entrega: até às 12:00 (meio dia) do dia 7/Nov

###OBJECTIVOS
Aprender a construir e utilizar modelos de língua estatísticos no processamento de língua natural.

###ENUNCIADO
Pretende-se identificar o autor de um texto usando o conhecimento previamente extraído de um corpus de textos de vários escritores.

1. Tendo em conta a coleção de textos referentes a 7 autores portugueses (disponibilizada em "treino.zip"):
  * Normalize todos os textos para que a pontuação tenha sempre um espaço à direita e à esquerda (esta é a única restrição que tem de respeitar);
  * Calcule os unigramas e bigramas, sem e com alisamento (qualquer estratégia de alisamento é aceite) para os textos de cada um dos autores.
  
    #####ATENÇÃO:
    Pode usar qualquer ferramenta para calcular os ficheiros de unigramas e bigramas (por exemplo, ngram-count, srilm toolkit, ...);
    Para facilitar a tarefa de avaliação, os ficheiros calculados devem apresentar uma de duas sintaxes:
      * contagem por linha (ver os ficheiros “unigramasDEMO.txt” e “bigramasDEMO.txt” que contêm o formato desejado);
      * ARPA format (ver secção 4.8 do [Jurafsky & Martin, 2009], ver o ficheiro “gramasDEMO.arpa” que contém o formato desejado).

2. Tente identificar o autor dos textos da coleção "teste.zip", usando os modelos de língua calculados anteriormente.
  * Faça três experiências, podendo variar:
    * a normalização (maiúsculas/minúsculas, palavras funcionais, ...); 
    * a dimensão dos N-gramas (unigramas/bigramas);
    * os N-gramas a usar (todos, os mais frequentes, ...);
    * ...
    Nota: A totalidade das experiências deve poder ser reproduzida através da execução de um shell script "run.sh".
  * Faça um relatório (não pode exceder 3 páginas A4) com a análise crítica das experiências/resultados obtidos.
