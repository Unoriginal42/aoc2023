//inp:read0`:exp_inp1.txt;
inp:read0`:inp_day1.txt;
// Part 1
sum value each(first;last)@\:/:inp inter\:.Q.n

// Part2
//map:("one";"two";"three";"four";"five";"six";"seven";"eight";"nine")!1 cut 1_.Q.n;
map:("two";"one";"three";"eight";"seven";"nine";"four";"five";"six")!("t2o";"o1e";"t3e";"e8t";"s7n";"n9e";"f4r";"f5e";"s6x");
//inp:read0`:exp__inp1_part2.txt;
inp:read0`:inp_day1_part2.txt;
res:ssr/[;key map;value map]each inp;
sum value each(first;last)@\:/:res inter\:.Q.n 
