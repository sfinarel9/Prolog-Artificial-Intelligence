sentence --> noun_phrase(Num), verb_phrase(Num).

noun_phrase(Num) --> article,noun(Num) ; noun(Num) .

verb_phrase(Num) --> verb(Num), noun_phrase(_Anything) ; verb(Num) .

noun(singular) --> [Word], {noun_lexicon(Word)}.
noun(plural) --> [Word], {noun_lexicon(W), name(W,L1), append(L1,"s",L2),name(Word,L2)}.

verb(singular) --> [Word], {verb_lexicon(W), name(W,L1), append(L1,"s",L2),name(Word,L2)}.

verb(plural) --> [Word], {verb_lexicon(Word)}.

article --> [the] ; [a] ; [].

noun_lexicon(dog).
noun_lexicon(cat).
noun_lexicon(boy).
noun_lexicon(girl).

verb_lexicon(chase).
verb_lexicon(see).
verb_lexicon(say).
verb_lexicon(believe).