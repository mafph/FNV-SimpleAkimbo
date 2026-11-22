@echo off
setlocal enabledelayedexpansion
REM Im Ordner Data\Meshes\AnimGroupOverride ausfuehren (nach SA_Animationen_umsortieren.bat).
REM *ReloadL.kf         -> SA_ReloadFull\...      (Vollnachladen)
REM *ReloadL_Partial.kf -> SA_ReloadPartial\...   (Taktik, ohne _Partial im Namen)
for %%S in (_1stPerson _Male) do (
  if exist SA_Januusz9mm\%%S\*ReloadL.kf (
    if not exist SA_ReloadFull\%%S mkdir SA_ReloadFull\%%S
    for %%F in (SA_Januusz9mm\%%S\*ReloadL.kf) do move "%%F" "SA_ReloadFull\%%S\%%~nxF"
  )
  if exist SA_Januusz9mm\%%S\*ReloadL_Partial.kf (
    if not exist SA_ReloadPartial\%%S mkdir SA_ReloadPartial\%%S
    for %%F in (SA_Januusz9mm\%%S\*ReloadL_Partial.kf) do (
      set "n=%%~nxF"
      set "n=!n:_Partial=!"
      move "%%F" "SA_ReloadPartial\%%S\!n!"
    )
  )
)
echo Fertig.
pause
