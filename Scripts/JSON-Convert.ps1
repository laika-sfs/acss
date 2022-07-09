$fileList = Get-ChildItem -Path '..\Custom Solar Systems' -Filter *.txt -Recurse

ForEach ($file in $fileList) {
    $newName = $file.Name -replace '.txt', '.json'
    Rename-Item -Path $file.FullName -NewName $newName
}