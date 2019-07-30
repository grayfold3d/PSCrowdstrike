function Invoke-CSRestMethod {
    <#
    .SYNOPSIS
        Wrapper around Invoke-RestMethod.
    .DESCRIPTION
        This function provides a way to execute Invoke-RestMethod using common parameters required by PSCrowdstrike.
    .EXAMPLE
        PS C:\> Invoke-CSRestMethod -Endpoint "/analysis" -Method "GET" -Body $Body
        Using Invoke-RestMethod, posts a GET to /analysis with $body.
    .INPUTS
        None
    .PARAMETER Endpoint
        The rest endpoint used in Invoke-RestMethod, such as /analysis.
    .PARAMETER Method
        POST, GET, DELETE, CREATE
    .PARAMETER Body
        Body of Invoke-RestMethod
    .OUTPUTS
        None
    .NOTES
        None
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]
        $Endpoint,

        [Parameter(Mandatory = $true)]
        [string]
        $Method,

        [Parameter(Mandatory = $false)]
        $Body
    )

    Begin {

        $token = Get-PSFConfigValue -FullName PSCrowdstrike.Token

        $RestMethodParams = @{
            URI         = "https://api.crowdstrike.com" + $Endpoint
            Method      = $Method
            Headers     = @{
                "Accept"       = "application/json"
                "Authorization" = "bearer $token"
            }
        }

        if ($PSBoundParameters.ContainsKey('Body')) {
            $RestMethodParams.Add('Body', $Body)
        }
    }

    Process {
        Invoke-RestMethod @RestMethodParams
    }

    End {

    }

}
