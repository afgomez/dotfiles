if has("gui_macvim")
  let macvim_hig_shift_movement = 1

  " Remove toolbar
  set guioptions-=T

  " Remove scrollbars
  set guioptions+=rRlL
  set guioptions-=rRlL

  " Use console dialogs
  set guioptions+=c

  " Use a pretty font
  set guifont=PragmataPro:h14
end
