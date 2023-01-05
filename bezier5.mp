
def straight_angle(expr A, B, C, r) =
  begingroup
    save BA, BC, BA_unit, BC_unit;
    pair BA, BC, BA_unit, BC_unit;
    BA = A - B;
    BC = C - B;
    BA_unit = BA / length BA;
    BC_unit = BC / length BC;
    draw (B + BA_unit * r) -- (B + BA_unit * r + BC_unit * r) -- (B + BC_unit * r)
  endgroup
enddef;

def dot_on(expr pos, usedcolor) =
  %begingroup
  %  interim linecap := rounded;
    doublepath pos withpen pencircle scaled dotlabeldiam withcolor usedcolor
  %endgroup
enddef;

beginfig(1);
  u = 0.5cm;

  picture curves;
  curves := nullpicture;

  addto curves doublepath (3u,10u) .. controls (1u,8u) and (1u,6u) .. (3u, 6u)
      dashed evenly;

  addto curves doublepath (3u,6u){right} ..
       (4.27u, 5.98u) ..
       (5.13u, 5.43u) ..
       (5.13u, 4.57u) ..
       (4.27u, 4.02u) ..
       {left}(3u, 4u) ;
      %withpen pencircle scaled 2bp;
  addto curves doublepath (3u,6u) --
       (4.2u, 6u) --
       (6u, 6.6u) --
       (6u, 3.4u) --
       (4.2u, 4u) --
       (3u, 4u)
      withpen pencircle scaled 0.5bp
      withcolor 0.5white;

  addto curves doublepath (3u,4u) .. controls (1u,4u) and (1u,2u) .. (3u,0u)
      dashed evenly;

  addto curves dot_on((3u,6u), red);
  addto curves dot_on((4.2u, 6u), red);
  addto curves dot_on((6u, 6.6u), red);
  addto curves dot_on((6u, 3.4u), red);
  addto curves dot_on((4.2u, 4u), red);
  addto curves dot_on((3u, 4u), red);

  draw curves rotated (90);
endfig;

beginfig(2);
  pair A, B, C;
  pair D;
  %numeric Dx, Dy;
  numeric l;
  numeric d;
  pair AB, AB.unit;
  pair AC, AC.unit;
  numeric C.offset;
  pair dv;
  pair C.init, C.proj;

  d = 3u;
  C.offset = 2u;

  A = (0, 0);
  AB = (2u, 5u);
  AB.unit = AB / length AB;
  B = A + AB;
  dv = (ypart AB, -xpart AB) / length AB;
  C.init = B + dv*d;
  C = C.init + AB.unit * C.offset;
  C.proj = C - dv*d;
  AC = C - A;
  AC.unit = AC / length AC;

  C - l*AB = D;
  ypart D = 0;

  pair E;
  E = C + 0.5*(C-D);

  pair F;
  F = B + (B - A);

  draw C.proj -- C;
  label.urt(btex $d$ etex, 0.5[C.proj, C]);

  draw A -- B -- C withpen pencircle scaled 2bp;
  draw B -- F;
  draw A -- C;
  draw D -- C -- E dashed evenly;

  r := 1u;
  draw (A + AC.unit * r){dir (angle AC +90)} .. {dir (angle AB + 90)}(A + AB.unit * r);
  straight_angle(A, C.proj, C, 0.5u);

  dotlabel.lft("A", A);
  dotlabel.lft("B", B);
  dotlabel.rt("C", C);

  label.urt(btex $l$ etex, E);
endfig;

beginfig(3);
  pair A, B, C;
  pair D;
  %numeric Dx, Dy;
  numeric l;
  numeric d;
  pair AB, AB.unit;
  pair AC, AC.unit;
  numeric C.offset;
  pair dv;
  pair C.init, C.proj;
  pair H;

  d = 5u;

  A = (0, 0);
  AB = (2u, 5u);
  AB.unit = AB / length AB;
  B = A + AB;
  dv = (ypart AB, -xpart AB) / length AB;
  H = B + AB;
  C = H + dv*d;
  AC = C - A;
  AC.unit = AC / length AC;

  C - l*AB = D;
  ypart D = 0;

  pair E;
  E = C + 0.25*(C-D);

  pair F;
  F = H + 0.2*AB;

  draw H -- C;
  label.urt(btex $d$ etex, 0.5[H, C]);
  drawarrow H -- (H + dv*2u);
  label.bot(btex $\vec n$ etex, H + dv*2u);

  draw A -- B -- C withpen pencircle scaled 2bp;
  draw B -- F;
  draw D -- C -- E dashed evenly;

  %r := 1u;
  %draw (A + AC.unit * r){dir (angle AC +90)} .. {dir (angle AB + 90)}(A + AB.unit * r);
  straight_angle(A, H, C, 0.5u);

  dotlabel.lft("A", A);
  dotlabel.lft("B", B);
  dotlabel.rt("C", C);
  dotlabel.lft(btex $A + 2\overrightarrow{AB}$ etex, H);

  label.rt(btex $l$ etex, E);
