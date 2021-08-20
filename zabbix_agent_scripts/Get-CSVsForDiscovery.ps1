$json = (Get-ChildItem "C:\ClusterStorage\" | Select-Object @{Name='{#CSVNAME}';Expression={$_.Name}} | ConvertTo-Json)
$final = ('{"data":'+$json+'}')
$final