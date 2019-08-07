@{
    PSDependOptions = @{
        Target = 'CurrentUser'
    }
    'Pester' = @{
        Version = '4.7.3'
        Parameters = @{
            SkipPublisherCheck = $true
        }
    }
    'psake' = @{
        Version = '4.8.0'
    }
    'BuildHelpers' = @{
        Version = '2.0.9'
    }
    'PowerShellBuild' = @{
        Version = '0.3.1'
    }
    'PSFramework' = @{
        Version = '1.0.19'
    }
    'PSScriptAnalyzer' = @{
        Version = '1.18.1'
    }
}
