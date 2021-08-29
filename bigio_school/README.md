# Website Bigio School

## Laravel 8

## Langkah-langkah penginstalan

-   Pastikan telah menginstall php 7.4, composer, dan mysql,
-   buka terminal
-   pastikan berada di dalam folder bigio_school
-   import database ke dalam database server (MySQL) (file berada pada folder sebelumnya)
-   pindahkan file .env ke dalam project ini (file berada pada folder sebelumnya)
-   Ketik perintah di bawah pada terminal untuk menginstall package dan tunggu hingga selesai

```
composer install
```

-   jalankan perintah

```
php artisan storage:link
php artisan serve
```

-   lalu buka di http://localhost:8000

## Cara penggunaan

### Login dengan akun berikut

| Role    | email                 | password |
| ------- | --------------------- | -------- |
| admin   | admin@bigio.test      | 123123   |
| teacher | alvinlander@gmail.com | 123123   |
| teacher | john.doe@gmail.com    | 123123   |
| student | james@gmail.com       | 123123   |
| student | ray@gmail.com         | 123123   |
| student | huge@gmail.com        | 123123   |

## Admin

## Menambah Guru atau siswa

-   masuk ke menu guru atau siswa
-   klik add new
-   masukan data yang diinginkan
-   klik save

## Guru

### Menambah nilai siswa

-   Masuk ke menu course
-   Masukan data yang diminta
-   klik save

## Siswa

### Melihat nilai

-   Masuk ke menu course
-   search nama yang ingin dicari
