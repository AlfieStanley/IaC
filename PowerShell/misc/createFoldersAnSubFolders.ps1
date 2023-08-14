###########################################################################################################################################
#  This script will will allow you to create folders and sub folders on local system and also creat test files within with data pupulated #
#                        Please not that iyou may need to amend this script to suit your needs                                            #
###########################################################################################################################################


# Sample data
$data = @"
name
John
Frank
Tom
"@

# Path to the CSV file
$csvFilePath = "<filePath>"

# Create the main "template" folder
$mainFolderPath = "<folderPath>"
New-Item -Path $mainFolderPath -ItemType Directory -Force

# CSV file containing the names
$names = Import-Csv -Path $csvFilePath | Select-Object -ExpandProperty name

# Create subfolders and text files
$subfolderNames = @("template1", "template2", "template3")

foreach ($subfolderName in $subfolderNames) {
    $subfolderPath = Join-Path -Path $mainFolderPath -ChildPath $subfolderName
    New-Item -Path $subfolderPath -ItemType Directory -Force
    
    foreach ($name in $names) {
        $textFilePath = Join-Path -Path $subfolderPath -ChildPath "$name.txt"
        Set-Content -Path $textFilePath -Value $name
    }
}

Write-Host "Folders and text files created successfully."