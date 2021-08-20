$json = (((Get-WmiObject -Namespace root\wmi -Class mpio_disk_info).DriveInfo | Where-Object {$_.SerialNumber -match "600507680*"}) | Select-Object @{N='{#DISKNUMBER}';E={($_.Name -replace "(MPIO\sDisk)([0-9]*)" , '$2')}}, @{N='{#UNIQUEID}';E={$_.SerialNumber}} | ConvertTo-Json)
$final = ('{"data":'+$json+'}')
$final