%Addition of three lists . It will handle different size as well

sumlists( []     , []     , []    , [] ) .

sumlists( [X|Xs] , []     , []    , [P|Ps] ) :- P is X+0+0 , sumlists( Xs , [] , [] , Ps ) .
sumlists( []     , [Y|Ys] , []    , [P|Ps] ) :- P is Y+0+0 , sumlists( [] , Ys , [] , Ps ) .
sumlists( []     , []     , [Z|Zs], [P|Ps] ) :- P is Z+0+0 , sumlists( [] , [] , Zs , Ps ) .

sumlists( [X|Xs] , [Y|Ys] , []    , [P|Ps] ) :- P is X+Y+0 , sumlists( Xs , Ys , [] , Ps ) .
sumlists( [X|Xs] , []     , [Z|Zs], [P|Ps] ) :- P is X+Z+0 , sumlists( Xs , [] , Zs , Ps ) .

sumlists( []     , [Y|Ys] , [Z|Zs], [P|Ps] ) :- P is Z+Y+0 , sumlists( [] , Ys , Zs , Ps ) .

sumlists( [X|Xs] , [Y|Ys] , [Z|Zs], [P|Ps] ) :- P is X+Y+Z , sumlists( Xs , Ys , Zs , Ps ) .