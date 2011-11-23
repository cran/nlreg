.onLoad <- function(libname, pkgname)
{
  version <- as.character("1.2-1 (2011/11/23)")
  psm <- paste("\n   Package \"nlreg\"", version, "\n",
    "   Copyright (C) 2000-2011 R. Bellio & A. R. Brazzale\n\n",
    "This is free software, and you are welcome to redistribute\n",
    "it and/or modify it under the terms of the GNU General\n",
    "Public License published by the Free Software Foundation.\n",
    "Package \"nlreg\" comes with ABSOLUTELY NO WARRANTY.\n\n",
    "type `help(package=\"nlreg\")' for summary information\n")
  packageStartupMessage(psm)
  invisible()
}
