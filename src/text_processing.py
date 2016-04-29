#! /usr/bin/env python

### python script for processing text in the bbc news project


import scipy.io as sio
import numpy as np


import codecs

from HTMLParser import HTMLParser
from nltk.tokenize import RegexpTokenizer

from nltk.stem.porter import PorterStemmer

from stop_words import get_stop_words


from gensim import corpora, models

class MyHTMLParser(HTMLParser):
	def __init__(self):
		HTMLParser.__init__(self)
		self.plist = []
	def handle_starttag(self,tag,attrs):
		#print "start tag", tag
		return
	def handle_endtag(self,tag):
		#print "end tag",tag
		return
	def handle_data(self,data):
		self.plist.append(data)
		#print "data", data


def pre_process(document):
	''' feed an html document and this function will return texts in vectorized format '''
	parser = MyHTMLParser()


	f = codecs.open(document,encoding="ISO-8859-1")

	parser.feed(f.read())

	#print parser.plist

	docstr = ""
	for t in parser.plist:
		docstr = docstr + t

	#print docstr
	raw = docstr.lower()


	tokenizer = RegexpTokenizer(r'\w+')

	tokens = tokenizer.tokenize(raw)


	#print tokens



	en_stop = get_stop_words('en')


	stopped_tokens = [i for i in tokens if not i in en_stop]

	#print stopped_tokens


	p_stemmer = PorterStemmer()
	
	#try:
	#texts = [p_stemmer.stem(i) for i in stopped_tokens]

	texts = []
	for i in stopped_tokens:
		try:
			i = p_stemmer.stem(i)
		except:
			i = i
		else:
			pass
		texts.append(i)
	
	#print texts


	#dictionary = corpora.Dictionary(texts)


	#corpus = [dictionary.doc2bow(text) for text in texts ]



	#print corpus

	return texts


f = sio.loadmat('fileNames');

li = f['fileNames'];

li = np.ndarray.tolist(li);

fileList = []

texts = []

dic = {}
i = 0;

obj_arr = np.zeros((len(li),),dtype = np.object)


for l in li:
	fil = np.ndarray.tolist((l[0]))[0][:-4] + '.html'
	text = pre_process(fil)
	#print text
	texts.append(text)
	dic[str(i)] = text
	obj_arr[i] = text
	i = i+1


arr = np.array(np.array(i) for i in texts)

dataex = {'arrdata':arr}

sio.savemat('np_cells.mat',{'obj_arr':obj_arr})






