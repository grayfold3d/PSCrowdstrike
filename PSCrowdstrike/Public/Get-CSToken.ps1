function Get-CSToken {
    <#
    .SYNOPSIS
        Get token from Crowdstrike.
    .DESCRIPTION
        This function obtains and stores the token using PSFramework.
    .EXAMPLE
        PS C:\> Get-CSToken -ClientID "12345" -ClientSecret "54321"
        This retreives a token using ClientID 12345 and ClientSecret 54321
    .INPUTS
        None
    .PARAMETER ClientID
        ClientID from Crowdstrike
    .PARAMETER ClientSecret
        Secret from Crowdstrike
    .OUTPUTS
        None
    .NOTES
        This function retreives the token from Crowdstrike and stores the token in PSFramework for later use, along
        with the ClientID and ClientSecret.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $ClientID,

        [Parameter(Mandatory = $true)]
        [string]
        $ClientSecret
    )

    begin {

    }

    process {

        $RestMethodParams = @{
            URI     = "https://api.crowdstrike.com" + "/oauth2/token"
            Method  = "POST"
            Headers = @{
                "Accept"       = "application/json"
                "Content-Type" = "application/x-www-form-urlencoded"
            }
            Body    = "client_id=$clientID&client_secret=$clientSecret"
        }

        $Token = Invoke-RestMethod @RestMethodParams
    }

    end {
        Set-PSFConfig -FullName "PSCrowdstrike.ClientID" -Value $ClientID
        Set-PSFConfig -FullName "PSCrowdstrike.ClientSecret" -Value $ClientSecret
        Set-PSFconfig -FullName "PSCrowdstrike.Token" -Value $Token.access_token
    }
}
