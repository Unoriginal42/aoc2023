// day3 
inp:read0`:inp_test3.txt;
//inp:read0`:inp_day3_part1.txt;
idx:(til count inp)!where each not inp in .Q.n,".";
valid_idx:where not idx~\:`long$();
cmbs:valid_idx,/:'idx valid_idx;
create_idx:{x:enlist x;idty:(x-1),x,x+1;idty}
add:til[3]!(1 2;1 -1;-1 -2); //horror
clean:{[v]
  mtrx:{enlist[x y],x[y][0],/:x[y;1]+add y}[create_idx v]each til 3;
  raze mtrx@'where each all@/:/:mtrx>=0
 };
idx_to_chk:distinct raze clean each raze cmbs;
x_to_y:0!select distinct y by x from`x`y!/:idx_to_chk;
// Part 1
find:{[row;i]
  lst:"|"vs/:"."vs raze{$[x in .Q.n;"|",string y;"."]}'[row;til count row];
  lst:lst where any each raze each lst in .Q.n;
  keep:any each (value@/:/:lst except\:enlist"")in i;
  adj_row:@[row;where not row in .Q.n;:;"."];
  nums:(value each ("."vs adj_row)inter\:.Q.n)except (::);
  nums where keep
 }
final:find'[inp;exec y from x_to_y];
sum(raze/)final

// logic bollx
0 0 0; // if adj 0 0 (0 1)or all count as one if in diags count as 2
1 * 1; // if in either 1 2 separate nums
2 2 2; // same as top line

// Part 2
//inp:read0`:inp_test3.txt;
inp:read0`:inp_day3_part1.txt;
inp:{@[x;where not x in .Q.n,"*";:;"."]}each inp;
idx:(til count inp)!where each not inp in .Q.n,".";
valid_idx:where not idx~\:`long$();
cmbs:valid_idx,/:'idx valid_idx;
clean_v2:{[v]
  mtrx:{enlist[x y],x[y][0],/:x[y;1]+add y}[create_idx v]each til 3;
  mtrx:{x[;0],'asc x[;1]}each mtrx;
  (v;mtrx)
 };
mtrx_map:`k`idxs!/:clean_v2 each raze cmbs;
cnt_map:(101b;110b;011b;111b;100b;001b;000b)!2 1 1 1 1 1 0;
logic:{[d]
  ext:inp ./:/: d`idxs;
  no_negs:all@/:/:d[`idxs]>=0;
  tt:cnt_map b:no_negs and' ext in\:.Q.n;
  valid:raze d[`idxs]@'where each b;
  `k`idxs!(d`k;$[2=sum tt;valid;()]) 
 };
adj_mtrx:select from logic each mtrx_map where not idxs~\:();
adj_x_to_y:select y by k,x from ungroup select k:`$" "sv/:string k,idxs[;;0],y:idxs[;;1] from adj_mtrx;
find:{[d]
  row:inp d`x;
  i:d`y;
  lst:"|"vs/:"."vs raze{$[x in .Q.n;"|",string y;"."]}'[row;til count row];
  lst:lst where any each raze each lst in .Q.n;
  keep:any each (value@/:/:lst except\:enlist"")in i;
  adj_row:@[row;where not row in .Q.n;:;"."];
  nums:(value each ("."vs adj_row)inter\:.Q.n)except (::);
  (d`k;nums where keep)
 };
first exec sum v from select (*/)raze v by k from `k`v!/:find each 0!adj_x_to_y
