-- Nama : SUPARMAN
-- Nim  :22241083
-- MODUL 1

-- mengunakan database undikma_mart
use undikma_mart;
-- Mengambil data nama_produk dari tabel ms_produK_dqlab
SELECT nama_produk harga FROM ms_produk_dqlab;
 
 -- Mengambil lebih dari satu kolom 
 SELECT nama_produk, harga FROM ms_produk_dqlab;
 SELECT nama_produk, harga FROM ms_produk_dqlab;
 
 -- Mengambil seluruh kolom table
 SELECT * FROM ms_produk_dqlab;
 
 -- Latihan 
 -- 1. Mengambil kolom kode_produk, nama_produk dari table ms_produk
 SELECT kode_produk, nama_produk FROM ms_produk_dqlab;
 
 -- 2. Mengambil seluruh kolom dari table tr_penjualan
 select * from tr_penjualan_dqlab;
 
 -- ALIAS & PREFIX
 -- Contoh PREFIX
 SELECT ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;
 
 SELECT undikma_mart.ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;
 
 -- Contoh ALIAS didalam kolom
  SELECT nama_produk as np FROM ms_produk_dqlab; 
  SELECT nama_produk np FROM ms_produk_dqlab; 
  
  -- Contoh ALIAS didalam tabel
  SELECT mpl.nama_produk FROM ms_produk_dqlab as mpl; 
  
  -- CASE 1
  SELECT nama_pelanggan, alamat FROM ms_pelanggan_dqlab;
  
   -- CASE 2
   SELECT nama_produk, harga FROM ms_produk_dqlabms_produk_dqlabms_produk_dqlabms_produk_dqlab
   
  
 