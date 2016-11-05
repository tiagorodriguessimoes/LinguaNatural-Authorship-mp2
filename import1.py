from os import walk
from os.path import splitext
from os.path import join

path = '/Users/tiagosimoes/Google Drive/IST/MEIC/LN/P/P2/Corpora/treino/'
barlist = list()

for root, dirs, files in walk(path):
  for f in files:
    if splitext(f)[1].lower() == ".txt":
      barlist.append(join(root, f))
print barlist