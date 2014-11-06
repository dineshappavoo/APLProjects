program_test(pprog(BLK)) --> kbegin(BLK).
kbegin(pbegin(begin)) --> [begin].

test_proc(P) :- prog_test(P,[begin], []).