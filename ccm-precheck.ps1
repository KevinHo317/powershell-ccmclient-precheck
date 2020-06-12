$CertList = (Get-ChildItem -Path Cert:\LocalMachine\My | where{ $_.EnhancedKeyUsageList -match "Client Authentication" -and {$_.IssuerName -match "CN=Enterprise Sub CA"}}).NotAfter
    if ($CertList -eq $null){Write-Host "No Client Authentication Certificate found"}else{
    $Today = get-date
foreach($certificate in $CertList){
    If ($certificate -gt $today.AddDays(365)) {
        $result = "True"
    }
    }
  }
  Write-Host $result
