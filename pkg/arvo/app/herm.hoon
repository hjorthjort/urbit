::  herm: stand-in for term.c with http interface
::
/-  herm
/+  default-agent, dbug, verb
=,  jael
|%
+$  state-0  [%0 ~]
--
::
=|  state-0
=*  state  -
%+  verb  |
%-  agent:dbug
^-  agent:gall
=>  |%
    ++  request-tube
      |=  [bowl:gall from=mark to=mark next=?]
      ^-  card:agent:gall
      :*  %pass  /tube/[from]/[to]
          %arvo  %c     %warp
          our    q.byk  ~
        ::
          ?:  next
            [%next %c da+now /[from]/[to]]
          [%sing %c da+now /[from]/[to]]
      ==
    ::
    ++  pass-session
      |=  [ses=@tas tas=session-task:dill]
      [%pass /dill/[ses] %arvo %d %shot ses tas]
    --
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
::
++  on-init
  ^-  (quip card:agent:gall _this)
  :_  this
  ::  ensure the tubes we use are in cache
  ::
  :~  (request-tube bowl %blit %json |)
      (request-tube bowl %json %belt |)
      (request-tube bowl %json %herm-task |)
  ==
::
++  on-save   !>([%0 ~])
++  on-load
  |=  old=vase
  ^-  (quip card:agent:gall _this)
  [~ this(state [%0 ~])]
::
++  on-watch
  |=  =path
  ^-  (quip card:agent:gall _this)
  :_  this
  ?>  ?=([%session @ ~] path)
  =*  ses  i.t.path
  :~  ::  subscribe to the requested session
      ::
      ::NOTE  multiple views do not result in multiple subscriptions
      ::      because they go over the same wire/duct
      ::
      (pass-session ses %view ~)
      ::  tell session to refresh, so new client knows what's on screen
      ::TODO  should client be responsible for this?
      ::
      (pass-session ses %hail ~)
  ==
::
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card:agent:gall _this)
  ~|  wire
  ?+  wire  !!
    ::  pass on dill blits for the session
    ::
      [%dill @ ~]
    =*  ses  i.t.wire
    ?.  ?=([%dill %blit *] sign-arvo)
      ~|  [%unexpected-sign [- +<]:sign-arvo]
      !!
    :_  this
    %+  turn  p.sign-arvo
    |=  =blit:dill
    [%give %fact [%session ses ~]~ %blit !>(blit)]
  ::
    ::  ensure the tubes we need remain in cache
    ::
      [%tube @ @ ~]
    =*  from  i.t.wire
    =*  to  i.t.t.wire
    ?.  ?=([%clay %writ *] sign-arvo)
      ~|  [%unexpected-sign [- +<]:sign-arvo]
      !!
    :_  this
    [(request-tube bowl from to &)]~
  ==
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card:agent:gall _this)
  :_  this
  :_  ~
  ?+  mark  ~|([%unexpected-mark mark] !!)
    %belt       (pass-session %$ %belt !<(belt:dill vase))
    %herm-task  (pass-session !<(task:herm vase))
  ==
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ?+  path  ~
      [%x %sessions ~]
    :+  ~  ~
    :-  %json
    !>  ^-  json
    =-  a+(turn ~(tap in -) (lead %s))
    .^((set @tas) %dy /(scot %p our.bowl)//(scot %da now.bowl)/sessions)
  ==
::
++  on-leave  on-leave:def
::
++  on-agent  on-agent:def
++  on-fail   on-fail:def
--
