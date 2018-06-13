

@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
moduleVersion = '1.2.0.0'

# ID used to uniquely identify this module
GUID = 'dc4f3fd0-4e1d-4916-84f8-d0bb89d52507'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = '(c) 2018 Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'This DSC Module allows you to configure Bitlocker on a single disk, configure a TPM chip, or automatically enable Bitlocker on multiple disks.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
CLRVersion = '4.0'

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module
FunctionsToExport = '*'

# Cmdlets to export from this module
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module
AliasesToExport = '*'

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('DesiredStateConfiguration', 'DSC', 'DSCResourceKit', 'DSCResource')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/PowerShell/xBitlocker/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/PowerShell/xBitlocker'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Converted appveyor.yml to install Pester from PSGallery instead of from Chocolatey.
* Added Codecov support.
* Updated appveyor.yml to use the one in template.
* Added folders for future unit and integration tests.
* Added Visual Studio Code formatting settings.
* Added .gitignore file.
* Added markdown lint rules.
* Fixed encoding on README.md.
* Added `PowerShellVersion = "4.0"`, and updated copyright information, in the
  module manifest.
* Fixed issue which caused Test to incorrectly succeed on fully decrypted volumes when correct Key Protectors were present ([issue 13](https://github.com/PowerShell/xBitlocker/issues/13))
* Fixed issue which caused xBLAutoBitlocker to incorrectly detect Fixed vs Removable volumes. ([issue 11](https://github.com/PowerShell/xBitlocker/issues/11))
* Fixed issue which made xBLAutoBitlocker unable to encrypt volumes with drive letters assigned. ([issue 10](https://github.com/PowerShell/xBitlocker/issues/10))
* Fixed an issue in CheckForPreReqs function where on Server Core the installation of the non existing Windows Feature "RSAT-Feature-Tools-BitLocker-RemoteAdminTool" was erroneously checked. ([issue 8](https://github.com/PowerShell/xBitlocker/issues/8))


'

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}



