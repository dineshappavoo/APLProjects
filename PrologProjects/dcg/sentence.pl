nsentence(fsent(N,V)) --> np(N), vp(V).

np(fnp(A,N)) --> article(A), noun(N).

vp(fvp(V,N)) --> verb(V), np(N).

verb(fverb(eat)) --> [eat].

verb(fverb(eats)) --> [eats].

article(farticle(a)) --> [a].

article(farticle(an)) --> [an].

article(farticle(the)) --> [the].

noun(fnoun(apple)) --> [apple].

noun(fnoun(man)) --> [man].

test(P) :- sentence(P, [the, man, eats, the, apple], []).