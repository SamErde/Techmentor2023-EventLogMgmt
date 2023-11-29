Get-WinEvent -LogName System -MaxEvents 2000 | Group-Object -Property {
    Switch ($_.Level) {
        2 { 'Error'}
        3 { 'Warning'}
        4 { 'Information'}
    }
}

Get-WinEvent System -MaxEvents 1000 | Group-Object Level -NoElement | Select-Object Count, Name,
    @{Name="Log";Expression = {'System'}},
    @{Name="ComputerName";Expression = {$env:COMPUTERNAME}}

