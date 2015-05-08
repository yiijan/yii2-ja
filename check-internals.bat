@echo off

rem
rem check the internals-ja translations against the original
rem

set repo=yii2

pushd "..\%repo%"

@echo;
@echo Starting to check %repo% internals ...

call ..\yii2\build\build.bat translation "docs/internals" "docs/internals-ja" "%repo%-docs-internals-ja-report" > "..\yii2-ja\translation-check\%repo%-internals-ja-report.html"

popd

@echo Checked successfully.
goto exit
:err_exit
@echo Checking failed.
pause
:exit
