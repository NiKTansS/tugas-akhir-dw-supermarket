
CREATE TABLE Dim_Waktu (
  id_waktu    INT PRIMARY KEY AUTO_INCREMENT,
  tanggal     DATE,
  hari        VARCHAR(10),
  bulan       INT,
  tahun       INT,
  jam         TIME
);

CREATE TABLE Dim_Pelanggan (
  id_pelanggan  INT PRIMARY KEY AUTO_INCREMENT,
  customer_type VARCHAR(10),
  gender        VARCHAR(10)
);

CREATE TABLE Dim_Produk (
  id_produk    INT PRIMARY KEY AUTO_INCREMENT,
  product_line VARCHAR(50)
);

CREATE TABLE Dim_Cabang (
  id_cabang   INT PRIMARY KEY AUTO_INCREMENT,
  branch_code CHAR(1),
  city        VARCHAR(50)
);

CREATE TABLE Dim_Pembayaran (
  id_pembayaran  INT PRIMARY KEY AUTO_INCREMENT,
  payment_method VARCHAR(20)
);

CREATE TABLE Fact_Penjualan (
  id_fakta      INT PRIMARY KEY AUTO_INCREMENT,
  id_waktu      INT,
  id_pelanggan  INT,
  id_produk     INT,
  id_cabang     INT,
  id_pembayaran INT,
  quantity      INT,
  unit_price    DECIMAL(10,2),
  tax_5pct      DECIMAL(10,4),
  total         DECIMAL(10,4),
  cogs          DECIMAL(10,4),
  gross_income  DECIMAL(10,4),
  rating        DECIMAL(3,1),
  FOREIGN KEY (id_waktu)      REFERENCES Dim_Waktu(id_waktu),
  FOREIGN KEY (id_pelanggan)  REFERENCES Dim_Pelanggan(id_pelanggan),
  FOREIGN KEY (id_produk)     REFERENCES Dim_Produk(id_produk),
  FOREIGN KEY (id_cabang)     REFERENCES Dim_Cabang(id_cabang),
  FOREIGN KEY (id_pembayaran) REFERENCES Dim_Pembayaran(id_pembayaran)
);