DOMAINS 
  conditions = number*
  number = integer
  category = string
DATABASE
 truck(number, category, category, conditions)
 cond(number, category)
 topic(category)
 yes(number)
 no(number)
PREDICATES
  menu
  start
  main_fun(number)
  nextemnty
  localdb
  out_show(char)
  consultation
  process_Exp(category)
  nondeterm go(category)
  clear
  check(number, conditions)
  answer(number, string, number, number)
  eval_reply(char)
  inpo(number, number, string)
  info(category)
  add(number)
  record_truck(number, category, category, conditions)
  record_param(number,category)
  show(char)
  delete_rec(char)  
  

CLAUSES

show('1'):-
makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80),
truck(NUMBER,FUEL,NAME,[NOS,PRICE,GROUNDC,POWER,VOLUME]),
write(NUMBER," ",FUEL," ",NAME," ","[",NOS,",",PRICE,",",GROUNDC,",",POWER,",",VOLUME,"]"),nl,fail,
write("Back (y/n) ?"),nl,readchar(C),out_show(C).

show('2'):-
makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80),
cond(A,B),write(A," - ", B),nl,fail.

show('3'):- start().

record_param(ENTERN,ENTERTEXT):-
write("Number: "), readint(ENTERN),
write("Parametr: "), readln(ENTERTEXT).

record_truck(ENTERN,ENTERF,ENTERNAME,[ENTERNOS,ENTERP,ENTERG,ENTERPOWER,ENTERV]):-
write("Number: "), readint(ENTERN),
write("Fuel: "), readln(ENTERF),
write("Name: "), readln(ENTERNAME),
write("Indicators:"),nl, 
write("->"),
readint(ENTERNOS),
readint(ENTERP),
readint(ENTERG),
readint(ENTERPOWER),
readint(ENTERV).

delete_rec('1'):-
makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80),
write("------------------------------------------------------------------------------"),
truck(NUMBER,FUEL,NAME,[NOS,PRICE,GROUNDC,POWER,VOLUME]),
write(NUMBER," ",FUEL," ",NAME," ","[",NOS,",",PRICE,",",GROUNDC,",",POWER,",",VOLUME,"]"),nl,fail,nextemnty.
delete_rec('1'):-
write("------------------------------------------------------------------------------"),
write("DELETE TRUCK: "),nl,
record_truck(NUMBER,FUEL,NAME,[NOS,PRICE,GROUNDC,POWER,VOLUME]),
retract(truck(NUMBER,FUEL,NAME,[NOS,PRICE,GROUNDC,POWER,VOLUME])),write("------------------------------------------------------------------------------"),nl,!.

delete_rec('2'):-
makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80),
write("------------------------------------------------------------------------------"),
cond(C,D),write(C," - ",D),nl,fail.
delete_rec('2'):-
write("------------------------------------------------------------------------------"),
write("DELETE PARAMETR: "),nl,
record_param(Num,Param),
retract(cond(Num,Param)),
write("------------------------------------------------------------------------------"),nl,!.

delete_rec('3'):- menu.

add('3'):- start().

add('1'):-
makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80),
write("------------------------------------------------------------------------------"),
write("Indicators:"),nl, 
cond(A,B),write(A," - ", B),nl,fail.
add('1'):-
write("------------------------------------------------------------------------------"), 
write("ADD TRUCK: "),nl,
record_truck(ADDNUMBER,ADDFUEL,ADDNAME,[ADDNOS,ADDPRICE,ADDGROUNDC,ADDPOWER,ADDVOLUME]),
assertz(truck(ADDNUMBER,ADDFUEL,ADDNAME,[ADDNOS,ADDPRICE,ADDGROUNDC,ADDPOWER,ADDVOLUME])),write("------------------------------------------------------------------------------"),nextemnty,menu.

add('2'):-
makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80),
write("------------------------------------------------------------------------------"),
write("ADD PARAMETR: "),nl,
record_param(ADDNUMBER,ADDTEXT),
assertz(cond(ADDNUMBER,ADDTEXT)),
write("------------------------------------------------------------------------------"),nextemnty,menu.

nextemnty:- nl,write("TYPE ANY BUTTON."),nl,readchar(_).

out_show('y'):-
  start().
out_show('n'):-
  exit.

  topic("truck").
  topic("Diesel").
  topic("Petrol").
  
  truck(101, "truck", "Diesel", [13]).
  truck(102, "truck", "Petrol", [12]).

  cond(1, "Number of seats - five").
  cond(2, "Number of seats - three").
  cond(3, "The price is less than 1900t.r."). 
  cond(4, "The price is less than 2100t.r."). 
  cond(5, "The price is less than 2500t.r."). 
  cond(6, "The price is less than 3500t.r."). 
  cond(7, "Ground clearance 170mm"). 
  cond(8, "Ground clearance 190mm").  
  cond(9, "Power less than 160hp"). 
  cond(10, "Power less than 170hp"). 
  cond(11, "Power less than 200hp"). 
  cond(12, "Fuel type - petrol"). 
  cond(13, "Fuel type - diesel").  
  cond(14, "The volume is greater than 18m^3"). 
  cond(15, "The volume is greater than 22m^3").  

localdb:-
assertz(truck(1, "Petrol", "ISUZU ELF 9.5", [1, 6, 8, 11,15])),
assertz(truck(2, "Diesel", "ISUZU 4JJ1", [2, 4, 7, 9, 14])),
assertz(truck(3, "Diesel", "Toyota Dyna", [2, 4, 8, 10, 14])),
assertz(truck(4, "Petrol", "Mitsubishi Fuso", [2,5,8,11,14])),
assertz(truck(5, "Diesel", "Nissan Diesel UZA", [2,3,7,10,14])).

