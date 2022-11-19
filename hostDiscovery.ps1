<#
Simple ICMP host discovery
#>

$respuesta = ""

While ($respuesta -ne "S") {

# Indica el rango de IP's a escanear
do {
$net = Read-Host "Dirección de red (IP net):"
$cidr = Read-Host "Prefijo de la máscara de red (CIDR)"

$ip = $net.split(".")
    if ($ip.count -ne 4) { Write-Host "La dirección de red se compone de 4 octectos (192.168.1.0)"}

} while ($ip.count -ne 4) 

$ipNet = "$($ip[0],$ip[1],$ip[2] -join '.')"

Write-Host "Rango: $net/$cidr - $ipNet" 

# Cálculo de hosts totales a descubrir en la red 
[int]$hosts = [math]::Pow(2,32-[int]$cidr) - 2
Write-Host "Número de hosts totales: $hosts"

$respuesta = Read-Host "Continuar?: 
S/N"
} 

if ($respuesta -eq "S") {

Write-Host "Escaneando..."

    for ($i = 1; $i -le $hosts; $i++) {
        $target = "$ipNet.$i"

       if (Test-Connection $target -Count 1 -Quiet) { Write-Host "$ipNet.$i - Active"}       
    }

}
