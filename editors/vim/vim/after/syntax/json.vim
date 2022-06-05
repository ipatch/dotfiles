syntax clear jsonCommentError
syntax match jsonComment "//.*"
syntax match jsonComment "\(/\*\)\|\(\*/\)"
hi def link jsonComment Comment
