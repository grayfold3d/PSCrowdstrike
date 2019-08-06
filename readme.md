# PSCrowdstrike

A PowerShell wrapper around Crowdstrike API.

## Overview

This is a PowerShell Module that functions as an API wrapper around Crowdstrike's API, which
is based on OAuth2.

## Installation

```powershell
Install-Module -Name PSCrowdstrike -Scope CurrentUser -Repository PSGallery
```

## Examples

```powershell
## This retrieves a token using ClientID 12345 and ClientSecret 54321
Get-CSToken -ClientID "12345" -ClientSecret "54321"

## Retrieves host information (OS, OU, Domain, etc) for DC1.
Get-CSDeviceDetails -Hostname "DC1"

## Retrieves AgentID's for Active Directory domain 'domain.local'.
Get-CSDomainMachines -Domain "domain.local"
```
