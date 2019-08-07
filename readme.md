# PSCrowdstrike

A PowerShell wrapper around Crowdstrike API.

## Overview

[![Build Status](https://dev.azure.com/jwmoss/PSCrowdstrike/_apis/build/status/jwmoss.PSCrowdstrike?branchName=master)](https://dev.azure.com/jwmoss/PSCrowdstrike/_build/latest?definitionId=1&branchName=master)
[![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/PSCrowdstrike.svg)](https://www.powershellgallery.com/packages/PSCrowdstrike)
[![PowerShell Gallery Downloads](https://img.shields.io/powershellgallery/dt/PSCrowdstrike.svg)](https://www.powershellgallery.com/packages/PSCrowdstrike)

This is a PowerShell Module that functions as an API wrapper around Crowdstrike's API, which
is based on OAuth2.

Please open a [Pull Request](https://github.com/jwmoss/PSCrowdstrike/blob/master/.github/PULL_REQUEST_TEMPLATE.md) if you desire any new features or create an [Issue](https://github.com/jwmoss/PSCrowdstrike/blob/master/.github/ISSUE_TEMPLATE.md) if you come across a bug.

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
