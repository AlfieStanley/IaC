###################################################################################################################
#  This script will will allow you to check if an azure storage account exist and if not will create one for you. #
#        Please not that if you require to login non interactively you may need to amend this script.             #                                                                                                                                        #
###################################################################################################################

$resourceGroupName = "<resourceGroupName>"
$storageAccountName = "<storageAccountName>"
$location = "<location>"  # You can change this to the desired location

$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -ErrorAction SilentlyContinue

# Note that this will create a "Standard_LRS, StorageV2" account, if you require different please amned "SkuName" and "Kind" values below.  
if (!$storageAccount) {
    New-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -Location $location -SkuName Standard_LRS -Kind StorageV2
    Write-Host "Storage account '$storageAccountName' created."
} else {
    Write-Host "Storage account '$storageAccountName' already exists."
}