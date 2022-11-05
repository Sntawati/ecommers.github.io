<?php
if($aksi=='index'){
    $helpers->load_view('Jual/jual.php');
}
id($aksi=='add'){
    $data['jual']=$db->query($connect,"SELECT max(right(idjual,4)) AS kdjual FROM tjual);
    $helpers->load_view('Jual/addjual.php');
}