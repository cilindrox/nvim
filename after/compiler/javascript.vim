CompilerSet makeprg=eslint\ -f\ compact\ %

" https://vi.stackexchange.com/a/18849
CompilerSet errorformat=
      \%E%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m
      \%W%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m
      \%-G\\s%#,%-G%*\\d\ problem%.%#
