function Get-CSRTRCommandStatus {
    <#
    .SYNOPSIS
        Function to retrieve status of CrowdStrike Real Time Response Commands (RTR) via /real-time-response/entities/admin-command/v1 endpoint.
    .DESCRIPTION
        This function provides a way to retrieve Real Time Response Commands from Crowdstrike.
    .EXAMPLE
        PS C:\> Get-CSRTRCommandStatus -RequestID
        Retrieves status of RTR Command for the supplied cloud_request_id.
    .INPUTS
        None
    .PARAMETER RequestID
        The cloud_request_id of the previously executed command
    .OUTPUTS
        None
    .NOTES
        Use this function to retrieve RTR status information from Crowdstrike.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $RequestID
    )

    begin {
        $sequenceID = 0
        $rtrEndpoint = "/real-time-response/entities/admin-command/v1/?cloud_request_id=$RequestID&sequence_id=$sequenceID"

    }

    process {
        
        Do {
            try
            {
                $rtrStatus = (Invoke-CSRestMethod -Endpoint $rtrEndpoint -Method "GET").Resources
            }
            catch
            {
                Write-Host "Error - verify connectivity or reauthenticate and try again.$($error[0])" -ForegroundColor Red
                break
            }
            $sequenceID ++
            Start-Sleep -Seconds 15
        }
        While 
        (
            $rtrStatus.complete -ne "True"
        )
        
        Write-Output $rtrStatus
    }
    
    end {

    }
}