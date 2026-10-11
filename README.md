# TurkishC

TurkishC; C++, C# vb. C tabanlı programlama dillerine benzer tamamen Türkçe sözdiziminden (syntax) oluşan bir C dili varyasyonudur.

## Özellikleri:
* **%100 Türkçe sözdizimi**: Yabancı kelimeler en az seviyeye indirilmiştir.
* **Gömülü sözlük**: Bu özellik sayesinde ayrı bir .h (header, başlık) dosyasına ihtiyacınız olmaz.
* **Çoklu argüman desteği**: Bu özellik sayesinde programı derlerken yanına ek program girebilirsiniz (örn: turcc test.tc test2.c)

## Derleme
**Kaynak kodu (turcc.tc) ve sözlüğü (turkishc.h) indirdikten sonra:**

``
cp turkishc.h /tmp/ &&
gcc -x c turcc.tc -o turcc
``

## NOT: Örnek kod için [test.tc](https://github.com/mehmetdemir-tr/TurkishC/blob/master/test.tc)'yi inceleyebilirsiniz.

## Lisans (License)
Bu proje **GNU GPL v3.0 (General Public License)** ile lisanslanmıştır. Kodlar tamamen açık kaynaklı olup, bu lisans çerçevesinde özgürce geliştirilebilir, değiştirilebilir ve paylaşılabilir.

# Operatör listesi:
## 1. Kontrol ve Akış Yönetimi

| TurkishC Kelimesi | Orijinal C Karşılığı | İşlevi |
|---|---|---|
| ana_fonksiyon | main | Programın başlangıç noktası olan ana fonksiyon. |
| eger | if | Koşul bloğu başlatır. |
| yoksa | else | Koşul sağlanmadığında çalışacak blok. |
| degis | switch | Çoklu seçim yapısı başlatır. |
| kalip | case | switch içindeki seçenekleri tanımlar. |
| varsayilan | default | Hiçbir kalıp uymadığında çalışacak varsayılan blok. |
| icin | for | Belirli sayıda dönen döngü bloğu. |
| sirada | while | Koşul doğru olduğu sürece dönen döngü bloğu. |
| yap | do | En az bir kez çalışan döngü bloğu (do-while). |
| kir | break | Döngüyü veya seçim bloğunu sonlandırır. |
| devamet | continue | Döngünün mevcut adımını atlayıp sonrakine geçer. |
| don | return | Fonksiyondan değer döndürerek çıkış yapar. |
| git | goto | Belirtilen bir etikete (label) doğrudan atlar. |
| basla | { | Kod bloğu/kapsamı başlatır. |
| bitir | } | Açılmış olan kod bloğunu kapatır. |

## 2. Hazır Temel Fonksiyonlar

| TurkishC Kelimesi | Orijinal C Karşılığı | İşlevi |
|---|---|---|
| yazdir | printf | Terminal ekranına biçimlendirilmiş metin basar. |
| dyazdirf / fyazdir | fprintf | Belirtilen bir dosyaya biçimlendirilmiş metin yazar. |
| snyazdir | snprintf | Güvenli bir şekilde metin tamponuna (buffer) yazım yapar. |
| karakterkoy | putchar | Ekrana tek bir karakter basar. |
| kaldir | remove | Belirtilen dosyayı sistemden siler. |

## 3. Veri Tipleri

| TurkishC Kelimesi | Orijinal C Karşılığı | İşlevi |
|---|---|---|
| tamsayi | int | Tam sayı değerleri tutar (Örn: 5, -12). |
| karakter | char | Tek bir karakter veya harf tutar. |
| sayi | float | Küçük boyutlu ondalıklı sayıları tutar. |
| cifte | double | Büyük ve hassas ondalıklı sayıları tutar. |
| bosluk | void | Değersizlik belirtir (Geri dönüşü olmayan fonksiyonlar vb.). |
| kisa | short | Küçük boyutlu tam sayı veri tipi. |
| uzun | long | Büyük boyutlu tam sayı veri tipi. |
| imzali | signed | Hem pozitif hem negatif değer alabilen tip. |
| imzasiz | unsigned | Sadece pozitif değer alabilen tip. |
| mantiksal | _Bool | Doğru (true) veya Yanlış (false) değeri tutar. |
| karmasik | _Complex | Sanal/Karmaşık matematiksel sayıları tutar. |
| sanal | _Imaginary | Sadece sanal kısmı olan sayıları tutar. |

## 4. Kullanıcı Tanımlı Tipler

| TurkishC Kelimesi | Orijinal C Karşılığı | İşlevi |
|---|---|---|
| yapi | struct | Farklı veri tiplerini bir arada tutan nesne yapısı. |
| birlik | union | Aynı bellek alanını paylaşan değişken kümesi. |
| secenek | enum | Kelimelere sayısal değerler atayan sıralama yapısı. |
| turtanimi | typedef | Mevcut veri tiplerine yeni takma isimler verir. |

## 5. Depolama ve Ömür Belirleyiciler

| TurkishC Kelimesi | Orijinal C Karşılığı | İşlevi |
|---|---|---|
| oto | auto | Otomatik ömürlü yerel değişken tanımlar. |
| kaydet | register | Değişkeni RAM yerine doğrudan CPU yazmacında saklar. |
| statik | static | Program çalıştığı sürece değerini koruyan kalıcı veri. |
| dis | extern | Başka bir kod dosyasında tanımlanmış veriye erişir. |

## 6. Tip Niteleyiciler ve Güvenlik

| TurkishC Kelimesi | Orijinal C Karşılığı | İşlevi |
|---|---|---|
| sabit | const | Değeri sonradan asla değiştirilemeyen veri tanımlar. |
| degisken | volatile | Derleyicinin donanımsal veriyi optimize etmesini engeller. |
| kisitla | restrict | Bellek optimizasyonunu artıran özel işaretçi niteleyicisi. |
| _Atomik | _Atomic | Eşzamanlı (Thread-safe) bellek işlemlerini sağlar. |
| satirici | inline | Küçük fonksiyonların çağrı hızını artırır. |

## 7. Özel Operatörler ve Sistem Komutları

| TurkishC Kelimesi | Orijinal C Karşılığı | İşlevi |
|---|---|---|
| buyukluk | sizeof | Bir verinin bellekte kaç bayt yer kapladığını döner. |
| BOS | NULL | Boş gösterici (null pointer) değerini temsil eder. |
| hizala | _Alignas | Verinin bellekteki bayt hizalamasını sınırlar. |
| hizaboyutu | _Alignof | Veri tipinin bellek hizalama boyutunu döndürür. |
| yerel_ip | _Thread_local | Değişkeni her işlem parçacığına (thread) özel kılar. |
| statik_iddia | _Static_assert | Derleme aşamasında mantıksal doğruluk kontrolü yapar. |
| donusyapma | _Noreturn | Fonksiyonun hiçbir yere geri dönmeyeceğini bildirir. |
| jenerik | _Generic | Makrolar üzerinden aşırı yükleme (overloading) sağlar. |


