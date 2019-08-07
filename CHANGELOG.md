# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.2.0]

* Added private function to get host information from AgentID.
* Re-worked Get-CSDeviceDetails to accept hostname instead of computername.

## [0.1.0]

* Created Invoke-RestMethod wrapper to include token upon each invoke-restmethod.
* Added Get-CSToken to retrive token for OAuth2 authorization.
* Added initial support for retrieving host details using Get-CSDeviceDetails.
* Updated readme.md with basic instructions.
