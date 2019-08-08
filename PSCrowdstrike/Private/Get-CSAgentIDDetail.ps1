function Get-CSAgentIDDetail {
    <#
    .SYNOPSIS
        Function to retrieve host info using Agent ID from Crowdstrike via /devices/entities/devices/v1 endpoint.
    .DESCRIPTION
        This function provides a way to retrieve host information from Crowdstrike.
    .EXAMPLE
        PS C:\> Get-CSAgentIDDetail -AgentID "123455432151"
        Retrieves host information (OS, OU, Domain, etc) for AgentID 123455432151 from Crowdstrike API.
    .INPUTS
        None
    .PARAMETER AgentID
        The AgentID you would like to use to query.
    .OUTPUTS
        None
    .NOTES
        Use this function to retrieve host information from Crowdstrike.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        $AgentID
    )

    begin {

    }

    process {
        (Invoke-CSRestMethod -Endpoint ("/devices/entities/devices/v1?ids=$AgentID") -Method "GET").Resources
    }

    end {

    }
}