endfig;

beginfig(4);
  pair A[], B[], C[];
  pair AB, AB.unit;
  numeric AB.len;
  pair BC, BC.unit;
  %numeric BC.len;
  pair H;
  pair dB, dC;
  pair dB.unit;
  pair L;

  AB.len = 5u;
  AB = (0, AB.len);
  AB.unit = AB / length AB;

  A1 = (3u, 0);
  B1 = A1 + AB;

  BC = (-3u, 4u);
  BC.unit = BC / length BC;
  C0 = B1 + BC;

  dC = AB.unit * 3u;
  C1 = C0 + dC;

  dB = (5u, 10u);
  B2 = B1 + dB;
  H = 0.7[B1,B2];
  dB.unit = dB / length dB;

  L = C0 - 2dC;

  dotlabel.rt(btex $A_1$ etex, A1);
  dotlabel.rt(btex $B_1$ etex, B1);
  dotlabel.lft(btex $C_0$ etex, C0);
  dotlabel.lft(btex $C_1$ etex, C1);
  dotlabel.rt(btex $H$ etex, H);
  dotlabel.rt(btex $B_2$ etex, B2);

  draw A1 -- B1;
  draw B1 -- C0 -- C1;
  draw B1 -- B2;
  draw C1 -- H;

  draw L -- C0 dashed evenly;
  label.lft(btex $l$ etex, L);

  straight_angle(A1, B1, C0, 1u);
  straight_angle(B1, C0, C1, 1u);
  straight_angle(B1, H, C1, 1u);
  straight_angle(C0, C1, H, 1u);

  drawarrow A1 -- (A1 + AB.unit * 2u);
  label.rt(btex $\vec a$ etex, (A1 + AB.unit * 2u));
  drawarrow B1 -- (B1 + dB.unit * 2u);
  label.rt(btex $\vec b$ etex, (B1 + dB.unit * 2u));
  drawarrow B1 -- (B1 + BC.unit * 2u);
  label.lft(btex $\vec n$ etex, (B1 + BC.unit * 2u));

endfig;

beginfig(5);
  picture curves;
  curves := nullpicture;

  addto curves doublepath (3u,10u) .. controls (1u,8u) and (1u,6u) .. (3u, 6u)
      dashed evenly;

  addto curves doublepath (3u,6u){right} ..
       (4.11u, 5.98u) ..
       (4.79u, 5.43u) ..
       (4.79u, 4.57u) ..
       (4.11u, 4.02u) ..
       {left}(3u, 4u) ;
  addto curves doublepath (3u,6u) --
       (4.2u, 6u) --
       (5.4u, 6.6u) --
       (5.4u, 3.4u) --
       (4.2u, 4u) --
       (3u, 4u)
      withpen pencircle scaled 0.5bp
      withcolor 0.5white;

  addto curves doublepath (3u,4u) .. controls (1u,4u) and (1u,2u) .. (3u,0u)
      dashed evenly;

  addto curves dot_on((3u,6u), red);
  addto curves dot_on((4.2u, 6u), red);
  addto curves dot_on((5.4u, 6.6u), red);
  addto curves dot_on((5.4u, 3.4u), red);
  addto curves dot_on((4.2u, 4u), red);
  addto curves dot_on((3u, 4u), red);

  draw curves rotated (90);
endfig;

beginfig(6);
  picture curves;
  curves := nullpicture;

  addto curves doublepath (3u,10u) .. controls (1u,8u) and (1u,6u) .. (3u, 6u)
      dashed evenly;

  addto curves doublepath (3u,6u){right} ..
       (3.81u, 5.98u) ..
       (4.09u, 5.43u) ..
       (4.09u, 4.57u) ..
       (3.81u, 4.02u) ..
       {left}(3u, 4u) ;
  addto curves doublepath (3u,6u) --
       (4.2u, 6u) --
       (4.2u, 6.6u) --
       (4.2u, 3.4u) --
       (4.2u, 4u) --
       (3u, 4u)
      withpen pencircle scaled 0.5bp
      withcolor 0.5white;

  addto curves doublepath (3u,4u) .. controls (1u,4u) and (1u,2u) .. (3u,0u)
      dashed evenly;

  addto curves dot_on((3u,6u), red);
  addto curves dot_on((4.2u, 6u), red);
  addto curves dot_on((4.2u, 6.6u), red);
  addto curves dot_on((4.2u, 3.4u), red);
  addto curves dot_on((4.2u, 4u), red);
  addto curves dot_on((3u, 4u), red);

  draw curves rotated (90);
endfig;

end
