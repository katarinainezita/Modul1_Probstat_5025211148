
# PRAKTIKUM PROBSTAT MODUL 1 KELAS A

Nama : Katarina Inezita Prambudi

NRP : 5025211148

Kelas : Probstat A


# PENJELASAN

### 1. Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya

#### a. Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi  sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ? (distribusi Geometrik)

Diketahui x = 3 dan p = 0.20.

Untuk mencari peluang distribusi geometrik digunakan fungsi dgeom
```
x <- 3
p <- 0.20
dgeom(x, p)
```

didapatkan hasil 0.1024

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/1A.png)

#### b. mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )

Diketahui n = 10000 , p = 0.20 , x = 3

Untuk menghitung distribusi geometrik dengan data random digunakan rgeom

```
n <- 10000
p <- 0.20
meanDG <- mean(rgeom(n = 10000, p) == 3)
meanDG
```

didapatkan hasil yang acak, salah satunya adalah 0.1067, 0.1035

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/1B.png)

#### c. Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?

Perbedaan yang terdapat pada poin a dan b adalah terletak pada distribusi geometrik yang dilakukan. Pada poin A, dilakukan distribusi geometrik tetap sehingga nilai yang didapatkan akan selalu tetap dan sama. Pada poin B, dilakukan geometrik random / acak sehingga nilai yang didapatkan akan selau berbeda.


#### d. Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama

Sesuai dengan refensi yang berasal dari https://rpubs.com/mpfoley73/458721 

- Install Packages 'dplyr' dan 'ggplot2'
```
install.packages("dplyr")
install.packages("ggplot2")
```

- Panggil library
```
library(dplyr)
library(ggplot2)
```

- Inisialisasi 
```
x <- 3
p <- 0.20
```

- Untuk membuat grafik, perlu untuk menggunakan fungsi ggplot(). Sedangkan untuk menambahkan variable baru, dapat menggunakan fungsi mutate()
```
data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = 0.20)) %>%
  mutate(Kegagalan = ifelse(x == 3, 3, "lainnya")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Kegagalan)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Peluang dari X = 3 Gagal Sebelum Sukses Pertama",
       x = "Kegagalan Sebelum Sukses Pertama (x)",
       y = "Peluang")
```

didapatkan hasil seperti di bawah ini 

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/1D.png)

#### e. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik

Untuk mencari nilai rataan dari distribusi geometrik menggunakan rumus 
```
rataan <- 1 / p
```
didapatkan hasil rataan sebesar 5 

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/1e.png)

Untuk mencari nilai Varian dari distribusi geometrik menggunakan rumus 
```
varian <- (1 - p) / p^2
```
didapatkan hasil varian sebesar 20

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/1e1.png)




### 2. Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :

#### a. Peluang terdapat 4 pasien yang sembuh.

Diketahui size = 20, p = 0.2 , x = 4

Untuk menghitung peluang dari distribusi binomial digunakan fungsi dbinom()

```
dbinom(x = 4, size = 20, prob = 0.2)
```

didapatkan hasil 0.2181994

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/2A.png)

#### b. Gambarkan grafik histogram berdasarkan kasus tersebut.

Sesuai dengan refensi yang berasal dari https://rpubs.com/mpfoley73/458411

- Install Packages 'dplyr' dan 'ggplot2'
```
install.packages("dplyr")
install.packages("ggplot2")
```

- Panggil library
```
library(dplyr)
library(ggplot2)
```

- Inisialisasi
```
x <- 4
p <- 0.2
n <- 20
```

- Untuk membuat grafik, perlu untuk menggunakan fungsi ggplot(). Sedangkan untuk menambahkan variable baru, dapat menggunakan fungsi mutate()
```
data.frame(x = 0:10, prob = dbinom(x = 0:10, size = 20, prob = 0.2)) %>%
  mutate(Pasien = ifelse(x == 4, 4, "lainnya")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Pasien)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Peluang dari 4 Pasien Sembuh",
       x = "Sembuh(x)",
       y = "Peluang")
 ```

didapatkan hasil seperti di bawah ini 

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/2B.png)

#### c. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.

Untuk mencari nilai rataan dari distribusi binomial menggunakan rumus 
```
rataan <- n*p
```
didapatkan hasil rataan sebesar 4 

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/2C.png)

Untuk mencari nilai Varian dari distribusi binomial menggunakan rumus 
```
varian <- n*p*(1-p)
```
didapatkan hasil varian sebesar 3.2

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/2C1.png)


### 3. Diketahui data dari  sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)
### a. Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
Diketahui lambda = 4.5 , x = 6

Untuk mencari peluang dari distribusi poisson digunakan funggsi dpois()
```
dpois(6, 4.5)
```
didapatkan hasil 0.1281201

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/3A.png)

