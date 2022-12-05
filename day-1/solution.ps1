$currentElfTotal = 0
$totals = [System.Collections.Generic.List[int]]::new()


foreach($line in Get-Content .\input.txt) {
    if($line -match "^[\d\.]+$"){
        $currentElfTotal += $line
    } else {
        $totals.Add($currentElfTotal)
        $currentElfTotal = 0
    }
}

$totals.Sort()
$totals.Reverse()

Write-Output "The highest calorie count by individual is: $($totals[0])"

$totals[0..2] | ForEach-Object {$total=0} {$total += $_} {Write-Output "The total calories being carried by the top 3 elfs: $total"}