start() :- makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80), menu().

menu:- clearwindow(),nl,
write("-------------------------------------MENU-------------------------------------"),nl,
write("                           0 - SHOW LIST DATABASE"),nl,
write("                           1 - CREATE INITIAL DATABASE"),nl,
write("                           2 - ADD RECORD"),nl,
write("                           3 - DELETE RECORD"),nl,
write("                           4 - DELETE ALL DATABASE"),nl,
write("                           5 - CONSULTATION"),nl,
write("                           6 - INFO"),nl,
write("                           7 - EXIT"),nl,nl,
write("------------------------------------------------------------------------------"),nl,
write("INPUT: "),
readchar(N), main_fun(N),nl.

main_fun('0'):-
makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80), write("------------------------------------------------------------------------------"),write("SELECT A SECTION: "),nl,
write("1 - SHOW TRUCK"),nl,write("2 - SHOW PARAMETR"),nl,write("3 - EXIT"),nl,
write("------------------------------------------------------------------------------"),write(":"),readchar(S),show(S).
 

main_fun('1'):-
makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80),localdb,nl,
write("------------------------------------------------------------------------------"),
write("INITIAL DB CREATED."),nl,
write("------------------------------------------------------------------------------"),fail,menu.

main_fun('2'):-
makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80), write("------------------------------------------------------------------------------"),nl, write("SELECT A SECTION: "),nl,
write("1 - ADD TRUCK"),nl,write("2 - ADD PARAMETR"),nl,write("3 - EXIT"),nl,
write("------------------------------------------------------------------------------"),write(":"),readchar(N),add(N).

main_fun('3'):-
makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80),
write("------------------------------------------------------------------------------"),nl, write("SELECT A SECTION: "),nl,
write("1 - DELETE TRUCK"),nl,write("2 - DELETE PARAMETR"),nl,write("3 - EXIT"),nl,
write("------------------------------------------------------------------------------"),write(":"),readchar(M),delete_rec(M),nl,write("---------------------------------------------------------------------------"),write("RECORD WAS DELETED."),
nextemnty,fail,
write("------------------------------------------------------------------------------"),
menu.

main_fun('4'):- 
makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80),
write("------------------------------------------------------------------------------"),
write("DB WAS DELETED."),
write("------------------------------------------------------------------------------"),
retract(truck(_,_,_,[_,_,_,_,_])),fail,nl,
nextemnty,fail,
menu.


main_fun('5'):-
consultation.

main_fun('6'):- 
makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80),
    write("                                  Welcome!"),nl,
    write("  You are using the expert system of Mikhail Tsygankov, a student of IKPI-92, designed to advise on the purchase of a Japanese truck, taking into account   subjective factors, objective needs and solvency of the client, etc."),nl,
   write("  To get started, go to the consultation section (menu section 6)"), nl,
write("----------------------------------------------------------------------------- "),nextemnty,menu.

main_fun('7'):- write("GOODBYE !"),exit.

main_fun(_):- nl,write("WRITE NUMBER 0-8."),
nextemnty,menu.

consultation:-
    process_Exp(MyGoal), 
    go(MyGoal), !.
  consultation:-
    nl, write("Sorry, but I have nothing to help you with =("),consultation.

process_Exp(MyGoal):-
    clear, nl,
    makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80),nl, 
    write("               Welcome to the expert system of japanese trucks"), nl,  
    write("                 To begin the process please type in 'truck'"), nl,
    write("  If you want to see the truck types, please type in a question mark (?)"), nl,
    write("               : "),
    readln(MyGoal), info(MyGoal), !.
  
info("?"):-
  makewindow(1, 15, 13, "Expert system by Tsygankov Mikhail", 1, 0, 24,80),nl, main_fun('0').

  info(X):- 
    X><"?".

inpo(Numb1, Numb2, Text):-
    nl,
    write("Question:- ", Text, "?"),nl,
    write("\tType 1 for 'yes': "), nl,
    write("\tType 2 for 'no': "), nl,
    write(": "), 
    readint(Response),
    answer(Numb1, Text, Numb2, Response).
    
  eval_reply('y'):-
    write("I hope it helped you =)").
  eval_reply('n'):-
    write("Unfortunately, I can't help you =(").
    
   go(MyGoal):-
    NOT(truck(_, MyGoal, _, _)), !, nl,
    write("The truck that we were able to pick up for you - ",   MyGoal, "."), nl,
    write("Are you satisfied with this option (y/n)?"), nl,
    readchar(R),
    eval_reply(R).
    go(MyGoal):-
    truck(Number, MyGoal, Ny, Cond),
    check(Number, Cond),
    go(Ny).
  
  check(Number, [Head|Tail]):-
    yes(Head), !,
    check(Number, Tail).
  check(_, [Head|_]):-
    no(Head), !, fail.
  check(Number, [Head|Tail]):-
    cond(Head, Text), 
    inpo(Number, Head, Text),
    check(Number, Tail).
  check(_, []).
  
  answer(_, _, _, 0):-
    exit.
  answer(_, _, Number, 1):-
    assert(yes(Number)),
    write("yes"), nl.
  answer(_, _, Number, 2):-
    assert(no(Number)),
    write("no"), nl, fail.

clear:-
    retract(yes(_)), fail;
    retract(no(_)), fail;
    !.
GOAL
start().
  