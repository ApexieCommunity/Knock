@echo off
TITLE Knock PHAR Building for local testing
xcopy /s /y /i src build\src
xcopy /s /y /i resources build\resources
xcopy /y plugin.yml build\plugin.yml
php -dphar.readonly=0 PocketMine-DevTools.phar --make build\ --out Knock.phar
php DEVirion.phar install .poggit.yml knockbackffa virions --replace
for /f %%f in ('dir /b virions') do php -dphar.readonly=0 virions\%%f Knock.phar