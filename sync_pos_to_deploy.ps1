function sync_file_to_remote_dir {
    param (
        [string]$src,
        [string]$dst
    )
    Write-Host "[INF] Src " -NoNewline
    Write-Host "${src}" -ForegroundColor Green
    Write-Host "[INF] Dst " -NoNewline
    Write-Host "${dst}" -ForegroundColor Green

    scp $src $dst
}


$td = Read-Host -Prompt "Please input the trade_date for position file, format = [YYYYMMDD]"
$ty = $td.Substring(0, 4)
$tm = $td.Substring(4, 2)
$dst_path = "lianghua:E:\Data\huxo\Projects\Deploy-Operation\positions\$ty\$tm\"

# --- huxo
$src_path = "E:\Data\Projects\Deploy-Operation\positions-real\$ty\$tm\持仓汇总-$td-huxo.xls"
sync_file_to_remote_dir -src $src_path -dst $dst_path

# --- szst
$src_path = "E:\Data\Projects\Deploy-Operation\positions-real\$ty\$tm\持仓汇总-$td-szst.xls"
sync_file_to_remote_dir -src $src_path -dst $dst_path
