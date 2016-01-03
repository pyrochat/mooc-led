# -*- coding: utf-8 -*-

#===========================================
# Pré-processeur pour faciliter la création
# de diapositives PDF en MarkDown
#===========================================
# Pierre-Yves Rochat EPFL 2015, BSD licence
#===========================================
# 2015/12/25 : les définitions ne sont pas copiés dans le fichier
# (il faut ajouter un <!-- def A --> pour le placer, même la première fois)
# 2015/12/26 : -c mode compact, ne donne que la dernière copie d'une section

"""DocString :
... in_file out-file [-c]

-c --compact : ne produit que la diapositive finale
-h --help : affiche ce message

<!-- def A --> Ajoute la ligne à une définition
<!-- A --> Insert les lignes définies
A l'intérieur d'une section :
<!-- 123 --> répète la section autant de fois que le plus grand chiffre
en prenant les lignes où les chiffres successifs sont présent
"""

import sys
import getopt

_compact = 0

def pre_dia(fichiers):
  print "Pre-DIA : préprocesseur pour les diapositives en MarkDown"
  print "Rev 15-12"
  print "Pierre-Yves Rochat, pyr@pyr.ch, EPFL"
  global _compact
  if _compact :
    print "Mode compact"

  fi = open(fichiers[0], 'r')
  fo = open(fichiers[1], 'w')
  defA = [] # lignes à répéter
  section = 0 # on est hors d'une section
  dernire = 0

  for li in fi.readlines():
    if '<!-- def A -->' in li: # enregistre une définition
      defA.append(li[14:])
    else :
      if '<!-- A -->' in li : # reproduit une définition
        if section==0 :
          for lia in defA:
            fo.write(lia)
        else :
          sec.append(li)
      else :
        if '<section' in li: # détecte un début de section
          sec = []; section = 1; sec.append(li)
          secI = [0,0,0,0,0,0,0,0,0,0]
          section = 1
          dernier = 0
        else :
          if '</section' in li: # détecte une fin de section
            section = 0
            print 'Section', secI, 'dernier: ', dernier
            sec.append(li)
            if (_compact==0) or (dernier==0) :
              for lisec in sec : # envoie toujours la section
                deb=lisec.find('<!-- '); fin=lisec.find(' -->');
                if deb<0 and fin<0 :  # les lignes sans balise
                  fo.write(lisec)
                if '<!-- A -->' in lisec: # reproduit une définition
                  for lia in defA:
                    fo.write(lia)
            for i in range(1,10): # renvoie la section autant de fois que nécessaire
              if ((_compact==0) and (secI[i]>0)) or ((_compact==1) and (i==dernier)) : # si le chiffre est représenté
                fo.write('\n')
                for lisec in sec :
                  if '<!-- A -->' in lisec: # reproduit une définition
                    for lia in defA:
                      fo.write(lia)
                  else :
                    deb=lisec.find('<!-- '); fin=lisec.find(' -->');
                    if deb>=0 and fin>=0 :
                      if lisec[deb+4:fin].find("%i" % i)>=0 :
                        fo.write(lisec[fin+4:])
                    else :
                      fo.write(lisec)
          else :
            if section==1 :
              sec.append(li)
              deb=li.find('<!-- '); fin=li.find(' -->');
              for i in range(1,10):  
                if deb>=0 and fin>=0 and li[deb+4:fin].find("%i" % i)>=0 :
                  secI[i]=1
                  if i>dernier :
                    dernier = i;
            else :
              fo.write(li)

  fi.close()
  fo.close()

def main():
    # parse command line options
    try:
        opts, args = getopt.getopt(sys.argv[1:], "hc", ["help", "compact"])
    except getopt.error, msg:
        print msg
        print "for help use --help"
        sys.exit(2)
    # process options$
    print args
    print opts

    for o, a in opts:
        if o in ("-h", "--help"):
            print __doc__
            sys.exit(0)
        if o in ("-c", "--compact"):
            global _compact
            _compact = 1
            print "Mode compact"
    # process arguments
    print args
    pre_dia(args)

if __name__ == "__main__":
    main()

