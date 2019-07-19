---
external help file: PSCrowdstrike-help.xml
Module Name: PSCrowdstrike
online version:
schema: 2.0.0
---

# Get-CSToken

## SYNOPSIS
Get token from Crowdstrike.

## SYNTAX

```
Get-CSToken [-ClientID] <String> [-ClientSecret] <String> [<CommonParameters>]
```

## DESCRIPTION
This function obtains and stores the token using PSFramework.

## EXAMPLES

### EXAMPLE 1
```
Get-CSToken -ClientID "12345" -ClientSecret "54321"
```

This retreives a token using ClientID 12345 and ClientSecret 54321

## PARAMETERS

### -ClientID
ClientID from Crowdstrike

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

### -ClientSecret
Secret from Crowdstrike

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
This function retreives the token from Crowdstrike and stores the token in PSFramework for later use, along
with the ClientID and ClientSecret.

## RELATED LINKS
