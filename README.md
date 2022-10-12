
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
didapatkan hasil rataan sebesar 20

![ScreenShot](https://raw.github.com/katarinainezita/Modul1_Probstat_5025211148/main/Screenshoot/1e1.png)




### 2.

