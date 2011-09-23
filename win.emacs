(server-start)
(setq dropbox-emacs-path "d:/emacs_home")
(add-to-list 'load-path dropbox-emacs-path)
(require 'myinit)
(setenv "PATH" (concat (getenv "PATH")
                       ";c:\\cygwin\\usr\\local\\bin"
                       ";c:\\cygwin\\bin"))
