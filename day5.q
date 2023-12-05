//day5.q
//inp:read0`:test_day5.txt
inp:read0`:val_day5.txt;
value first inp; // seeds
grp:"|"vs";"sv{$[x~"";enlist"|";x]}each 2_inp;
grp:(";"vs/:grp)except\:enlist"";
map:`$"-to-"vs/:-5_/:grp[;0];
tbl:ungroup`input`output`val!/:map,'enlist each value@/:/:1_/:grp;
tbl:`sort xasc 0!select last sort,val by input,output from update sort:i from tbl;
f:{if[not any b:x within/:y[;1]+0,/:y[;2]-1;:x];first y[i;0]+x-y[i:where b;1]}/[;exec val from tbl];
// Part 1
min f each seeds
//tbl:delete val from update map:{(y+z)!x+z}'[val[;0];val[;1]]til each val[;2] from tbl;
//lst:exec map from delete sort from`sort xasc 0!select last sort,(,/)map by input,output from update sort:i from tbl;
//min {x^y x}/[seeds;lst]

// Part 2 bollox
seed_range:2 cut value 7_first inp;
//lots_of_seeds:distinct raze seed_range[;0]+til each seed_range[;1];
//min f each lots_of_seeds
