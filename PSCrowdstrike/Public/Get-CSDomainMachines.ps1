function Get-CSDomainMachines {
    <#
    .SYNOPSIS
        Function to retrieve host info from Crowdstrike via /devices/queries/devices/v1 and
        /devices/entities/devices/v1 endpoint.
    .DESCRIPTION
        This function provides a way to retrieve using common parameters required by PSCrowdstrike.
    .EXAMPLE
        PS C:\> Get-CSDomainMachines -Domain "domain.local"
        Retrieves all AgentID's in Crowdstrike for Servers in domain.local
    .INPUTS
        None
    .PARAMETER Domain
        The hostname you would like to query.
    .OUTPUTS
        None
    .NOTES
        None
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $Domain
    )

    begin {
        $DeviceEndpoint = "/devices/queries/devices/v1?filter=machine_domain%3A%27$domain%27"
    }

    process {
        (Invoke-CSRestMethod -Endpoint $DeviceEndpoint -Method "GET").Resources
    }

    end {

    }
}
