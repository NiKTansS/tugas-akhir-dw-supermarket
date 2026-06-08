--Total Penjualan per Bulan
select
    w.tahun,
    w.bulan,
    sum(f.total) as total_penjualan,
    count(f.id_fakta) as jumlah_transaksi
from fact_penjualan f
join dim_waktu w on f.id_waktu = w.id_waktu
group by w.tahun, w.bulan
order by w.tahun, w.bulan;


--Top 5 Product Line Terlaris
select
    p.product_line,
    sum(f.quantity) as total_quantity,
    sum(f.total) as total_penjualan,
    round(avg(f.rating), 2) as rata_rata_rating
from fact_penjualan f
join dim_produk p on f.id_produk = p.id_produk
group by p.product_line
order by total_penjualan desc
limit 5;


--Total Penjualan per Cabang dan Kota
select
    c.branch_code,
    c.city,
    count(f.id_fakta) as jumlah_transaksi,
    sum(f.total) as total_penjualan,
    round(avg(f.total), 2) as rata_rata_per_transaksi
from fact_penjualan f
join dim_cabang c on f.id_cabang = c.id_cabang
group by c.branch_code, c.city
order by total_penjualan desc;


--Total Penjualan per Metode Pembayaran
select
    p.payment_method,
    count(f.id_fakta) as jumlah_transaksi,
    sum(f.total) as total_penjualan,
    round(avg(f.total), 2) as rata_rata_per_transaksi
from fact_penjualan f
join dim_pembayaran p on f.id_pembayaran = p.id_pembayaran
group by p.payment_method
order by total_penjualan desc;