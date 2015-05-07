@echo off

rem
rem check the docs-ja translations against the original docs
rem argument %1 : repository name, e.g. "yii2", "yii2-gii", that should
rem               locate in the sibling directory of "yii2-ja"
rem

set repo=%1
if "%repo%" == "" (
  @echo Specify the repository to check the documentation.
  goto err_exit
)
if not exist "..\%repo%\" (
  @echo Repository %repo% doesn't exist.
  goto err_exit
)

pushd "..\%repo%"

@echo;
@echo Starting to check %repo% ...

call ..\yii2\build\build.bat translation "docs/guide" "docs/guide-ja" "%repo%-docs-guide-ja-report" > "..\yii2-ja\translation-check\%repo%-guide-ja-report.html"

popd

@echo Checked successfully.
goto exit
:err_exit
@echo Checking failed.
pause
:exit