#### b. simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini  selama setahun (n = 365)
- Install Packages 'dplyr' dan 'ggplot2'
```
install.packages("dplyr")
install.packages("ggplot2")
```

- Panggil library
```
library(dplyr)
library(ggplot2)
```

- Buat Histogram
```
set.seed(2)

babies <- data.frame('data' = rpois(365, 4.5))

babies %>% ggplot() +
  geom_histogram(aes(x = data,
                     y = stat(count / sum(count)),
                     fill = data == 6),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:10) + 
  labs(x = 'Jumlah bayi lahir per periode',
       y = 'Proporsi',
       title = '365 simulasi kelahiran di rumah sakit dengan Pois(lambda = 4.5)') +
  theme_bw()
```
didapatkan hasil seperti di bawah ini 

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/3B.png)

Hasil yang didapatkan adalah 0.1150685

#### c. dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
Pada bagian A didapatkan hasil sekitar 13% dan pada bagian B didapatkan nilai sekitar 11%. Hal ini menunjukkan bahwa kedua hasil tersebut hampir mirip. Oleh karena itu, hasil yang akan diberikan dengan estimati 365 hari akan mirip dengan hasil yang diberikan di esok hari.

#### d. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.

Nilai rataan dan varian dari distribusi poisson memiliki nilai yang sama dengan lambda, yaitu 4.5

```
rataan = varian = 4.5
```


### 4. Diketahui nilai x = 2 dan v = 10. Tentukan:
#### a. Fungsi Probabilitas dari Distribusi Chi-Square

Diketahui X = 2 dan V = 10

Untuk mencari peluang dari distribusi Chi-Square digunakan fungsi dchisq()

```
dchisq(x, v)
```

didapatkan hasil 0.007664155

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/4A.png)

#### b. Histogram dari Distribusi Chi-Square dengan 100 data random.

Untuk menggambar histogram dari distribusi Chi-Square digunakan fungsi hist()
```
hist(rchisq(100, v))
```
didapatkan hasil seperti di bawah ini 

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/4B.png)

#### c. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square.

Untuk mencari nilai rataan dari distribusi Chi-Square menggunakan rumus 
```
rataan = v
```
didapatkan hasil rataan sebesar 10 

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/4C.png)

Untuk mencari nilai Varian dari distribusi Chi-Square menggunakan rumus 
```
varian = v*2
```
didapatkan hasil varian sebesar 20

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/4C1.png)

### 5. Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3). Tentukan
#### a. Fungsi Probabilitas dari Distribusi Exponensial

Diketahui lambda = 3

Untuk mencari peluang dari distribusi exponensial digunakan fungsi set.seed() dan rexp()

```
set.seed(1)
rexp(3)
```
didapatkan hasil 0.7551818 1.1816428 0.1457067

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/5A.png)

#### b. Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
Untuk menggambar histogram dari distribusi Exponensial digunakan fungsi hist()

- 10 Bilangan
```
hist(rexp(10))
```

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/5B10.png)

- 100 Bilangan
```
hist(rexp(100))
```

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/5B100.png)

- 1000 Bilangan
```
hist(rexp(1000))
```

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/5B1000.png)

- 10000 Bilangan
```
hist(rexp(10000))
```

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/5B10000.png)

#### c. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3

Untuk mencari nilai rataan dari distribusi Exponensial menggunakan rumus 
```
rataan <- 1 / lambda
```
didapatkan hasil rataan sebesar 0.3333333

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/5C.png)

Untuk mencari nilai Varian dari distribusi Exponensial menggunakan rumus 
```
varian <- 1 / (lambda*lambda)
```
didapatkan hasil varian sebesar 0.1111111

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/5C1.png)

### 6. Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8. Tentukan
#### a. Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot data generate randomnya dalam bentuk grafik. Petunjuk(gunakan fungsi plot()).
Diketahui n = 100 , mean = 50, sd = 8
```
n <- 100
mean <- 50
sd <- 8
Z <- rnorm(n, mean, sd)
Z
```
didapatkan hasil seperti gambar dibawah ini 

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/6A1.png)

Gunakan fungsi plot()
```
plot(Z)
```
didapatkan hasil seperti gambar dibawah ini 

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/6A.png)

#### b. Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan: NRP_Nama_Probstat_{Nama Kelas}_DNhistogram

Diketahui break = 50 dan format Penamaan : 5025211148_Katarina Inezita Prambudi_Probstat_A_DNhistogram

Gunakan fungsi hist() untuk membuat histogram 

```
hist(Z, breaks = 50, main = "5025211148_Katarina Inezita Prambudi_Probstat_A_DNhistogram")
```

didapatkan hasil seperti gambar dibawah ini 

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/6B.png)


#### c. Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.
Untuk mencari nilai Varian dari distribusi distribusi normal menggunakan rumus 
```
varian <- sd * sd
```
didapatkan hasil varian sebesar 64

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/6C.png)
