<?php
    foreach ($data['jual'] as $jual) {
        if($jual>0){
            $no=((int)$jual['kdjual'])+1;
            $kd=sprintf("%04s",$no);
        }else{
            $kd="0001";
        }
    }
    date_default_timezone_set('asia/jakarta');
    $kodejual=date('ymd').$kd;
?>



<caption><h1>Data Jual</h1></caption>
<div>
    <form action="" method="post">
        <div>
            <label for="">Id Jual</label>
            <input type="text" name="idjual" value="" readonly>
        </div>
    </form>
</div>
<div>
    <label for="">Tanggal Transaksi</label>
    <input type="date" name="tgljual" id="" placeholder="yyy-mm-dd" required>
</div>
<div>
    <label for="">Nama Barang</label>
    <input type="text" name="idbarang" value="" hidden>
    <input type="" name="" value="">
</div>