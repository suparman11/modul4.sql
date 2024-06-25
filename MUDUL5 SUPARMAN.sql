-- Nama : SUPARMAN
-- NIM : 22241083
-- Modul 5

-- Menggunakan database
use mart_undikma;

-- JOIN
-- Tampilkan nama pelanggan beserta qty belanjanya
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM ms_pelanggan_dqlab AS mp JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- JOIN tanpa filtering = CROSS JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM ms_pelanggan_dqlab AS mp JOIN tr_penjualan_dqlab AS tp
ON TRUE;

-- INNER JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM ms_pelanggan_dqlab AS mp JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- LEFT OUTER JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS tp LEFT OUTER JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- RIGHT OUTER JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS tp RIGHT OUTER JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- LEFT OUTER JOIN 3 TABEL
-- Tampilkan nama pelanggan, kategori produk yang dibeli, nama produk dan qty belanjanya
SELECT mp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM tr_penjualan_dqlab AS tp 
LEFT OUTER JOIN ms_pelanggan_dqlab AS mp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk;
-- ORDER BY JOIN
SELECT mp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM tr_penjualan_dqlab AS tp 
LEFT OUTER JOIN ms_pelanggan_dqlab AS mp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk
ORDER BY qty DESC;

-- GROUPING dan FUNGSI AGREGASI BY pada JOIN
-- Tampilkan kategori produk, nama produk, dan jumlah qty yang di kelompokkan berdasarkan kategori  dan nama produk
SELECT mpd.kategori_produk, mpd.nama_produk, sum(tp.qty) AS jumlah_qty_terjual
FROM ms_produk_dqlab AS mpd
LEFT OUTER JOIN tr_penjualan_dqlab AS tp
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk, mpd.nama_produk
HAVING sum(tp.qty) IS NULL
ORDER BY sum(tp.qty) DESC;