-- Nama :SUPARMAN
-- Nim  :22241083
-- MODUL 3

-- menggunakan database 
use mart_undikma;

-- ORDER BY  
-- mengambil kolom nanma produk dan qty dari penjualan utama berdasarkan kty
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty;

-- mengambil kolom nanma produk dan qty dari penjualan utama berdasarkan kty dan nama produk
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty, nama_produk;



-- latihan 1
-- 01 mengambil semua data penjualan berdasarkan qty dan tanggal transaksi
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tanggal_transaksi;
-- 02mengambil semua ms pelanggan berdasarkan nama peanggan
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan;
-- 03 mengambil semua ms pelanggan berdasarkan alamat
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat;

-- mengambil kolom nanma produk dan qty dari penjualan utama berdasarkan qty dari besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY QTY DESC;

-- mengambil kolom nanma produk dan qty dari penjualan utama berdasarkan kty dan nama produk DARI BESAR KE KECIL
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty, nama_produk DESC;

-- LATIHAN MANDIRI LAAGGGII 2

-- 01 mengambil semua data penjualan berdasarkan qty dan tanggal transaksi
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tanggal_transaksi DESC;
-- 02mengambil semua ms pelanggan berdasarkan nama peanggan
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan DESC;
-- 03 mengambil semua ms pelanggan berdasarkan alamat
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat DESC;


-- mengambi nama produk, qty, harga, dan total bayar urutkan berdasarkan total bayar besar kek kecil
SELECT nama_produk, qty, harga, qty*harga AS total_bayar FROM tr_penjualan_dqlab ORDER BY total_bayar DESC;

-- latihan mandiri 3
SELECT nama_produk, qty, harga,
diskon_persen, (diskon_persen/100)*harga AS diskon,
qty*(harga-(diskon_persen/100)*harga) AS total_bayar
FROM tr_penjualan_dqlab
ORDER BY total_bayar DESC, diskon DESC;



-- LATIHAN MANDIRI 4
-- NO 1
SELECT * FROM tr_penjualan_dqlab WHERE diskon_persen > 0 ORDER BY harga DESC;
-- No 2
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga >= 100000 ORDER BY harga DESC;
-- No 3
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga >= 100000 OR nama_produk like't%' ORDER BY diskon_persen DESC;

-- FUNGSI AMSENSI
-- HITUNG TOTAL QTY DARI TOTAL PENJUALAN
SELECT sum(qty) FROM tr_penjualan_dqlab;

-- HITUNG SELURUH ROW DARI TOTAL PENJUALAN
SELECT count(*) FROM tr_penjualan_dqlab;

-- HITUNG JUMLAH QTY DARI JUMLAH ROW DARI TABEL PENJUALAN
SELECT sum(qty) AS total_qty, count(*) AS total_row FROM tr_penjualan_dqlab;

-- HITUNG RATA-RATA NILAI MAKSIMAL, DAN NILAI ELEMEN DARI QTY TOTAL PENJUALAN
SELECT avg(qty), row(qty), min(qty)
FROM tr_penjualan_dqlab;

-- HITUNG JUMLAH NILAI UNIK DARI NAMA PRODUK DI TABEL PENJUALAN
SELECT count(distinct nama_produk) FROM tr_penjualan_dqlab;

-- MENAMPILKAN JUMLAH SELURUH ROW DAN JUMLAH UNIK DARI NAMA PRODUK DI TABEL PENJUALAN
SELECT count(*), count(distinct nama_produk) FROM tr_penjualan_dqlab;
SELECT count(*), count(distinct nama_produk), nama_produk FROM tr_penjualan_dqlab;

-- GROUP BY 
-- KELOMPOKKAN NILAI DARI NAMA PRODUK DI TABEL PENJUALAN
SELECT nama_produk FROM tr_penjualan_dqlab group by nama_produk;

-- KELOMPOKAN NILAI DARI NAMA PRODUK DARI QTY TABEL PENJUALAN
SELECT nama_produk, qty FROM tr_penjualan_dqlab group by nama_produk, qty;

-- GROUP BY + FUNGSI AGREGESI
-- AMBIL JUMLAH QTY DARI HASIL PENGELOMPOKAN NAMA_PRODUK DI TABEL PENJUALAN
SELECT nama_produk, count(qty) FROM tr_penjualan_dqlab group by nama_produk
order by sum(qty) DESC;

-- HEVING
-- MENGAMBIL JUMLAH QTY > 2 DARI HASIL PENGELOMPOKAN NAMA PRODUK
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab group by nama_produk having sum(qty) > 2;

-- NOMOR 
SELECT  nama_produk, qty*(harga-(diskon_persen/100)*harga)
group by nama_produk order by sum(qty) Desc;

-- menggunakan database
use mart_undikma

-- join
-- tampilkan nama pelanggan beserta qty belanjanya
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM ms_pelanggan_dqlab AS sp JOIN tr_penjualan_dqlab AS tp
ON ms.kode_pelanggan = tp.kode_pelanggan;

-- join tanpa filtering = cros join
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM ms_pelanggan_dqlab AS sp JOIN tr_penjualan_dqlab AS tp
ON true;

-- inter join
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM ms_pelanggan_dqlab AS sp JOIN tr_penjualan_dqlab AS tp
ON ms.kode_pelanggan = tp.kode_pelanggan;

-- select outer join
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS mp LEFT OUTER JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- select right outer join
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS mp RIGHT OUTER JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- left outer join 3 tabel
-- tampilkan nama pelanggan, kategori produk yang di beli, nama produk dan qty belanjaannya
SELECT mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM tr_penjualan_dqlab AS mp
LEFT OUTER JOIN ms_pelanggan_dqlab AS mp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON mp.kode_produk = tp.kode_produk

--



-- GROUPING DAN FUNGSI AGREGASI PADA JOIN
-- tampilkan kategori produk, nama produk, dan jumlah qty yang di kelompokkan berdasarkan kategori dan nama produk
