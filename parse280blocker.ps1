$outputfile = "280blocker_domain.txt"
$arr = Get-Content "280blocker*.txt"

foreach ($str in $arr) {
  if($str[0] -eq "#")
  {
    continue
  }
  $tokens = $str.split(".")
  if($tokens.Length -eq 2){
    $out = "*." + $tokens[0] + "." + $tokens[1]
    Add-Content $outputfile $out
  }else{
    Add-Content $outputfile $str
  }
}
