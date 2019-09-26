<?php

// recursively deletes files and folder specified
function rrmdir($dir) { 
  foreach(glob($dir . '/*') as $file) { 
    if(is_dir($file)) rrmdir($file); else unlink($file); 
  } rmdir($dir); 
}
    
function syncdata($api_key, $trip_id, $api_url) {
    // downloads package.zip
    $headers = array('Authorization: Bearer ' . $api_key, 'Content-Type: application/zip');
    $url = $api_url . $trip_id . '/download';
    $filename = 'package.zip';
    $path = $filename;
    
    $fp = fopen($path, 'w');

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    // disables SSL verification
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
    curl_setopt($ch, CURLOPT_FILE, $fp);
    $data = curl_exec($ch);
    
    // checks whether URL (Trip ID) is valid
    $response = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    
    if ($response === 200) {
        // WARNING deletes all data in specified directory
        rrmdir('data');

        // extracts package.zip
        $zip = new ZipArchive;

        if ($zip->open('package.zip')) {
            $zip->extractTo('data/');
            $zip->close();
        }
    } else {
        echo '<script type="text/javascript">alert("Trip ID does not exist.");</script>';
    }

    curl_close($ch);
    fclose($fp);
}

function shutdown() { 
    $error = error_get_last(); 
    if ($error != null) {
        echo '<script type="text/javascript">alert("Trip data has failed to sync. Please ensure that your device has a good internet connection and try again."); window.close();</script>';
    }
}

register_shutdown_function('shutdown');

// gets parameters from build/main.js
$api_key = htmlentities($_REQUEST['api_key']);
$trip_id = htmlentities($_REQUEST['trip_id']);
$api_url = htmlentities($_REQUEST['api_url']);

if (substr($api_url, -1) != '/') {
  $api_url = $api_url . '/';
}

echo '<head><style>
    body {
        margin: 0 auto;
        height: 100%;
        width: 100%;
        text-align: center;
        color: #2b3134;
        font-family: sans-serif;
        font-style: italic;
        overflow: hidden;
    }
    .main {
        height: 100%;
        width: 100%;
        display: table;
    }
    .wrapper {
        display: table-cell;
        height: 100%;
        vertical-align: middle;
    }
    .lds-spinner {
      color: official;
      display: inline-block;
      position: relative;
      width: 64px;
      height: 64px;
    }
    .lds-spinner div {
      transform-origin: 32px 32px;
      animation: lds-spinner 1.2s linear infinite;
    }
    .lds-spinner div:after {
      content: " ";
      display: block;
      position: absolute;
      top: 3px;
      left: 29px;
      width: 5px;
      height: 14px;
      border-radius: 20%;
      background: #488aff;
    }
    .lds-spinner div:nth-child(1) {
      transform: rotate(0deg);
      animation-delay: -1.1s;
    }
    .lds-spinner div:nth-child(2) {
      transform: rotate(30deg);
      animation-delay: -1s;
    }
    .lds-spinner div:nth-child(3) {
      transform: rotate(60deg);
      animation-delay: -0.9s;
    }
    .lds-spinner div:nth-child(4) {
      transform: rotate(90deg);
      animation-delay: -0.8s;
    }
    .lds-spinner div:nth-child(5) {
      transform: rotate(120deg);
      animation-delay: -0.7s;
    }
    .lds-spinner div:nth-child(6) {
      transform: rotate(150deg);
      animation-delay: -0.6s;
    }
    .lds-spinner div:nth-child(7) {
      transform: rotate(180deg);
      animation-delay: -0.5s;
    }
    .lds-spinner div:nth-child(8) {
      transform: rotate(210deg);
      animation-delay: -0.4s;
    }
    .lds-spinner div:nth-child(9) {
      transform: rotate(240deg);
      animation-delay: -0.3s;
    }
    .lds-spinner div:nth-child(10) {
      transform: rotate(270deg);
      animation-delay: -0.2s;
    }
    .lds-spinner div:nth-child(11) {
      transform: rotate(300deg);
      animation-delay: -0.1s;
    }
    .lds-spinner div:nth-child(12) {
      transform: rotate(330deg);
      animation-delay: 0s;
    }
    @keyframes lds-spinner {
      0% {
        opacity: 1;
      }
      100% {
        opacity: 0;
      }
    }
</style></head>';

echo '<body>
    <div class="main">
        <div class="wrapper">
            <p>Loading, please wait...</p>
            <div class="lds-spinner"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
        </div>
    </div>
</body>';

// refreshes parent page when window closes
echo '<script type="text/javascript">
    window.onunload = refreshParent;
    function refreshParent() {
        window.opener.location.reload();
    }
</script>';

flush();

// optional: replace following with commented code to restrict sync access to specified time interval
syncdata($api_key, $trip_id, $api_url);
echo '<script type="text/javascript">window.close();</script>';

// if (file_exists('data/trip.json')) {
//   $tripjson = ' ' . file_get_contents('data/trip.json');
//   $tripjson_ini = strpos($tripjson, ',"updated_at":"') + strlen(',"updated_at":"');
//   $tripjson_len = strpos($tripjson, '","update_url":', $tripjson_ini) - $tripjson_ini;
//   $trip_date = substr($tripjson, $tripjson_ini, $tripjson_len);

//   $exp_date = date_create($trip_date);
//   date_add($exp_date, date_interval_create_from_date_string('14 days'));

//   date_default_timezone_set('America/Toronto');
//   $today = new DateTime();

//   if ($today > $exp_date) {
//     echo "<script>alert('Cannot sync data: the current trip has ended.');
//       window.close();</script>";
//   } else {
//     syncdata($trip_id);
//     echo '<script type="text/javascript">window.close();</script>';
//   }
// } else {
//   syncdata($trip_id);
//   echo '<script type="text/javascript">window.close();</script>';
// }

?>