// day6
//inp:read0`:test_day6.txt;
inp:read0`:val_day6.txt;
inp:ssr[;" ";""]each inp;
// Part 1
data:flip{(`$x[;0])!value each x[;1]}":"vs/:inp;
(*/){count where l!x[`Distance]<=l:reverse[til x`Time]*1+til x`Time}each data
// Part 2
data:enlist{(`$x[;0])!value each x[;1]}":"vs/:inp;
(*/){count where l!x[`Distance]<=l:reverse[til x`Time]*1+til x`Time}each data
