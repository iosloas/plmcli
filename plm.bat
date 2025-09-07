@echo off
REM plm.bat - PLM command script

SET PLM_VERSION=PLM ver 1.0

REM Existing commands
SET COMMANDS=plugin-connect

REM Get the directory of this script
SET SCRIPT_DIR=%~dp0

REM If no arguments are provided
IF "%~1"=="" (
    ECHO %PLM_VERSION%
    ECHO Available commands:
    FOR %%c IN (%COMMANDS%) DO (
        ECHO  - %%c
    )
    EXIT /B 0
)

REM Handle commands
IF /I "%~1"=="plugin-connect" (
    IF EXIST "%SCRIPT_DIR%plugin-connect.bat" (
        CALL "%SCRIPT_DIR%plugin-connect.bat" %*:2
    ) ELSE (
        ECHO Error: plugin-connect.bat not found in %SCRIPT_DIR%
    )
    EXIT /B 0
)

REM Unknown command fallback
ECHO Unknown command: %~1
ECHO Use 'plm' with no arguments to see available commands.
EXIT /B 1
