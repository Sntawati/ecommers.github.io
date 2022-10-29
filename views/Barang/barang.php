<caption><h1>Daftar Barang</h1></caption>
<table border=1>
    <head>
        <th>Id Barang</th>
        <th>Nama Barang</th>
        <th>Jenis Barang</th>
        <th>Stok Barang</th>
        <th>Harga Barang</th>
        <th>Status Barang</th>
        <th>Pengirim</th>
        <th colspan="2">Tools</th>
    </head>
    <?php
        foreach ($data['barang'] as $barang){
        
    ?>
    <tbody>
        <td><?= $barang['idbarang']?></td>
        <td><?= $barang['nmbarang']?></td>
        <td><?= $barang['jenisbarang']?></td>
        <td><?= $barang['stok']?></td>
        
        <?php
        if($barang['status']==1){
            $status="Ready";
        }else{
            $status="Sold Out";
        }
        ?>
        <td><?= $status?></td>
        <td><?= $barang['nmdist']?></td>
        <td>Ubah</td>
        <td>Hapus</td>
    </tbody>
    <?php } ?>
</table>