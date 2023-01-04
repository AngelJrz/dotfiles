oh-my-posh init pwsh --config 'C:\Users\[ USER ]\AppData\Local\Programs\oh-my-posh\themes\gruvbox.omp.json' | Invoke-Expression
Import-Module -Name Terminal-Icons
Set-Alias g git
Set-Alias vim nvim
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView