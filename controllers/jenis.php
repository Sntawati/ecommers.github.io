<?php
if($aksi=='index'){    
    $data['jenis']=$db->query($connect,"SELECT * FROM tjenis");
    // $d['title'] = "Jenis";
    // $helpers->load_view('templates/header.php',$d);
    $helpers->load_view('jenis/jenis.php',$data);
    // $helpers->load_view('templates/footer.php');
}
if($aksi=='add'){
    $helpers->load_view('jenis/addjenis.php');
}
if($aksi=='Save'){
    $jenisbarang=$_POST['jenisbarang'];
    $ket=$_POST['ket'];
    $simpan=$db->qry($connect,"INSERT INTO tjenis VALUES('','$jenisbarang','$ket')");
    if($simpan)
        header('location:'.$base_url. 'jenis');
    else{
        header('location:'.$base_url. 'jenis/Add');
    }
}
if($aksi=='edit'){
    $idjenis=$uri[4];
    $data['jenis']=$db->query($connect,"SELECT  * FROM tjenis WHERE idjenis='$idjenis'");
    $helpers->load_view('jenis/editjenis.php', $data);
}
if($aksi=='ubah'){
    $idjenis=$uri[4];
    $jenisbarang=$_POST['jenisbarang'];
    $ket=$_POST['ket'];

    $ubah=$db->qry($connect,"UPDATE tjenis SET jenisbarang='$jenisbarang',ket='$ket' WHERE idjenis='$idjenis'");
    if($ubah)
        header('location:'.$base_url.'jenis');
    else{
        header('location:'.$base_url.'jenis/edit');
    }
}
if($aksi=='hapus'){
    $idjenis=$uri[4];
    $hapus=$db->qry($connect,"DELETE FROM tjenis WHEREidjenis='$idjenis'");
    if($hapus)
        header('location:'.$base_url.'jenis');
    else{
        header('location:'.$base_url.'jenis/edit');
    }
}