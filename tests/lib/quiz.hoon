/+  quiz, *test
|%
++  check  ~(check quiz `@uv`1 99)
++  test-ud
  =+  fate=!>(|=(@ud ^-(? =(+6 (dec +(+6))))))
  %-  expect  !>((check fate ~ ~))
++  test-tas
  :: Check we only generate valid tas when restricted.
  =+  fate=!>(|=(%foo ^-(? =(+6 %foo))))
  %-  expect  !>((check fate ~ ~))
++  test-face
  =+  fate=!>(|=(a=@ ^-(? =(a (dec +(a))))))
  %-  expect  !>((check fate ~ ~))
++  test-cell
  =+  fate=!>(|=([a=@ux b=@ud] ^-(? =(%-(add +6) (add a b)))))
  %-  expect  !>((check fate ~ ~))
++  test-complex :: This works only because we don't implement list generation, so we get the null list.
  =+  fate=!>(|=([a=@ud l=(list @)] ^-(? =(~ l))))
  %-  expect  !>((check fate ~ ~))
++  test-noun
  =+  fate=!>(|=([a=* b=*] ^-(? |(=(a b) ?!(=((sham a) (sham b)))))))
  %-  expect  !>((check fate ~ ~))
++  test-fork
  =+  fate=!>(|=(a=? |(a ?!(a))))
  %-  expect  !>((check fate ~ ~))
++  test-give
  =+  fate=!>(|=(a=$+(test-type @ud) (lte a 42)))
  =/  give
    |=  [size=@ud rng=_og]
    ^-  vase
    !>
    ?:  (lth size 42)
      (rad:rng size)
    42
  %-  expect  !>((check fate `give ~))
++  test-drop
  =+  fate=!>(|=(@ud ^-($?(? %drop) ?:(=(0 +6) %drop =(+6 +((dec +6)))))))
  %-  expect  !>((check fate ~ ~))
--