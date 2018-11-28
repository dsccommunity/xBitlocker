# xBitlocker

The **xBitlocker** module is a part of the Windows PowerShell Desired State
Configuration (DSC) Resource Kit, which is a collection of DSC Resources
produced by the PowerShell Team.
This module contains the **xBLAutoBitlocker, xBLBitlocker, xBLTpm** resources.
This DSC Module allows you to configure Bitlocker on a single disk, configure a
TPM chip, or automatically enable Bitlocker on multiple disks.

This project has adopted the
[Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/)
. For more information see the
[Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any
additional questions or comments.

## Branches

### master

[![Build status](https://ci.appveyor.com/api/projects/status/wi5i60tojfd7056b/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xBitlocker/branch/master)
[![codecov](https://codecov.io/gh/PowerShell/xBitlocker/branch/master/graph/badge.svg)](https://codecov.io/gh/PowerShell/xBitlocker/branch/master)

This is the branch containing the latest release -
no contributions should be made directly to this branch.

### dev

[![Build status](https://ci.appveyor.com/api/projects/status/wi5i60tojfd7056b/branch/dev?svg=true)](https://ci.appveyor.com/project/PowerShell/xBitlocker/branch/dev)
[![codecov](https://codecov.io/gh/PowerShell/xBitlocker/branch/dev/graph/badge.svg)](https://codecov.io/gh/PowerShell/xBitlocker/branch/dev)

This is the development branch
to which contributions should be proposed by contributors as pull requests.
This development branch will periodically be merged to the master branch,
and be released to [PowerShell Gallery](https://www.powershellgallery.com/).

## Contributing

Please check out common DSC Resources
[contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).

## Installation

To install **xBitlocker** module

* Unzip the content under $env:ProgramFiles\WindowsPowerShell\Modules folder

To confirm installation:

* Run **Get-DSCResource** to see that **xBLAutoBitlocker**, **xBLBitlocker**,
  **xBLTpm** are among the DSC Resources listed.

## Requirements

This module requires that both the **Bitlocker** and
**RSAT-Feature-Tools-Bitlocker** features are installed.
It also requires the latest version of PowerShell (v4.0, which ships in Windows
8.1 or Windows Server 2012R2).
To easily use PowerShell 4.0 on older operating systems,
[Install WMF 4.0](http://www.microsoft.com/en-us/download/details.aspx?id=40855)
. Please read the installation instructions that are present on both the
download page and the release notes for WMF 4.0.

## Description

The **xBitlocker** module contains the **xBLAutoBitlocker, xBLBitlocker,
xBLTpm** DSC Resources.
This DSC Module allows you to configure Bitlocker on a single disk, configure a
TPM chip, or automatically enable Bitlocker on multiple disks.

## Resources

**xBLAutoBitlocker** is used to automatically enable Bitlocker on drives of
type Fixed or Removable.
It does not work on Operating System drives.
**xBLAutoBitlocker** has the following properties.
Where no description is listed, properties correspond directly to
[Enable-Bitlocker](https://docs.microsoft.com/en-us/powershell/module/bitlocker/enable-bitlocker)
parameters.

* DriveType: The type of volume to auto apply Bitlocker to. Valid values are
  "Fixed" or "Removable"
* PrimaryProtector: The primary protector type to be used for AutoBitlocker.
  Valid values are: "AdAccountOrGroupProtector", "PasswordProtector", "Pin",
  "RecoveryKeyProtector", "RecoveryPasswordProtector", "StartupKeyProtector",
  or "TpmProtector"
* MinDiskCapacityGB: If specified, only disks this size or greater will auto
  apply Bitlocker
* AutoUnlock: Whether volumes should be enabled for auto unlock using
  Enable-BitlockerAutoUnlock
* AdAccountOrGroup
* AdAccountOrGroupProtector
* EncryptionMethod
* HardwareEncryption
* Password
* PasswordProtector
* Pin
* RecoveryKeyPath
* RecoveryKeyProtector
* RecoveryPasswordProtector
* Service
* SkipHardwareTest
* StartupKeyPath
* StartupKeyProtector
* TpmProtector
* UsedSpaceOnly

**xBLBitlocker** has the following properties.
Where no description is listed, properties correspond directly to
[Enable-Bitlocker](https://docs.microsoft.com/en-us/powershell/module/bitlocker/enable-bitlocker)
parameters.

* MountPoint: The MountPoint name as reported in Get-BitLockerVolume
* PrimaryProtector: The primary protector type to be used for AutoBitlocker.
  Valid values are: "AdAccountOrGroupProtector", "PasswordProtector", "Pin",
  "RecoveryKeyProtector", "RecoveryPasswordProtector", "StartupKeyProtector",
  or "TpmProtector"
* AutoUnlock: Whether volumes should be enabled for auto unlock using
  Enable-BitlockerAutoUnlock
* AllowImmediateReboot: Whether the computer can be immediately rebooted after
  enabling Bitlocker on an OS drive.
  Defaults to false.

* AdAccountOrGroup
* AdAccountOrGroupProtector
* EncryptionMethod
* HardwareEncryption
* Password
* PasswordProtector
* Pin
* RecoveryKeyPath
* RecoveryKeyProtector
* RecoveryPasswordProtector
* Service
* SkipHardwareTest
* StartupKeyPath
* StartupKeyProtector
* TpmProtector
* UsedSpaceOnly

**xBLTpm** is used to initialize a TPM chip using
[Initialize-TPM](https://docs.microsoft.com/en-us/powershell/module/trustedplatformmodule/initialize-tpm)
.
**xBLTpm** has the following properties.

* Identity: A required string value which is used as a Key for the resource.
  The value does not matter, as long as its not empty.
* AllowClear: Indicates that the provisioning process clears the TPM, if
  necessary, to move the TPM closer to complying with Windows Server 2012
  standards.
* AllowPhysicalPresence: Indicates that the provisioning process may send
  physical presence commands that require a user to be present in order to
  continue.
* AllowImmediateReboot: Whether the computer can rebooted immediately after
  initializing the TPM.

## Examples

### [ConfigureBitlockerOnOSDrive](Examples/ConfigureBitlockerOnOSDrive)

 This example enables Bitlocker on an Operating System drive.
The example code for ConfigureBitlockerOnOSDrive is located in
[`ConfigureBitlockerOnOSDrive.ps1`](Examples/ConfigureBitlockerOnOSDrive/ConfigureBitlockerOnOSDrive.ps1)
.

### [ConfigureBitlockerAndAutoBitlocker](Examples/ConfigureBitlockerAndAutoBitlocker)

Enables Bitlocker on an Operating System drive, and automatically enables
Bitlocker on all drives of type 'Fixed'. The example code for
ConfigureBitlockerAndAutoBitlocker is located in
[`ConfigureBitlockerAndAutoBitlocker.ps1`](Examples/ConfigureBitlockerAndAutoBitlocker/ConfigureBitlockerAndAutoBitlocker.ps1)
.
