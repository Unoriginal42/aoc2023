// day2
//inp:read0`:inp_test2.txt;
inp:read0`:inp_part1_day2.txt;
map:`blue`red`green!14 12 13;
adj_inp:("J"$s[;0]inter\:.Q.n)!{x[;1]}s:":"vs/:inp;
// Part 1
sum where {s:" "vs/:trim raze","vs/:";"vs x;all(map`$s[;1])>="J"$s[;0]}each adj_inp

// Part 2
sum {s:" "vs/:trim raze","vs/:";"vs x;exec (*/)n from select max n by c from update "J"$n,`$c from`n`c!/:s}each adj_inp
