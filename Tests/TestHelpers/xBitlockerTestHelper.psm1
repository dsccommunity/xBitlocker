<#
    .SYNOPSIS
        Checks whether the appropriate features are installed to be able to
        test Bitlocker.
#>
function Test-RequiredFeaturesInstalled
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param()

    $featuresInstalled = $true

    if ((Get-WindowsFeature -Name 'BitLocker').InstallState -ne 'Installed' -or
        (Get-WindowsFeature -Name 'RSAT-Feature-Tools-BitLocker').InstallState -ne 'Installed' -or
        (Get-WindowsFeature -Name 'RSAT-Feature-Tools-BitLocker-RemoteAdminTool').InstallState -ne 'Installed')
    {
        Write-Warning -Message 'One or more of the following Windows Features are not installed: BitLocker, RSAT-Feature-Tools-BitLocker, RSAT-Feature-Tools-BitLocker-RemoteAdminTool. Skipping Integration tests.'
        $featuresInstalled = $false
    }

    return $featuresInstalled
}

<#
    .SYNOPSIS
        Checks whether the system has a TPM chip, and whether it's in a ready
        state.
#>
function Test-HasReadyTpm
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param()

    $hasReadyTpm = $true

    if ($null -eq (Get-Command -Name Get-Tpm -ErrorAction SilentlyContinue) -or !((Get-Tpm).TpmPresent))
    {
        Write-Warning -Message 'No TPM is present on test machine. Skipping MSFT_xBLTpm Integration tests.'
        $hasReadyTpm = $false
    }

    return $hasReadyTpm
}
