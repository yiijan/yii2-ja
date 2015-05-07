@echo off

rem
rem updates the local and the "origin" repos with the "upstream" repo
rem argument %1 : repository name, e.g. "yii2", "yii2-gii", that should
rem               locate in the sibling directory of "yii2-ja"
rem

set repo=%1
if "%repo%" == "" (
  @echo Specify the repository to update.
  goto err_exit
)
if not exist "..\%repo%\" (
  @echo Repository %repo% doesn't exist.
  goto err_exit
)

@echo;
@echo Starting to update %repo% repositories
@echo -----------------------------------------------------

pushd "..\%repo%"

@echo Checking out master ...
git.exe checkout master
@echo Pulling from upstream/master ...
git.exe pull "upstream" master
@echo Pushing to origin/master ...
git.exe push "origin" master:master

popd

@echo -----------------------------------------------------
@echo Updated successfully.
goto exit
:err_exit
@echo -----------------------------------------------------
@echo Updating failed.
pause
:exit
