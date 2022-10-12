# Nama : Katarina Inezita Prambudi
# NRP : 5025211148
# Kelas : Probstat A

#====================

# 1

#==========
# A
# Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi  sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ?
# dgeom digunakan untuk mencari peluang distribusi geometrik

x <- 3
p <- 0.20
dgeom(x, p)

# Hasil : 0.1024

#==========
# B
# mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )
# rgeom digunakan untuk menghitung distribusi geometrik dengan data random

n <- 10000
p <- 0.20
meanDG <- mean(rgeom(n = 10000, p) == 3)
meanDG

# Hasil : 0.1067 , 0.1035

#==========
# C
# Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?

# Perbedaan yang terdapat pada poin a dan b adalah terletak pada distribusi geometrik
# yang dilakukan. Pada poin A, dilakukan distribusi geometrik tetap sehingga nilai yang
# didapatkan akan selalu tetap dan sama. Pada poin B, dilakukan geometrik random / acak
# sehingga nilai yang didapatkan akan selau berbeda.

#==========
# D
# Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama

library(dplyr)
library(ggplot2)
 
x <- 3
p <- 0.20

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


#==========
# E
# Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik

p <- 0.20

# Nilai Rataan
rataan <- 1 / p
rataan

# Hasil : 5

#Nilai Varian
varian <- (1 - p) / p^2
varian

# Hasil : 20



#====================

# 2

#==========
# A
# Peluang terdapat 4 pasien yang sembuh ?
# Diketahui size = 20, probability = 0.2
# menggunakan fungsi dbinom untuk menghitung peluang
dbinom(x = 4, size = 20, prob = 0.2)

# Hasil : 0.2181994

#==========
# B 
# Gambarkan grafik histogram berdasarkan kasus tersebut.
library(dplyr)
library(ggplot2)

x <- 4
p <- 0.2
n <- 20

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


#==========
# C
# Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial

# Inisialisasi
n <- 20
p <- 0.2

# Rataan
rataan <- n*p
rataan

# Hasil : 4

# Varian
varian <- n*p*(1-p)
varian

# Hasil : 3.2


#====================

# 3

#==========
# A
# Diketahui rata rata bayi lahir setiap harinya adalah 4,5
# Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
# x =  6 bayi lahir di rumah sakit besok 
dpois(6, 4.5)

# Hasil : 0.1281201

#==========
# B
# simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini  selama setahun (n = 365)
library(dplyr)
library(ggplot2)

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
babies %>% dplyr::summarize(six_babies = sum(babies$data == 6) / n())

# Hasil : 0.1150685

#==========
# C
# bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan

# Pada bagian A didapatkan hasil sekitar 13% dan pada bagian B didapatkan nilai 
# sekitar 13%. Hal ini menunjukkan bahwa kedua hasil tersebut hampir mirip.
# Oleh karena itu, hasil yang akan diberikan dengan estimati 365 hari akan mirip
# dengan hasil yang diberikan di esok hari.


#==========
# D
# Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
# Rataan = Varian = Lambda
rataan = varian = 4.5
rataan
varian

# Hasil : 4.5




#====================

# 4

#====================
# A
# Diketahui X = 2 dan V = 10
# Fungsi Probabilitas dari Distribusi Chi-Square
x <- 2
v <- 10
dchisq(x, v)

# Hasil : 0.007664155


#===========
# B 
# Histogram dari Distribusi Chi-Square dengan 100 data random

hist(rchisq(100, v))

#==========
# C
# Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square

# Rataan
rataan = v
rataan

# Hasil : 10

#varian
varian = v*2
varian

# Hasil : 20




#======================

# 5

#==========
# A
# diketahui lambda = 3
# Fungsi Probabilitas dari Distribusi Exponensial

set.seed(1)
rexp(3)

# Hasil : 0.7551818 1.1816428 0.1457067

#==========
# B
# Histogram dari 10, 100, 1000, 10000 bilangan
hist(rexp(10))
hist(rexp(100))
hist(rexp(1000))
hist(rexp(10000))

#==========
# C
# Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3
lambda <- 3
# Rataan
rataan <- 1 / lambda
rataan

# Hasil : 0.3333333

# Varian
varian <- 1 / (lambda*lambda)
varian

# Hasil : 0.1111111




#====================

# 6

#==========
# Diketahui n = 100, mean = 50, sd = 8
# A
# Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot data generate randomnya dalam bentuk grafik. Petunjuk(gunakan fungsi plot()).

n <- 100
mean <- 50
sd <- 8
Z <- rnorm(n, mean, sd)
Z
plot(Z)

#==========
# B
# Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan: 
# NRP_Nama_Probstat_{Nama Kelas}_DNhistogram

hist(Z, breaks = 50, main = "5025211148_Katarina Inezita Prambudi_Probstat_A_DNhistogram")

#==========
# C
# Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.
sd <- 8
varian <- sd * sd
varian

# Hasil : 64
