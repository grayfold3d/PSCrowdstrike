function Start-CSRTRCommand {
    <#
    .SYNOPSIS
        Function to execute a CrowdStrike Real Time Response Command via the "/real-time-response/entities/admin-command/v1 endpoint.
    .DESCRIPTION
        This function provides a way execute a Real Time Response commands using Crowdstrike.
    .EXAMPLE
        PS C:\> Start-CSRTRCommand -RTRCommand mkdir -RTRCommandString 'mkdir C:\RTR' -RTRSessionID 7cdecb55-ab26-5526-a1ac-dd29ad71b7c0
        Executes the Real Time Response Command and Command String specified using the RTRCommand and RTRCommandString parameters inside session
        indicated in the RTRSessionID. Must have previously established a session with the host using the Start-CSRTRSession function
    .INPUTS
        None
    .PARAMETER RTRCommand
        The base command you wish  to run such as cd,mkdir, runscript, etc 
    .PARAMETER RTRCommandString
        The command string/argumnets for the command
    .PARAMETER RTRSessionID
        The Real Time Response session ID 
    .OUTPUTS
        Response for RTR Commands containing the session_id and cloud_request_id
    .NOTES
        Use this function to start execute RTR Commands with Crowdstrike.
    #>
    [CmdletBinding()]
    param (

        [Parameter(Mandatory = $true)]
        [string]
        $RTRCommand,

        [Parameter(Mandatory = $true)]
        [string]
        $RTRCommandString,

        [Parameter(Mandatory = $true)]
        [string]
        $RTRSessionID
    )

    begin {
         $rtrEndpoint = "/real-time-response/entities/admin-command/v1"
    }

    process {
 
        $body = [ordered]@{
            "base_command"   = "$($RTRCommand)"
            "command_string" = "$($RTRCommandString)"
            "session_id"     = "$($RTRSessionID)"
            "persist"        =  $true
        } | ConvertTo-Json 
            
        $rtrCmdResponse = (Invoke-CSRestMethod -Endpoint $rtrEndpoint -Method "Post" -Body $body).Resources

        Write-Output $rtrCmdResponse
    }

    end {

    }
}