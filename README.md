## Simple host discovery with powershell 
It sends a ping request with <code>Test-Connection</code> command on a network segment


### Windows Execution policy
To run the script on your machine you must change the execution policy with:
```
Set-ExecutionPolicy -Scope LocalMachine RemoteSigned
```
More info here: 
- https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2
