function Start-CSRTRSession {
    <#
    .SYNOPSIS
        Function to start a CrowdStrike Real Time Response Session via the "/real-time-response/entities/sessions/v1 and 
        /devices/queries/devices-scroll/v1 endpoints.
    .DESCRIPTION
        This function provides a way start a Real Time Response session using Crowdstrike.
    .EXAMPLE
        PS C:\> Start-CSRTRSession -HostName "Desktop-XYZ"
        Starts a Real Time Response Session with the supplied HostName.
    .INPUTS
        None
    .PARAMETER HostName
        The HostName you wish you to establish a session with
    .OUTPUTS
        Response containing the Session ID used for further interactions
    .NOTES
        Use this function to start a RTR session with Crowdstrike.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $HostName
    )

    begin {
        $DeviceEndpoint = "/devices/queries/devices-scroll/v1?limit=5000&filter=hostname%3A%27$hostname%27"
        $RTREndpoint = "/real-time-response/entities/sessions/v1"

    }

    process {
        $AgentID = (Invoke-CSRestMethod -Endpoint $DeviceEndpoint -Method "GET").Resources
        $body = @{
            "device_id"   = "$($AgentID)"
        } | ConvertTo-Json 

        $RTRSession = (Invoke-CSRestMethod -Endpoint $RTREndpoint -Method "POST" -Body $Body).Resources

        Write-Output $RTRSession
    }

    end {

    }
}