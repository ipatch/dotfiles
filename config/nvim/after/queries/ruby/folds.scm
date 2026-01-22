;; extends
;; NOTE: ipatch, https://github.com/nvim-treesitter/nvim-treesitter/issues/999
;; NOTE: ipatch, https://github.com/kevinhwang92/nvim-ufo/issues/139

;; NOTE: ipatch, https://gist.github.com/lestoni/8c74da455cce3d36eb68
;; `zf#j` # = num of lines to fold equals life🛟

; TODO: ipatch scaffold out query for below syntax,
; ----------------------------
; # Create symlink for glue (6.10+ cmake expects it at prefix/glue)
; unless (prefix/"glue").exist?
;   cd prefix do
;     system "ln", "-sf", "share/PySide6/glue", "glue"
;   end
; end

[
 (array)
 (string_array)
] @fold

; NOTE: ipatch below query is able to fold sig blocks contained in files like homebrew's install.rb
(
 (method
   name: (identifier) @fold
   body: (block)
  ) 
)

; NOWORK!
; (call
;   method: (identifier) @method (#eq? @method "sig")
;   block: (block) @fold)
