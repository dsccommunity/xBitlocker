function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Identity
    )

    #Load helper module    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    CheckForPreReqs

    $tpm = Get-Tpm
    
    if ($tpm -ne $null)
    {
        $returnValue = @{
            Identity = $Identity
            TpmReady = $tpm.TpmReady
        }
    }

    $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Identity,

        [System.Boolean]
        $AllowClear,

        [System.Boolean]
        $AllowPhysicalPresence,

        [System.Boolean]
        $AllowImmediateReboot = $false
    )

    #Load helper module    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    CheckForPreReqs

    $PSBoundParameters.Remove("Identity") | Out-Null
    $PSBoundParameters.Remove("AllowImmediateReboot") | Out-Null
    
    $tpm = Initialize-Tpm @PSBoundParameters

    if ($tpm -ne $null)
    {
        if ($tpm.RestartRequired -eq $true)
        {
            if ($AllowImmediateReboot -eq $true)
            {
                Write-Verbose "Forcing an immediate reboot of the computer"

                Restart-Computer -Force
            }
            else
            {
                Write-Verbose "Setting DSCMachineStatus to 1"

                $global:DSCMachineStatus = 1
            }
        }
    }
    else
    {
        throw "Failed to initialize TPM"
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Identity,

        [System.Boolean]
        $AllowClear,

        [System.Boolean]
        $AllowPhysicalPresence,

        [System.Boolean]
        $AllowImmediateReboot = $false
    )

    #Load helper module    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    CheckForPreReqs

    $tpm = Get-Tpm

    if ($tpm -eq $null)
    {
        return $false
    }
    else
    {
        return $tpm.TpmReady
    }
}


Export-ModuleMember -Function *-TargetResource



