@echo off
set OUTPUT_FILE=rpz.local
set OUTPUT_FOLDER=\ProgramData\named
set REDIRECT_IPV4=192.168.3.26
set REDIRECT_IPV6=2404:7a80:b4c0:1300:d267:e5ff:fef0:964
rem rpz_base.localを読み込む
for /f "delims=" %%i in (rpz_base.local) do (
  echo %%i >> %OUTPUT_FILE%
)
rem 280blocker_domain.txtのみ受付可能
for /f "eol=#" %%i in (280blocker_domain.txt user_block_domain.txt) do (
  echo %%i  IN CNAME . >> %OUTPUT_FILE%
)
move /y %OUTPUT_FILE% %OUTPUT_FOLDER%
echo 処理完了
pause