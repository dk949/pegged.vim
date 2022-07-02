" Vim syntax file
" Language: Parser Expression Grammars with pegged extensions
" Maintainer: dk949
" Latest Revision: 2022-07-02

if exists("b:current_syntax")
  finish
endif
                                                                                                    " give peggedGrammarName highest priority
syn match   peggedGrammarName       /^[ \t]*[a-zA-Z_][a-zA-Z_0-9]*:/ nextgroup=peggedRuleIdentifier containedin=ALL
syn match   peggedRuleIdentifier    /^[ \t]*[a-zA-Z_][a-zA-Z_0-9]*/ skipwhite nextgroup=peggedSeperator

syn match   peggedSeperator         "<-" skipwhite contained nextgroup=peggedExpression
syn match   peggedSeperator         "<\~" skipwhite contained nextgroup=peggedExpression
syn match   peggedSeperator         "<^" skipwhite contained nextgroup=peggedExpression
syn match   peggedSeperator         "<:" skipwhite contained nextgroup=peggedExpression
syn match   peggedSeperator         "< " skipwhite contained nextgroup=peggedExpression

syn match   peggedExpression        ".*" contained skipwhite contains=peggedDelimiter,peggedGrouping,peggedKeyword,peggedRange,peggedTerminal,peggedOrderedChoice,peggedNonTerminal,peggedQuantifier
syn region  peggedGrouping          matchgroup=peggedDelimiter start="(" end=")" contained skipwhite keepend contains=peggedExpression display
syn match   peggedKeyword           "[!&^.:]" contained display
syn match   peggedOrderedChoice     "/" contained display
                                    " a rule can continue on a new line wirth / or ( or )
syn match   peggedOrderedChoice     "^[ \t]*/" display nextgroup=peggedExpression
syn match   peggedDelimiter         "^[ \t]*(" display nextgroup=peggedExpression
syn match   peggedDelimiter         "^[ \t]*)" display nextgroup=peggedExpression
syn region  peggedRange             matchgroup=peggedDelimiter start=/\[^/ start=/\[/ end=/\]/ contained skipwhite contains=peggedRangeChars,peggedRangeChars,peggedRangeNumber,peggedRangeNumbers,peggedUnicode display
syn match   peggedRangeNumber       /\d/ contained display
syn match   peggedRangeNumbers      /\d-\d/ contained display
syn match   peggedRangeChar         /[^\d]/ contained display
syn match   peggedRangeChars        /\a-\a/ contained display
                                                                                           " will end at the end of the line, in case hl breaks,
                                                                                           " so it doesn't break the rest of the file
syn region  peggedTerminal          matchgroup=peggedDelimiter start=/"/ end=/"/ end=/"i/ end="$" contained contains=peggedUnicode display
syn region  peggedTerminal          matchgroup=peggedDelimiter start=/'/ end=/'/ end=/'i/ end="$" contained contains=peggedUnicode display
syn match   peggedUnicode           /\\0\d\+/ contained display
syn match   peggedUnicode           /\\x[a-fA-F0-9]\+/ contained display
syn match   peggedUnicode           /\\u[a-fA-F0-9]\+/ contained display
syn match   peggedUnicode           /\\U[a-fA-F0-9]\+/ contained display
syn match   peggedNonTerminal       /\a\+/ contained display
syn match   peggedQuantifier        /[+\*?]/ contained display

syn match   peggedComment           /#.*$/ contains=peggedTodo
syn keyword peggedTodo              TODO FIXME XXX NOTE contained

hi def link peggedGrammarName       Type
hi def link peggedRuleIdentifier    Identifier
hi def link peggedKeyword           Function
hi def link peggedSeperator         Operator
hi def link peggedDelimiter         Delimiter
hi def link peggedOrderedChoice     Conditional
hi def link peggedComment           Comment
hi def link peggedRangeNumber       Number
hi def link peggedRangeNumbers      Number
hi def link peggedRangeChar         Character
hi def link peggedRangeChars        Character
hi def link peggedTerminal          String
hi def link peggedNonTerminal       Identifier
hi def link peggedUnicode           Constant
hi def link peggedQuantifier        Repeat
hi def link peggedTodo              Todo

let b:current_syntax = "pegged"

