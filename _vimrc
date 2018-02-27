if has("win32") || has("win64")
  if filereadable("C:/Users/gmcwilliams/vimfiles/vimrc")
    set rtp+=C:/Users/gmcwilliams/vimfiles
    source C:/Users/gmcwilliams/vimfiles/vimrc
  "else
  "  runtime vimrc
  endif
else
  if filereadable("/c/Users/gmcwilliams/vimfiles/vimrc")
    set rtp+=/c/Users/gmcwilliams/vimfiles
    source /c/Users/gmcwilliams/vimfiles/vimrc
  "else
  "  runtime vimrc
  endif
endif
