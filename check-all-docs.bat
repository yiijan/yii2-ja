@echo off

rem
rem check all docs-ja translations against the corresponding original docs.
rem argument %1 : repository list file. defaults to "repo-list.txt"
rem

set listfile=%1
if "%listfile%" == "" (
  set listfile=.\repo-list.txt
)

for /F %%a in (%listfile%) do php .\check-docs %%a

echo;
pause
