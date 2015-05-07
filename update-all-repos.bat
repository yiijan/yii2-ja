@echo off

rem
rem updates all the local and the "origin" repos with the corresponding "upstream" repo
rem argument %1 : repository list file. defaults to "repo-list.txt"
rem

set listfile=%1
if "%listfile%" == "" (
  set listfile=.\repo-list.txt
)

for /F %%a in (%listfile%) do call .\update-repo.bat %%a

echo;
