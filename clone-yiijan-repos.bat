@echo off

rem
rem  clones yiijan working repositories and sets upstream urls
rem argument %1 : repository list file. defaults to "repo-list.txt"
rem

set listfile=%1
if "%listfile%" == "" (
  set listfile=.\repo-list.txt
)

for /F %%a in (%listfile%) do (
  if not exist "..\%%a\" (
    pushd ".."
    git.exe clone git@github.com:yiijan/%%a.git
    pushd "%%a"
    git.exe remote add upstream git@github.com:yiisoft/%%a.git
    popd
    popd
  )
)

echo;
pause
