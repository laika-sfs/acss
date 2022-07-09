$fileList = Get-ChildItem -Path '..\Custom Solar Systems' -Filter *.json -Recurse

ForEach ($file in $fileList) {
    $newName = $file.Name -replace '.json', '.txt'
    Rename-Item -Path $file.FullName -NewName $newName
}