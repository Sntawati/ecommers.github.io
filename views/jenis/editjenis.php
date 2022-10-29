<caption><h1>UBAH DATA JENIS</h1></caption>
<?php foreach ($data['jenis'] as $edit) { ?>
<form action="<?php echo $base_url.'jenis/Ubah'.$edit['idjenis'] ?>" method="post">
    
    <label for="Jenis Barang">Jenis Barang</label>
    <input type="text" name="jenisbarang" id="" value="<?= $edit['jenisbarang'] ?>">

    <label for="">Keterangan</label>
    <input type="text" name="ket" id="" value="<?= $edit['ket']?>">
    <input type="submit" value="Simpan">
    <input type="reset" value="Batal">
</form>
<?php } ?>