::
/?    314
/-    tree-include
/=    dat    /%  /tree-json/ :: default include
/=    tub    /$  |=([bem=beam *] (flop s.bem))
/=    aut    /;  |=(gas=epic (~(has ju aut.ced.gas) %$ (scot %p p.bem.gas)))
             /$    fuel
::
!:
::::
  ::
;html
  ;head
    ;title: Tree
    ;meta(name "viewport", content "width=device-width, initial-scale=1");
    ;link(type "text/css", rel "stylesheet", href "//cdnjs.cloudflare.com/ajax/libs/codemirror/4.3.0/codemirror.min.css");
    ;link(type "text/css", rel "stylesheet", href "/lib/css/fonts.css");
    ;link(type "text/css", rel "stylesheet", href "/lib/css/bootstrap.css");
    ;link(type "text/css", rel "stylesheet", href "/lib/css/codemirror.css");
    ::;link(type "text/css", rel "stylesheet", href "http://localhost:8000/docs/pub/tree/main.css");
    ;link(type "application/rss+xml", rel "alternate", href "/{(spud tub)}.rss-xml");
    ;script(type "text/javascript", src "//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js");
    ;script(type "text/javascript", src "//cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.min.js");
    ;script(type "text/javascript", src "//cdnjs.cloudflare.com/ajax/libs/react/0.14.6/react.js");
    ;script(type "text/javascript", src "//cdnjs.cloudflare.com/ajax/libs/react/0.14.6/react-dom.js");
    ;script(type "text/javascript", src "//cdnjs.cloudflare.com/ajax/libs/flux/2.1.1/Flux.js");
    ;script(type "text/javascript", src "//cdnjs.cloudflare.com/ajax/libs/codemirror/4.3.0/codemirror.js");
    ;script(type "text/javascript", src "/lib/js/urb.js");
    ;script(type "text/javascript", src "/lib/js/hoon.js");
    ;script(type "text/javascript", src "/tree/main.js");
    ;script(type "text/javascript", src "//cdnjs.cloudflare.com/ajax/libs/".
      "codemirror/4.3.0/mode/markdown/markdown.min.js");
    ;*  ?.  aut  ~
        [;script(type "text/javascript", src "/~/as/own/~/at/lib/js/urb.js");]~
  ==
  ;body
    ;script(type "text/javascript"): window.tree = {(pojo (joba %data dat))}
    ;div#nav;
    ;div#cont;
    ;div.container.nav
      ;div.row
        ;div.col-md-2.ctrl#nav;
      ==
    ==
    ;div.container#container
      ;div.row
        ;div.col-md-10.col-md-offset-2.body#cont;
  ==  ==
==  ==
