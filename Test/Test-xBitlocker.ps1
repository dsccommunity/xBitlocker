$showVerbose = $true

#Define the parameters that can be passed into individual tests
$blParams1 = @{
    MountPoint = "C:"
    PrimaryProtector = "RecoveryPasswordProtector"
    StartupKeyProtector = $true
    StartupKeyPath = "A:"
    RecoveryPasswordProtector = $true
    AllowImmediateReboot = $false
    UsedSpaceOnly = $true
}

$autoBlParams1 = @{
    DriveType = "Fixed"
    MinDiskCapacityGB = 20
    PrimaryProtector = "RecoveryPasswordProtector"
    RecoveryPasswordProtector = $true
    UsedSpaceOnly = $true
}

#Compares two values and reports whether they are the same or not
function CheckSetting($testName, $expectedValue, $actualValue)
{
    if ($expectedValue -ne $actualValue)
    {
        Write-Host -ForegroundColor Red "Test: '$($testName)'. Result: Fail. Expected value: '$($expectedValue)'. Actual value: '$($actualValue)'."
    }
    else
    {
        if ($showValidSettings -eq $true)
        {
            Write-Host -ForegroundColor Green "Test: '$($testName)'. Result: Pass. Value: '$($expectedValue)'."
        }
    }
}

#Actually runs the specified test
function RunTest
{
    param([string]$TestName, [string[]]$ModulesToImport, [Hashtable]$Parameters)

    #Load Required Modules
    foreach ($module in $ModulesToImport)
    {
        $modulePath = "..\DSCResources\$($module)\$($module).psm1"
        Import-Module $modulePath
    }

    if ($showVerbose -eq $true)
    {
        Set-TargetResource @Parameters -Verbose

        $getResult = Get-TargetResource @Parameters -Verbose
        checkSetting -testName "$($TestName): Get" -expectedValue $true -actualValue ($getResult -ne $null)

        $testResult = Test-TargetResource @Parameters -Verbose
        checkSetting -testName "$($TestName): Test" -expectedValue $true -actualValue $testResult
    }
    else
    {
        #Set-TargetResource @Parameters

        $getResult = Get-TargetResource @Parameters
        checkSetting -testName "$($TestName): Get" -expectedValue $true -actualValue ($getResult -ne $null)

        $testResult = Test-TargetResource @Parameters
        checkSetting -testName "$($TestName): Test" -expectedValue $true -actualValue $testResult
    }

    #Unload Required Modules
    foreach ($module in $ModulesToImport)
    {
        Remove-Module $module
    }
}

#Runs any tests that match the filter
function RunTests
{
    param([string]$Filter)

    if ("TestBitlocker" -like $Filter)
    {
        RunTest -TestName "TestBitlocker1" -ModulesToImport "MSFT_xBitlocker" -Parameters $blParams1
    }

    if ("TestAutoBitlocker" -like $Filter)
    {
        RunTest -TestName "TestAutoBitlocker1" -ModulesToImport "MSFT_xAutoBitlocker" -Parameters $autoBlParams1
    }
}

RunTests -Filter "TestAutoBitlocker*"
