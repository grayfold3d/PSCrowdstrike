function Get-CSDomainMachines {
    <#
    .SYNOPSIS
        Function to retrieve AgentID's for an Active Directory domain from Crowdstrike
        via /devices/queries/devices-scroll/v1.
    .DESCRIPTION
        This function provides a way to retrieve Agent IDs from Crowdstrike.
    .EXAMPLE
        PS C:\> Get-CSDomainMachines -Domain "domain.local"
        Retrieves all AgentID's in Crowdstrike for domain.local
    .INPUTS
        None
    .PARAMETER Domain
        The Active Directory Domain you would like to query.
    .OUTPUTS
        None
    .NOTES
        None
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $Domain,

        [Parameter(Mandatory = $true)]
        [ValidateSet(
            "Server",
            "Workstation"
            )]
        [string]
        $Type
    )

    begin {
        $DeviceEndpoint = "/devices/queries/devices-scroll/v1?limit=5000&filter=machine_domain%3A%27$domain%27%2Cproduct_type_desc%3A%$type%27"
    }

    process {
        (Invoke-CSRestMethod -Endpoint $DeviceEndpoint -Method "GET").Resources
    }

    end {

    }
}
