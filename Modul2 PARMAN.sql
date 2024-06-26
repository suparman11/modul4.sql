-- Nama : SUPARMAN
-- Nim  :22241083
-- MODUL 2

-- mengunakan database undikma_mart
use undikma_mart;

-- Nilai Literal Angka
SELECT 77;
SELECT 77 as angka;

-- Menampilkan beberapa nilai literal dengan bebarapa nilai yang berbeda
SELECT 77 as angka,
true as nilai_logika,
'UNDIKMA' as test; 

-- NULL
-- Menampilkan NULL
SELECT NULL as kosong;

-- OPEATOR MATEMATKA
-- kalkuasi ekspresi matematika
SELECT 5%2 AS Sisa_Bagi,
5/2 as Hasil_Bagi,
5 DIV 2 as Hasil_Bagi_2;

-- Latihan Mandiri
SELECT 4*2 as Hasil_Perkalian,
(4*8)%7 Hasil_Perkalian_Sisa_Bagi,
(4*8) MOD 7;

-- menampilkan total belanja
SELECT qty*harga AS Total_belanja
FROM tr_penjualan_dqlab;

-- OPERATOR PERBANDINGAN
-- melakukan operator perbandngan
SELECT 5 = 5, 5 <> 5, 4 > 5;

-- LATIHAN MANDIRI
SELECT 1 = TRUE, 1 = FALSE, 5 >= 5, 5.2 = 5.20000, NULL = 1, NULL = NULL;

-- FUNGSI atau function 
SELECT pow(3,2), 
round(3.14), round(3.54), round(3.523, 2), 
floor(4.28), floor(4.78), 
ceiling(4.39), ceiling(4.55);

SELECT now(), year(now()),
datediff(now(), '2003-06-12'), day(now());

-- latihan mandiri
select datediff('2022-07-23', NOW()),
year('20-07-23'), month('2022-07-23'), day('2022-07-23'), year(now());

-- LATIHAN 2
SELECT datediff(now(), tgl_transaksi) FROM tr_penjualan_dqlab;

-- filtering with were
SELECT nama_produk, 
qyt FROM tr_penjualan_dqlab
where qyt > 3;

