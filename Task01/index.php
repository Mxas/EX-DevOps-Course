<!DOCTYPE html>
<html>
<body>

<h1>Ram memory</h1>

<?php
function getSystemMemInfo() 
{       
    $data = explode("\n", file_get_contents("/proc/meminfo"));
    $meminfo = array();
    foreach ($data as $line) {
        list($key, $val) = explode(":", $line);
        $meminfo[$key] = trim($val);
    }
    return $meminfo;
}

$mem = getSystemMemInfo();


echo "MemTotal $mem[MemTotal] <br>";
echo "MemFree $mem[MemFree] <br>";
?>
<hr>

<h1>OS Version</h1>


<?php

    function getOSInformation()
    {
        if (false == function_exists("shell_exec") || false == is_readable("/etc/os-release")) {
            return null;
        }

        $os         = shell_exec('cat /etc/os-release');
        $listIds    = preg_match_all('/.*=/', $os, $matchListIds);
        $listIds    = $matchListIds[0];

        $listVal    = preg_match_all('/=.*/', $os, $matchListVal);
        $listVal    = $matchListVal[0];

        array_walk($listIds, function(&$v, $k){
            $v = strtolower(str_replace('=', '', $v));
        });

        array_walk($listVal, function(&$v, $k){
            $v = preg_replace('/=|"/', '', $v);
        });

        return array_combine($listIds, $listVal);
    }

$vers = getOSInformation();
echo "$vers[name] $vers[version]"


?>
<hr>

<h1>Disck Space</h1>

<?php

    function convert($bytes)
    {
       
      $si_prefix = array( 'B', 'KB', 'MB', 'GB', 'TB', 'EB', 'ZB', 'YB' );
      $base = 1024;
      $class = min((int)log($bytes , $base) , count($si_prefix) - 1);

      return sprintf('%1.2f' , $bytes / pow($base,$class)) . ' ' . $si_prefix[$class] . ' ';
    }



$free = disk_free_space("/");
$total = disk_total_space("/");
$percent = ($free/$total) * 100;
echo "Disk size totoa: ";
echo convert($total);
echo "<br>Disk size free ";
echo convert($free);
echo "<br>";


?>

<hr>
<h1>Memory and Process</h1>

<?php
        exec("ps -e -o vsz,comm= | sort -n -k 1 | tail -n 55", $output);
        array_walk($output, function(&$v, $k){
            echo "$v <br>";
        });

?>



</body>
</html>
