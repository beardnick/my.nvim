; todo comment
((comment) @function
(#match? @function "todo.*")
)

; other note comment
((comment) @function
(#match? @function "[ ]+[#@].*")
)
