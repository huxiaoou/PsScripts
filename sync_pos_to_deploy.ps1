# Encoding = GB18030

$td = Read-Host -Prompt "Please input the trade_date for position file, format = [YYYYMMDD]"
$ty = $td.Substring(0,4)
$tm = $td.Substring(4,2)
$src_path = "E:\Data\Projects\Deploy-Operation\positions-deploy\³Ö²Ö»ã×Ü-$td.xls"
$dst_path = "E:\Data\huxo\Projects\Deploy-Operation\positions\$ty\$tm\"
$dst_server = "lianghua@192.168.28.180"

Write-Host "[INF] Src path " -NoNewline
Write-Host "${src_path}" -ForegroundColor Green
Write-Host "[INF] Dst path " -NoNewline
Write-Host "${dst_server}:${dst_path}" -ForegroundColor Green

scp $src_path ${dst_server}:${dst_path}