sentence --> noun_phrase(Num), verb_phrase(Num).

noun_phrase(Num) --> article,noun(Num) ; noun(Num) .

verb_phrase(Num) --> verb(Num), noun_phrase(_Anything) ; verb(Num) .

noun(singular) -->  [dog] ; [cat] ; [boy] ; [girl].
noun(plural) -->  [dogs] ; [cats] ; [boys] ; [girls].

verb(singular) -->  [chases] ; [sees] ; [says] ; [believes].
verb(plural) -->  [chase] ; [see] ; [say] ; [believe].

article --> [the] ; [a] ; [].