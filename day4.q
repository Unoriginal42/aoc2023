// day4
//inp:read0`:test_day4.txt;
inp:read0`:data_day4.txt;
tbl:update card:"J"$last each" "vs/:card,value each win,value each nums from `card`win`nums!/:raze each "|"vs/:/:":"vs/:inp;
calc:{[n]$[n=0;0f;2 xexp n-1]};
// Part 1 
sum exec calc each sum each nums in' win from tbl

// Part 2
tbl:update numOfWins:card+1+til each sum each nums in' win from tbl;
// Horrifically inefficient 
count{y;x,x exec raze numOfWins-1 from x where card=y }/[select card,numOfWins from tbl;exec card from tbl]
