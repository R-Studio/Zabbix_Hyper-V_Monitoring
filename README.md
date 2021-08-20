# Zabbix Hyper-V Monitoring
This repository contains Zabbix Templates and Grafana dashboards for an awesome Hyper-V monitoring.

> Maybe for your environment you have to change some Zabbix items in the templates and the serialnumber filter in 'Get-HBAPathNumbersForDiscovery.ps1'.
> This repository is working but will be not supported in the future. Because we switch to the TIG-Stack (Telegraf, InfluxDB, Grafana)


## Grafana Dashboards
### Windows - Fabric - Hyper-V
*This dashboard is for analyzing one Hyper-V node.*
* There is a dropdown to select the node you want.

![Windows - Fabric - Hyper-V](Windows_-_Fabric_-_Hyper-V.png)


### Windows - Fabric - Hyper-V (all Nodes) - TV
*This dashboard is for checking all your Hyper-V nodes on the same time to quickly see peaks.*
![Windows - Fabric - Hyper-V (all Nodes) - TV](Windows_-_Fabric_-_Hyper-V_(all_Nodes)_-_TV.png)


### Windows - Fabric - Hyper-V (all Nodes) - Patchlevel
*This dashboard is for quickly see all patchlevels from the Hyper-V nodes.*
![Windows - Fabric - Hyper-V - Patchlevel](Windows_-_Fabric_-_Hyper-V_-_Patchlevel.png)


## Installation
* Install the Zabbix agent on a Hyper-V node
* Place both PowerShell scripts (*Get-CSVsForDiscovery.ps1* & *Get-HBAPathNumbersForDiscovery.ps1*) in the root installation directory of the Zabbix agent
* Add following to the end of your Zabbix Agent configuration *zabbix_agentd.conf* or take my configuration and replace some parts:
```
### UserParameters - RHE:
UserParameter=custom.discovery.csvnames,powershell -File "C:\Program Files\Zabbix Agent\Get-CSVsForDiscovery.ps1"
UserParameter=custom.discovery.hbapaths,powershell -File "C:\Program Files\Zabbix Agent\Get-HBAPathNumbersForDiscovery.ps1"
###
```
* Restart your Zabbix agent
* Import the Grafana dashboards to your Grafana instance
* You are finished and everything should work



## License
Copyright 2021 Robin Hermann

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. 
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.