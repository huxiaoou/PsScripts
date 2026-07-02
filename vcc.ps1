param (
    [string]$td,
    [string]$match
)

if ($td -eq "") {
    $td = Get-Date -Format yyyyMMdd
}
$ty = $td.Substring(0, 4)
$tm = $td.Substring(4, 2)

Write-Host "td=$td" -ForegroundColor Green
Write-Host "---------------------------"
Write-Host "Portfolio-huxo" -ForegroundColor Green
Write-Host "--------------"
view_csv E:\Data\Projects\Deploy-Operation\positions\$ty\$tm\持仓汇总-$td-huxo.xls --chead 22 --where "合约.str.match('$match')" --sort "合约,策略账户" --pivot --values "买货值,卖货值,总货值" --indexes 策略账户 --aggfunc sum --precision 2
Write-Host "---------------------------"
Write-Host "Portfolio-szst" -ForegroundColor Green
Write-Host "--------------"
view_csv E:\Data\Projects\Deploy-Operation\positions\$ty\$tm\持仓汇总-$td-szst.xls --chead 22 --where "合约.str.match('$match')" --sort "合约,策略账户" --pivot --values "买货值,卖货值,总货值" --indexes 策略账户 --aggfunc sum --precision 2
Write-Host "--------------"
Write-Host "td=$td" -ForegroundColor Green
