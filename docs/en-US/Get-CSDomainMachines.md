---
external help file: PSCrowdstrike-help.xml
Module Name: PSCrowdstrike
online version:
schema: 2.0.0
---

# Get-CSDomainMachines

## SYNOPSIS
Function to retrieve host info from Crowdstrike via /devices/queries/devices/v1 and
/devices/entities/devices/v1 endpoint.

## SYNTAX

```
Get-CSDomainMachines [-Domain] <String> [<CommonParameters>]
```

## DESCRIPTION
This function provides a way to retrieve using common parameters required by PSCrowdstrike.

## EXAMPLES

### EXAMPLE 1
```
Get-CSDomainMachines -Domain "domain.local"
```

Retrieves all AgentID's in Crowdstrike for Servers in domain.local

## PARAMETERS

### -Domain
The hostname you would like to query.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### None
## NOTES
None

## RELATED LINKS
