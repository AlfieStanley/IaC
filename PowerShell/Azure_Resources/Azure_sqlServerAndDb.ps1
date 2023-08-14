######################################################################################################################################### 
#  This script will will allow you to check if an azure sql server exist and if not will create one for you along with X amount of DB's #
#                Please not that if you require to login non interactively you may need to amend this script.                           #
#########################################################################################################################################


$resourceGroupName = "<resourceGroupName>"
$location = "<location>"  # You can change this to the desired location
$serverName = "<serverName>"
$adminUsername = "<adminUserName>"
$adminPassword = "<password>"
$databaseNames = @("<dbname") # Add more database names as needed

# Check if the server exists
$existingServer = Get-AzSqlServer -ResourceGroupName $resourceGroupName -ServerName $serverName -ErrorAction SilentlyContinue

if (!$existingServer) {
    # Create an Azure SQL Server
    New-AzSqlServer -ResourceGroupName $resourceGroupName -ServerName $serverName -Location $location -SqlAdministratorCredentials $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $adminUsername, $(ConvertTo-SecureString -String $adminPassword -AsPlainText -Force))
    Write-Host "Azure SQL Server '$serverName' created."
} else {
    Write-Host "Azure SQL Server '$serverName' already exists."
}

foreach ($databaseName in $databaseNames) {
    # Check if the database exists
    $existingDatabase = Get-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $serverName -DatabaseName $databaseName -ErrorAction SilentlyContinue

    if (!$existingDatabase) {
        # Create a database on the Azure SQL Server
        New-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $serverName -DatabaseName $databaseName -RequestedServiceObjectiveName "S0"
        Write-Host "Database '$databaseName' created."
    } else {
        Write-Host "Database '$databaseName' already exists. Skipping creation."
    }
}