if has("win32") || has("win64")
  if filereadable("E:/Users/gmcwilliams/home/vimfiles/vimrc")
    set rtp+=E:/Users/gmcwilliams/home/vimfiles
    source E:/Users/gmcwilliams/home/vimfiles/vimrc
  "else
  "  runtime vimrc
  endif
else
  if filereadable("/e/Users/gmcwilliams/home/vimfiles/vimrc")
    set rtp+=/e/Users/gmcwilliams/home/vimfiles
    source /e/Users/gmcwilliams/home/vimfiles/vimrc
  "else
  "  runtime vimrc
  endif
endif
