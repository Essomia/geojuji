:: ###########
:: Register aliases for windows "cmd"
:: ###########

:: @link: http://technet.microsoft.com/en-us/library/bb490894.aspx
:: @note: Add this file as a REG_SZ/REG_EXPAND_SZ registry variables
::    in HKEY_CURRENT_USER\Software\Microsoft\Command Processor\AutoRun
::    or HKEY_LOCAL_MACHINE\Software\Microsoft\Command or Processor\AutoRun

@echo off


:: CREATE LINUX COMMANDS LIKE...
:: --------------------------------

DOSKEY alias   = doskey $*
DOSKEY cat     = type $*
DOSKEY clear   = cls
DOSKEY cp      = copy $*
DOSKEY cpr     = xcopy $*
DOSKEY grep    = find $*
DOSKEY history = doskey /history
DOSKEY kill    = taskkill /PID $*
DOSKEY ls      = dir $*
DOSKEY man     = help $*
DOSKEY mv      = move $*
DOSKEY ps      = tasklist $*
DOSKEY pwd     = cd
DOSKEY rm      = del $*
DOSKEY rmr     = deltree $*
DOSKEY sudo    = runas /user:administrator $*

DOSKEY open    = start $*
DOSKEY aliases = notepad %USERPROFILE%\aliases.cmd


:: ALIASES
:: --------------------------------

:: Preferred implementation
DOSKEY ll  = dir /B /ON $*
DOSKEY lal = dir /B /ON /AH $*

:: Program shorcut
DOSKEY subl = "C:\Program Files\Sublime Text 3\subl.exe" $*
