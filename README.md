
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

( SS 3A )

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

(SS 3B)

Hasil yang didapatkan adalah 0.1150685

#### c. dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
Pada bagian A didapatkan hasil sekitar 13% dan pada bagian B didapatkan nilai sekitar 13%. Hal ini menunjukkan bahwa kedua hasil tersebut hampir mirip. Oleh karena itu, hasil yang akan diberikan dengan estimati 365 hari akan mirip dengan hasil yang diberikan di esok hari.

#### d. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.

Nilai rataan dan varian dari distribusi poisson memiliki nilai yang sama dengan lambda, yaitu 4

```
rataan = varian = 4.5
```
