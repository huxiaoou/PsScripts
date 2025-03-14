param (
    [Parameter(Mandatory = $false)]
    [string]$bgn_date = (Get-Date -Format "yyyyMMdd")
)
$tyear = $bgn_date.Substring(0, 4)

Set-Location E:\Projects\DataManagerTushare\
python main.py --bgn $bgn_date download --switch fmd
python main.py --bgn $bgn_date download --switch contract
python main.py --bgn $bgn_date download --switch universe
python main.py --bgn $bgn_date download --switch position
python main.py --bgn $bgn_date download --switch basis
python main.py --bgn $bgn_date download --switch stock

python main.py --bgn $bgn_date update --switch fmd
python main.py --bgn $bgn_date update --switch position
python main.py --bgn $bgn_date update --switch basis
python main.py --bgn $bgn_date update --switch stock

scp -r E:\OneDrive\Data\tushare\by_date\$tyear\$bgn_date sxzqhxo:/root/workspace/Data/huxo/input/by_date/$tyear
