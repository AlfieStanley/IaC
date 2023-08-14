##############################################################################################################################
#  This script will will allow you to check if an azure storage account containers exist and if not will create one for you. #
#        Please not that if you require to login non interactively you may need to amend this script.                        #                                                                                                                                        #
##############################################################################################################################

$resourceGroupName = "<resourceGroupName>"
$storageAccountName = "<storageAccountName>"
$location = "<location>"  # You can change this to the desired location
$containerNames = @("<name>", "<name>", "<name>")  # Add more container names as needed

# Get the storage account
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName

#This foreach will iterate through the $containerNames varibale specified above
foreach ($containerName in $containerNames) {
    $existingContainer = Get-AzStorageContainer -Context $storageAccount.Context -Name $containerName -ErrorAction SilentlyContinue
    
    if (!$existingContainer) {
        New-AzStorageContainer -Name $containerName -Context $storageAccount.Context
        Write-Host "Container '$containerName' created in storage account '$storageAccountName'."
    } else {
        Write-Host "Container '$containerName' already exists in storage account '$storageAccountName'."
    }
}