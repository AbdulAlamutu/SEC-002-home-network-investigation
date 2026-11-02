# Run on Windows with DNSClient and NetTCPIP available.
# A few read-only requests; no configuration changes or port scanning.
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$validName = 'example.com'
$invalidName = 'network-lab.invalid'
$records = @(Resolve-DnsName $validName -Type A -DnsOnly |
    Where-Object { $_.Type -eq 'A' })
$tcpResults = @(1..2 | ForEach-Object {
    [bool](Test-NetConnection $validName -Port 443 -InformationLevel Quiet -WarningAction SilentlyContinue)
})
$page = Invoke-WebRequest -Uri "https://$validName/" -Method Get -TimeoutSec 20 -UseBasicParsing
$negativeResult = 'UnexpectedSuccess'
try {
    $null = Resolve-DnsName $invalidName -Type A -DnsOnly -ErrorAction Stop
} catch {
    if ($_.FullyQualifiedErrorId -match 'DNS_ERROR_RCODE_NAME_ERROR') {
        $negativeResult = 'NameDoesNotExist'
    } else {
        $negativeResult = 'OtherResolutionError'
    }
}
$evidence = [ordered]@{
    Lab = 'NET-001'
    Execution = 'Agent-assisted local Windows lab; authorized by the account owner'
    CollectedUtc = (Get-Date).ToUniversalTime().ToString('o')
    ValidTarget = $validName
    DnsARecordCount = $records.Count
    DnsAddressReturned = ($records.Count -gt 0)
    TcpPort = 443
    TcpAttempts = $tcpResults
    HttpsStatusCode = [int]$page.StatusCode
    HttpsContentReceived = ($page.Content.Length -gt 0)
    NegativeTarget = $invalidName
    NegativeDnsResult = $negativeResult
    Sanitization = 'Allowlisted summary only. No IP addresses, MACs, DNS server addresses, usernames, computer names, or credentials.'
}
$json = $evidence | ConvertTo-Json -Depth 4
$outputFile = Join-Path $PSScriptRoot '../evidence/results.json'
$json | Set-Content -LiteralPath $outputFile -Encoding utf8
$json
if (-not $evidence.DnsAddressReturned -or $tcpResults -contains $false -or
    $evidence.HttpsStatusCode -ne 200 -or -not $evidence.HttpsContentReceived -or
    $negativeResult -ne 'NameDoesNotExist') {
    throw 'One or more lab checks differed from the expected baseline; review the evidence.'
}
