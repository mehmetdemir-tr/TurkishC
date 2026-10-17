// TurkishC Operatör Listesi - 11 Ekim 2026 19:44

#ifndef TURKISHC_H
#define TURKISHC_H

#define ana_fonksiyon main

// Hazır Temel Fonksiyonlar
#define yazdir printf
#define dyazdirf fprintf
#define fyazdir fprintf
#define snyazdir snprintf
#define karakterkoy putchar
#define kaldir remove

// Kontrol - Emir Tipi (Akış Yönetimi)
#define eger if
#define yoksa else
#define degis switch
#define kalip case
#define varsayilan default
#define icin for
#define sirada while
#define yap do
#define kir break
#define devamet continue
#define don return
#define git goto
#define basla {
#define bitir }

// Depolama Tipi
#define oto auto
#define kaydet register
#define statik static
#define dis extern

// Kullanıcı Tanımlı Tipler
#define yapi struct
#define birlik union
#define turtanimi typedef
#define secenek enum

// Özel Operatörler ve Sistem Komutları
#define buyukluk sizeof
#define hizala _Alignas
#define hizaboyutu _Alignof
#define yerel_ip _Thread_local
#define statik_iddia _Static_assert
#define donusyapma _Noreturn
#define jenerik _Generic

// Tip Niteleyicileri ve Güvenlik
#define satirici inline
#define sabit const
#define degisken volatile
#define kisitla restrict
#define _Atomik _Atomic

// Veri Tipleri
#define mantiksal _Bool
#define tamsayi int
#define karakter char
#define sayi float
#define cifte double
#define bosluk void
#define kisa short
#define uzun long
#define imzali signed
#define imzasiz unsigned
#define karmasik _Complex
#define sanal _Imaginary

// Genel Makrolar
#define BOS NULL
#define bosisaretcisi nullptr

#endif
