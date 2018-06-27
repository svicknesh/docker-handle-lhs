@echo off

SET PRG=%~dp0%

SET CP=.

REM Get the full name of the directory where the Handle code is installed
SET HDLHOME=%PRG%..

REM add all the jar files in the lib directory to the classpath
FOR /R "%HDLHOME%\lib\" %%i IN ("*.*") DO CALL "%HDLHOME%\bin\cpappend.bat" %%i

set CMD=%1
shift

set ARGS=
:args-loop
if "%~1"=="" goto :switch-case
set ARGS=%ARGS% %1
shift
goto :args-loop

:switch-case
  :: Call and mask out invalid call targets
  goto :switch-case-%CMD% 2>nul || (
    :: Default case
    echo Unknown Handle.Net server command %CMD%
  )
  goto :switch-case-end

  :switch-case-server
    rem this is the server startup; memory configuration can be edited here
    java -Xmx200M -cp "%CP%" net.handle.server.Main %ARGS%
    goto :switch-case-end
  :switch-case-setup-server
    java -cp "%CP%" net.handle.server.SimpleSetup %ARGS%
    goto :switch-case-end
  :switch-case-admintool
    java -cp "%CP%" net.handle.apps.admintool.controller.Main %ARGS%
    goto :switch-case-end
  :switch-case-oldadmintool
    java -cp "%CP%" net.handle.apps.gui.hadmin.HandleTool %ARGS%
    goto :switch-case-end
  :switch-case-keyutil
    java -cp "%CP%" net.handle.apps.tools.KeyUtil %ARGS%
    goto :switch-case-end
  :switch-case-keygen
    java -cp "%CP%" net.handle.apps.tools.KeyGenerator %ARGS%
    goto :switch-case-end
  :switch-case-qresolverGUI
    java -cp "%CP%" net.handle.apps.gui.resolver.Main %ARGS%
    goto :switch-case-end
  :switch-case-qresolver
    java -cp "%CP%" net.handle.apps.simple.HDLTrace %ARGS%
    goto :switch-case-end
  :switch-case-getrootinfo
    java -cp "%CP%" net.handle.apps.tools.GetRootInfo %ARGS%
    goto :switch-case-end
  :switch-case-getsiteinfo
    java -cp "%CP%" net.handle.apps.tools.GetSiteInfo %ARGS%
    goto :switch-case-end
  :switch-case-genericbatch
    java -cp "%CP%" net.handle.apps.batch.GenericBatch %ARGS%
    goto :switch-case-end
  :switch-case-create
    java -cp "%CP%" net.handle.apps.simple.HDLCreate %ARGS%
    goto :switch-case-end
  :switch-case-delete.bat
    java -cp "%CP%" net.handle.apps.simple.HDLDelete %ARGS%
    goto :switch-case-end
  :switch-case-list
    java -cp "%CP%" net.handle.apps.simple.HDLList %ARGS%
    goto :switch-case-end
  :switch-case-trace
    java -cp "%CP%" net.handle.apps.simple.HDLTrace %ARGS%
    goto :switch-case-end
  :switch-case-home-na
    java -cp "%CP%" net.handle.apps.simple.HomeNA %ARGS%
    goto :switch-case-end
  :switch-case-convert-siteinfo
    java -cp "%CP%" net.handle.apps.simple.SiteInfoConverter %ARGS%
    goto :switch-case-end
  :switch-case-convert-values
    java -cp "%CP%" net.handle.apps.simple.HandleValuesConverter %ARGS%
    goto :switch-case-end
  :switch-case-convert-localinfo
    java -cp "%CP%" net.handle.apps.simple.LocalInfoConverter %ARGS%
    goto :switch-case-end
  :switch-case-convert-key
    java -cp "%CP%" net.handle.apps.simple.KeyConverter %ARGS%
    goto :switch-case-end
  :switch-case-dumpfromprimary
    java -cp "%CP%" net.handle.server.replication.DumpHandles  %ARGS%
    goto :switch-case-end
  :switch-case-jython.bat
    java -cp "%CP%" net.handle.apps.tools.RunJython %ARGS%
    goto :switch-case-end
  :switch-case-dbtool
    java -cp "%CP%" net.handle.apps.db_tool.DBTool %ARGS%
    goto :switch-case-end
  :switch-case-dblist
    java -cp "%CP%" net.handle.apps.db_tool.DBList %ARGS%
    goto :switch-case-end
  :switch-case-bdbje-util
    java -cp "%CP%" net.handle.server.bdbje.BDBJEHandleStorage %ARGS%
    goto :switch-case-end
  :switch-case-dbremove
    java -cp "%CP%" net.handle.apps.db_tool.DBRemove %ARGS%
    goto :switch-case-end
  :switch-case-dbresolve.bat
    java -cp "%CP%" net.handle.apps.db_tool.DBResolve %ARGS%
    goto :switch-case-end
  :switch-case-docheckpoint
    java -cp "%CP%" net.handle.apps.tools.DoCheckpoint %ARGS%
    goto :switch-case-end
  :switch-case-splitserver
    java -cp "%CP%" net.handle.apps.tools.SplitServer %ARGS%
    goto :switch-case-end
  :switch-case-splitrecoverylog
    java -cp "%CP%" net.handle.apps.tools.SplitServer %ARGS%
    goto :switch-case-end
  :switch-case-recoverjdb
    java -cp "%CP%" net.handle.apps.tools.RecoverJDB %ARGS%
    goto :switch-case-end
  :switch-case-recoverbdbje
    java -cp "%CP%" net.handle.apps.tools.RecoverBDBJE %ARGS%
    goto :switch-case-end
  :switch-case-testtool
    java -cp "%CP%" net.handle.apps.test.Test %ARGS%
    goto :switch-case-end
  :switch-case-server-perf-test
    java -cp "%CP%" net.handle.hdllib.Tester %ARGS%
    goto :switch-case-end
  :switch-case-migrate-storage-to-bdbje
    java -cp "%CP%" net.handle.apps.tools.CurrentStorageToBdbjeMigrator %ARGS%
    goto :switch-case-end

:switch-case-end
