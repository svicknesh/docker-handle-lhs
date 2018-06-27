rem Append to CP %*
rem %*
rem Copyright 1999-2004 The Apache Software Foundation
rem 
rem Licensed under the Apache License, Version 2.0 (the "License");
rem you may not use this file except in compliance with 
rem the License.
rem You may obtain a copy of the License at
rem 
rem http://www.apache.org/licenses/LICENSE-2.0
rem 
rem Unless required by applicable law or agreed to in writing, 
rem software distributed under the License is distributed on an 
rem "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS 
rem OF ANY KIND, either express or implied.
rem See the License for the specific language governing 
rem permissions and limitations under the License.
rem
rem ---------------------

rem Process the first argument
if ""%1"" == """" goto end
set CP=%CP%;%1
shift

rem Process the remaining arguments
:setArgs
if ""%1"" == """" goto doneSetArgs
set CP=%CP% %1
shift
goto setArgs
:doneSetArgs
:end 
