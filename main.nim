type Foo = ref object
  a: cint

proc createFoo(a: cint): ptr Foo {.exportc.} =
  let foo = Foo.create()
  foo[].a = a
  foo

func getA(foo: ptr Foo): cint {.exportc.} =
  foo[].a

proc destroyFoo(foo: ptr Foo) {.exportc.} =
  foo[].reset()
  foo.dealloc()
