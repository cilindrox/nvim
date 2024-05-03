CompilerSet makeprg=yamllint\ -f\ parsable\ %:S

CompilerSet errorformat=
      \%E%f:%l:%c:\ [error]\ %m,%W%f:%l:%c:\ [warning]\ %m
