If (Test-Path -Path '..\Custom Solar Systems') {
    Remove-Item -Path '..\Custom Solar Systems' -Force -Recurse
}

Copy-Item -Path '..\Custom Solar Systems (JSON)' -Destination '..\Custom Solar Systems' -Filter *.txt -Force -Recurse

$fileList = Get-ChildItem -Path '..\Custom Solar Systems' -Filter *.txt -Recurse

ForEach ($file in $fileList) {
    $newName = $file.Name -replace '.json', '.txt'
    Rename-Item -Path $file.FullName -NewName $newName
}