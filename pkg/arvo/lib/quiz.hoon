|_  [eny=@uv runs=@ud]
++  give
  |$  [sam]
  $-([@ud _og] sam)
++  check
  |*  [vax=vase give=(unit (give)) alts=(unit $-(vase (list vase)))]
  =?  runs  =(0 runs)  100
  =+  size=1
  =+  sax=(slot 6 vax)
  =+  run-i=0
  =+  rng=~(. og eny)
  =+  drop=0
  |-  ^-  ?
  ?:  =(run-i runs)
      ~&  [success-runs+run-i drops+drop]
      %.y
  =/  sam=vase
    ?~  give
      (~(fill quiz [size rng]) sax)
    [p=p.sax q=(u.give size rng)]
  =+  res=(slum q.vax q.sam)
  =?  drop  =(res %drop)  +(drop)
  ?:  |(=(res %drop) =(res %.y))
    :: Arbitrarily chosen growth pace.
    =+  new-size=(add +(size) (div (mul size 2) 21))
    $(run-i +(run-i), rng +:(rads:rng 1), size new-size)
  ?>  =(res %.n)
  =+  sink=?~(alts sink u.alts)
  =+  sunk=(sink sam)
  =/  simp=vase
    |-
    ?~  sunk
      sam
    =+  res=(slam vax i.sunk)
    ?:  |(=(+:res %.y) =(+:res %drop))
      $(sunk t.sunk)
    =.  sam  i.sunk
    $(sunk (sink i.sunk))
  ~&  [fail-with-sam+(noah simp) drops+drop]
  %.n
++  sink
  |=  sax=vase
  ^-  (list vase)
  ?+  p.sax  ~
    %noun            ?^  q.sax
                       ~[(slot 2 sax) (slot 3 sax)]
                     ?:  =(q.sax 0)
                       ~
                     ~[sax(q (div q.sax 2)) sax(q (dec q.sax))]
    [%atom p=* q=~]  ?>  ?=(@ q.sax)
                     ?:  =(q.sax 0)
                       ~
                     ~[sax(q (div q.sax 2)) sax(q (dec q.sax))]
    [%atom *]        ~
    [%cell p=* q=*]  =+  p=(slot 2 sax)
                     =+  q=(slot 3 sax)
                     =+  ps=(sink p)
                     =+  qs=(sink q)
                     ?~  qs
                       (turn ps |=(p=vase (slop p q)))
                     |-
                     ^-  (list vase)
                     ?~  ps
                       (turn qs |=(q=vase (slop p q)))
                     =+  cs=(turn qs |=(q=vase (slop i.ps q)))
                     (weld cs $(ps t.ps))
    [%face p=* q=*]  %+  turn
                       (sink [q.p.sax q.sax])
                     |=  q=vase
                     sax(q q.q)
    [%hint p=* q=*]  %+  turn
                       (sink [q.p.sax q.sax])
                     |=  q=vase
                     sax(q q.q)
  ==
++  quiz
  |_  [size=@ud rng=_og]
  ++  fill
    |=  sax=vase
    ^+  sax
    =+  new-rng=+:(rads:rng 1)
    ?+  p.sax  ~&(warn-unfill-sam+`type`p.sax sax)
      %noun            !>  (gen-noun size new-rng)
      [%atom p=* q=~]  !>  ((gen-atom @) size new-rng)
      [%atom *]        sax(q (need q.p.sax))
      [%cell p=* q=*]  =+  [rng-1 rng-2]=(split-rng rng)
                       %+  slop  (fill(rng rng-1) (slot 2 sax))
                                 (fill(rng rng-2) (slot 3 sax))
      [%face p=* q=*]  sax(q q:(fill [p=q.p.sax q=q.sax]))
      [%fork p=*]      =+  ts=~(tap in p.p.p.sax)
                       =^  ran  new-rng  (rads:new-rng (lent ts))
                       =+  new-type=(snag ran ts)
                       :: Note: by assigning a specific type, we may create an evil vase.
                       (fill(rng new-rng) sax(p new-type, q q.sax))
      [%hint p=* q=*]  sax(q q:(fill [p=q.p.sax q=q.sax]))
    ==
  --
++  split-rng
  |=  [rng=_og]
  ^+  [og og]
  =+  bit-size=256
  =^  bits-1  rng  (raws:rng bit-size)
  [~(. og bits-1) ~(. og (raw:rng bit-size))]
++  gen-noun
  |=  [size=@ud rng=_og]
  =+  start-size=size
  ^-  *
  |-
  ^-  noun
  ?:  (lte size 1)
    (rad:rng start-size)  :: leafs should be able to make large atoms.
  =^  ran  rng  (rads:rng 3)
  ?:  =(0 ran) :: 1/3 chance for a leaf.
    (rad:rng start-size)
  ?:  =(1 ran)  :: 1/3 chance for a identical subtrees.
    =+  subtree=$(size (div size 2))
    [subtree subtree]
  =+  [rng-1 rng-2]=(split-rng rng)  :: 1/3 chance for different subtrees.
  :-  $(size (div size 2), rng rng-1)
  $(size (div size 2), rng rng-2)
++  gen-atom
  |*  [a=mold]
  |=  [size=@ud rng=_og]
  ^-  a
  (rad:rng size)
++  gen-list
  |*  a=mold
  |=  give=(give a)
  |=  [size=@ud rng=_og]
  =+  stop=size
  |-
  ^-  (list a)
  =^  ran  rng  (rads:rng stop)
  ?:  =(ran 0)
    ~
  =^  ran  rng  (rads:rng size)
  =+  head=(give size rng)
  =^  ran  rng  (rads:rng size)
  =+  tail=$(stop (div stop 2), rng rng)
  [i=head t=tail]
--