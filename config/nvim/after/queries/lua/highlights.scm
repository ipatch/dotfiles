; foooooo
; (comment) @comment
;
; ;; match TODO and NOTE within comment content
; ((comment) @comment
;            (#match? @comment "TODO:")
;            (#set! @comment @label))
;
; ((comment) @comment
;            (#match? @comment "NOTE:")
;            (#set! @comment @label))
; [
;  (comment) @label (#match? @label "(TODO|NOTE):")
; ]
