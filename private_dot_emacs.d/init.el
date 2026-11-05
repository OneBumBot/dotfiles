;; -*- lexical-binding: t; -*-
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; Custom сам не пишет lexical-binding cookie, а Emacs 31 без неё ругается
(unless (file-exists-p custom-file)
  (with-temp-file custom-file
    (insert ";; -*- lexical-binding: t; -*-\n")))
(load custom-file 'noerror)
(load (expand-file-name "config.el" user-emacs-directory))
