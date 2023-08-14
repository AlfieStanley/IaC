##################################################################################################################
#  This script will will allow you to enable soft delete on blobs within a storage account in Azure              #
#     Please not that if you require to login non interactively you may need to amend this script.               #
##################################################################################################################

$resourceGroupName = "<resourceGroupName>"
$storageAccountName = "<storageAccountName>"

# Get the storage account
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName

# Enable soft delete for blobs
Enable-AzStorageContainerDeleteRetentionPolicy -ResourceGroupName $resourceGroupName `
    -StorageAccountName $storageAccountName `
    -RetentionDays 7

$storageAccount | Set-AzStorageAccount
Write-Host "Soft delete for blobs enabled in storage account '$storageAccountName'."