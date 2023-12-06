// day6
//inp:read0`:test_day6.txt;
inp:read0`:val_day6.txt;
// Part 1
data:flip{(`$x[;0])!value each x[;1]}":"vs/:inp;
(*/){count where l!x[`Distance]<=l:reverse[t]*1+t:til x`Time}each data
// Part 2
inp:ssr[;" ";""]each inp;
data:enlist{(`$x[;0])!value each x[;1]}":"vs/:inp;
(*/){count where l!x[`Distance]<=l:reverse[t]*1+t:til x`Time}each data
