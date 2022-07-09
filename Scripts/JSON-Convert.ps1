If (Test-Path -Path '..\Custom Solar Systems (JSON)') {
    Remove-Item -Path '..\Custom Solar Systems (JSON)' -Force -Recurse
}

Copy-Item -Path '..\Custom Solar Systems' -Destination '..\Custom Solar Systems (JSON)' -Filter *.txt -Force -Recurse

$fileList = Get-ChildItem -Path '..\Custom Solar Systems (JSON)' -Filter *.txt -Recurse

ForEach ($file in $fileList) {
    $newName = $file.Name -replace '.txt', '.json'
    Rename-Item -Path $file.FullName -NewName $newName
}