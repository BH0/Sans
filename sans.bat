echo "Please complete the URL: https://stackoverflow.com/questionsyourinput to make https://stackoverflow.com/questions/0000/example"
set /p question="Enter URL: "
echo "replacing slashes with dashes for filename %question%"
setlocal enabledelayedexpansion
echo "obtaining HTML data"
set questionDashed=%question:/=-%
curl https://stackoverflow.com/questions/%question% -o %questionDashed%.html :: && notepad %questionDashed%.html
echo %questionDashed%
set jsonValuesFileLocation=%cd%
echo jsonValuesFileLocation=%cd%>.env
echo {"questionDashed": "%questionDashed%", "workingDir": "%cd:\=/%/"} > values.json
echo "stripping excess HTML via sans.exe"
sans.exe
set /p contentType=" Do you want to see [all] file contents as HTML or as Text? [html/txt]"
type %questionDashed%.%contentType%
notepad %questionDashed%.%contentType%