CompilerSet makeprg=vint\ --style-problem\ --no-color\ -f\ \'{file_path}:{line_number}:{column_number}:{severity}:{description}\ ({policy_name})\'\ %:S

CompilerSet errorformat=
      \%I%f:%l:%c:style_problem:%m,
      \%f:%l:%c:%t%*[^:]:E%n:\ %m,
      \%f:%l:%c:%t%*[^:]:%m
