# TABARC-Code
param([int]$ThresholdPercent = 10)

Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
  if (-not $_.Size) { return }
  $pct = [math]::Round(($_.FreeSpace / $_.Size) * 100,2)
  if ($pct -le $ThresholdPercent) {
    Write-Host "LOW DISK: $($_.DeviceID) $pct%"
  }
}
