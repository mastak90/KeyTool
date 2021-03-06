@echo off

@set ANDROID_HOME=C:\Android\Sdk
@set PLATFORM=%ANDROID_HOME%\platforms\android-10
@set JAVA_HOME=D:\Program Files\Java\jdk1.7.0_67

call :MyMkDir build/obj

@echo src/*.java --^> build/obj/*.class
javac ^
    -J-Duser.language=en ^
    -source 1.7 -target 1.7 ^
    -sourcepath src ^
    -bootclasspath "%PLATFORM%/android.jar" ^
    -d build/obj ^
    @javalist.txt ^
    2>&1 | d:\cygwin\bin\tee z-javac-log.txt

@rem wzeditor.exe z-javac-log.txt

pause
exit


:MyMkDir
if not exist "%1" (
	mkdir "%1"
)
exit /b

