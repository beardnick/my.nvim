"syn match  swaggerComment	 contained "@\(param\|return\|auth\|since\|title\|description\)"
syn match  swaggerComment	 contained "@\S\+"
syn cluster     goCommentGroup      add=swaggerComment
highlight default link swaggerComment Special
