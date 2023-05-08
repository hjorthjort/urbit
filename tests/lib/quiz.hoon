/+  quiz, *test
|%
++  test-ud
  ^-  tang
  =+  fate=!>(|=(@ud ^-(? =(+6 (dec +(+6))))))
  (check:quiz fate)
++  test-tas
  :: Check we only generate valid tas when restricted.
  =+  fate=!>(|=(%foo ^-(? =(+6 %foo))))
  (check:quiz fate)
++  test-face
  =+  fate=!>(|=(a=@ ^-(? =(a (dec +(a))))))
  (check:quiz fate)
++  test-cell
  =+  fate=!>(|=([a=@ux b=@ud] ^-(? =(%-(add +6) (add a b)))))
  (check:quiz fate)
++  test-complex :: This works only because we don't implement list generation, so we get the null list.
  =+  fate=!>(|=([a=@ud l=(list @)] ^-(? =(~ l))))
  (check:quiz fate)
++  test-noun
  =+  fate=!>(|=([a=* b=*] ^-(? |(=(a b) ?!(=((sham a) (sham b)))))))
  (check:quiz fate)
++  test-drop
  =+  fate=!>(|=([a=@ud b=@ud] ^-($?(? %drop) ?:((lth a b) %drop =((add b (sub a b)) a)))))
  (check:quiz fate)
++  test-fail
  =+  fate=!>(|=([a=@ud b=@ud] ^-(? =((add a b) a))))  :: This should fail.
  %-  expect  !>(?!(=(~ (check:quiz fate))))
--
