#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "/tmp/turkishc.h"

#define MAX_SATIR 1024

sabit karakter *SOZLUK_ICERIGI =
"#define ana_fonksiyon main\n"
"#define yazdir printf\n"
"#define dyazdirf fprintf\n"
"#define fyazdir fprintf\n"
"#define snyazdir snprintf\n"
"#define karakterkoy putchar\n"
"#define kaldir remove\n"
"// Kontrol - Emir tipi\n"
"#define eger if\n"
"#define yoksa else\n"
"#define degis switch\n"
"#define kalip case\n"
"#define varsayilan default\n"
"#define icin for\n"
"#define sirada while\n"
"#define yap do\n"
"#define kir break\n"
"#define devamet continue\n"
"#define don return\n"
"#define git goto\n"
"#define basla {\n"
"#define bitir }\n"
"// Depolama tipi\n"
"#define oto auto\n"
"#define kaydet register\n"
"#define statik static\n"
"#define dis extern\n"
"// Kullanıcı tipi\n"
"#define yapi struct\n"
"#define birlik union\n"
"#define turtanimi typedef\n"
"#define secenek enum\n"
"// Spesiyal Operatorler\n"
"#define buyukluk sizeof\n"
"#define hizala _Alignas\n"
"#define hizaboyutu _Alignof\n"
"#define yerel_ip _Thread_local\n"
"#define statik_iddia _Static_assert\n"
"#define donusyapma _Noreturn\n"
"#define jenerik _Generic\n"
"// Niteleyici kelimeler\n"
"#define satirici inline\n"
"#define sabit const\n"
"#define BOS NULL\n"
"#define degisken volatile\n"
"#define kisitla restrict\n"
"#define _Atomik _Atomic\n"
"// Veri tipi\n"
"#define mantiksal _Bool\n"
"#define tamsayi int\n"
"#define karakter char\n"
"#define sayi float\n"
"#define cifte double\n"
"#define bosluk void\n"
"#define kisa short\n"
"#define uzun long\n"
"#define imzali signed\n"
"#define imzasiz unsigned\n";

bosluk dosya_donustur(sabit karakter *girdi_yolu, sabit karakter *cikti_yolu)
basla
    FILE *giris = fopen(girdi_yolu, "r");
    FILE *cikis = fopen(cikti_yolu, "w");

    eger (giris == BOS || cikis == BOS) don;

    dyazdirf(cikis, "#include \"/tmp/turkishc.h\"\n");

    karakter satir[MAX_SATIR];
    karakter *bulundu;
    tamsayi metin_blogu_icindeyiz = 0;

    sirada (fgets(satir, MAX_SATIR, giris) != BOS)
    basla
        eger (strstr(satir, "SOZLUK_ICERIGI") != BOS)
        basla
            metin_blogu_icindeyiz = 1;
            dyazdirf(cikis, "%s", satir);
            devamet;
        bitir

        eger (metin_blogu_icindeyiz == 1)
        basla
            dyazdirf(cikis, "%s", satir);
            eger (strstr(satir, "\";") != BOS)
            basla
                metin_blogu_icindeyiz = 0;
            bitir
            devamet;
        bitir

        eger (strstr(satir, "#include") != BOS || strstr(satir, "#define") != BOS)
        basla
            dyazdirf(cikis, "%s", satir);
        bitir
        yoksa
        basla
            karakter arama_kelimesi[32];
            sprintf(arama_kelimesi, "dahi%s", "let ");
            
            bulundu = strstr(satir, arama_kelimesi);
            eger (bulundu != BOS)
            basla
                dyazdirf(cikis, "#include %s", bulundu + 8);
            bitir
            yoksa
            basla
                dyazdirf(cikis, "%s", satir);
            bitir
        bitir
    bitir

    fclose(giris);
    fclose(cikis);
bitir

tamsayi ana_fonksiyon(tamsayi arguman_sayisi, karakter *argumanlar[])
basla
    eger (arguman_sayisi < 2)
    basla
        yazdir("Kullanım: ./turkishc <dosya.mc> [ek_dosyalar.c] [parametreler]\n");
        don 1;
    bitir

   FILE *sozluk_dosyasi = fopen("/tmp/turkishc.h", "w");
   eger (sozluk_dosyasi == BOS)
   basla
       yazdir("Sözlük dosyası oluşturulamadı!\n");
       don 1;
   bitir
   dyazdirf(sozluk_dosyasi, "%s", SOZLUK_ICERIGI);
   fclose(sozluk_dosyasi);

   dosya_donustur(argumanlar[1], ".gecici_kod.c");

   karakter cikti_adi[256];
   tamsayi kullanici_cikti_belirtti = 0;

   icin (tamsayi i = 2; i < arguman_sayisi; i++)
   basla
       eger (strcmp(argumanlar[i], "-o") == 0)
       basla
           kullanici_cikti_belirtti = 1;
           kir;
       bitir
   bitir

   karakter ek_argumanlar[2048] = "";
   icin (tamsayi i = 2; i < arguman_sayisi; i++)
   basla
       strcat(ek_argumanlar, " ");
       strcat(ek_argumanlar, argumanlar[i]);
   bitir

   karakter komut[4096];
   eger (kullanici_cikti_belirtti == 1)
   basla
       sprintf(komut, "gcc -x c .gecici_kod.c %s && rm -f .gecici_kod.c /tmp/turkishc.h", ek_argumanlar);
   bitir
   yoksa
   basla
       strcpy(cikti_adi, argumanlar[1]);
       karakter *uzanti = strrchr(cikti_adi, '.');
       eger (uzanti != BOS) *uzanti = '\0';
       sprintf(komut, "gcc -x c .gecici_kod.c %s -o %s && rm -f .gecici_kod.c /tmp/turkishc.h", ek_argumanlar, cikti_adi);
   bitir

   tamsayi durum = system(komut);
   eger (durum == 0)
   basla
       yazdir("Başarılı!\n");
       don 0;
   bitir
   yoksa
   basla
       yazdir("Derleme sırasında hata oluştu!\n");
       kaldir("/tmp/turkishc.h");
       don 1;
   bitir
bitir
