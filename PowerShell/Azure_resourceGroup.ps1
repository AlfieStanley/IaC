##################################################################################################################
#  This script will will allow you to check if an azure resource group exist and if not will create one for you. #
#        Please not that if you require to login non interactively you may need to amend this script.           #                                                                                                                                        #
##################################################################################################################

$resourceGroupName = "<resourceGroupName>"
$location = "<location>"  # You can change this to the desired location

# Check if the resource group exists
$existingResourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue

if (!$existingResourceGroup) {
    # Create the resource group
    New-AzResourceGroup -Name $resourceGroupName -Location $location
    Write-Host "Resource group '$resourceGroupName' created."
} else {
    Write-Host "Resource group '$resourceGroupName' already exists."
}