function Get-CSDeviceDetails {
    <#
    .SYNOPSIS
        Function to retrieve host info from Crowdstrike via /devices/queries/devices/v1 and
        /devices/entities/devices/v1 endpoint.
    .DESCRIPTION
        This function provides a way to retrieve host information from Crowdstrike.
    .EXAMPLE
        PS C:\> Get-CSDeviceDetails -Computername "DC1"
        Retrieves host information (OS, OU, Domain, etc) for DC1 from Crowdstrike API.
    .INPUTS
        None
    .PARAMETER Hostname
        The hostname you would like to query.
    .OUTPUTS
        None
    .NOTES
        Use this function to retrieve host information from Crowdstrike.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $HostName
    )

    begin {
        $DeviceEndpoint = "/devices/queries/devices-scroll/v1?limit=5000&filter=hostname%3A%27$hostname%27"
    }

    process {
        $AgentID = (Invoke-CSRestMethod -Endpoint $DeviceEndpoint -Method "GET").Resources

        Get-CSAgentIDDetail -AgentID $AgentID
    }

    end {

    }
}
