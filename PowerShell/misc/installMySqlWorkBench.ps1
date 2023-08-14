###################################################################################################################
#              This script will will download an instll My Sql Workbench on your local pc/server                  #                                                                                                                                        #
###################################################################################################################


# Check if MySQL Workbench is already installed
$workbenchInstalled = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like '*MySQL Workbench*' }

if (!$workbenchInstalled) {
    # URL to download MySQL Workbench installer
    $installerUrl = "https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-8.0.26-winx64.msi"

    # Download MySQL Workbench installer
    $installerPath = "$env:TEMP\mysql-workbench.msi"
    Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

    # Install MySQL Workbench
    Start-Process -FilePath msiexec -ArgumentList "/i `"$installerPath`" /qn" -Wait

    Write-Host "MySQL Workbench installed successfully."
} else {
    Write-Host "MySQL Workbench is already installed."
}