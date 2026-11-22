@echo off
setlocal enabledelayedexpansion
REM Im Ordner Data\Meshes\AnimGroupOverride ausfuehren.
REM Verschiebt *Attack*_order_1 nach SA_HandR und *Attack*_order_2 nach SA_HandL, ohne den _order_-Zusatz.
REM Falls links/rechts vertauscht ist: unten HandR und HandL tauschen.
for %%S in (_1stPerson _Male) do (
  if not exist SA_HandR\%%S mkdir SA_HandR\%%S
  if not exist SA_HandL\%%S mkdir SA_HandL\%%S
  for %%F in (SA_Januusz9mm\%%S\*Attack*_order_1.kf) do (
    set "n=%%~nxF"
    set "n=!n:_order_1=!"
    move "%%F" "SA_HandR\%%S\!n!"
  )
  for %%F in (SA_Januusz9mm\%%S\*Attack*_order_2.kf) do (
    set "n=%%~nxF"
    set "n=!n:_order_2=!"
    move "%%F" "SA_HandL\%%S\!n!"
  )
)
echo Fertig.
pause
