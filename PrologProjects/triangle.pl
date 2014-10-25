
%Draw isoceles triangle function in prolog
draw_isoc(N):- S is N//2,position(S),draw(S,S,N).

draw(0,Sc,N):- displaybase(N).

draw(Sr,Sc,N):- SR is Sr-1,SC is Sc-1,SP1 is (N-Sc-Sc),space(SC),display('/'),space(SP1),display('\\'),nl,draw(SR,SC,N).

% Function to display the base of the triangle
displaybase(0).
displaybase(N):- N1 is N-1,display('-'),displaybase(N1).

%Function to append space in the creation
space(0).
space(S):- S1 is S-1,display(' '),space(S1).

position(0):- display('^'),nl.
position(S):- S1 is S-1,display(' '),position(S1).