@echo off
echo @echo off>%2.bat
echo set inp=e>>%2.bat
set v=%%
	FOR /F "delims=; tokens=1,2,3,4,5" %%a in (%1) do (
		if %%a == out (
			echo echo %%b>>%2.bat
		) else if %%a == label (
			echo :%%b>>%2.bat
		) else if %%a == ask (
			echo set /p inp=Input: >>%2.bat
		) else if %%a == is (
			echo if %v%inp%v% == %%b goto %%c>>%2.bat
		) else if %%a == g (
			echo goto %%b>>%2.bat
		)

	)
)
%2.bat