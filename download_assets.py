#!/usr/bin/env python3
"""
سكريبت تحميل ملفات الجولة الافتراضية - قصواء مينا
يعمل على Windows / Mac / Linux
"""
import urllib.request
import os
import sys

BASE = "https://qasswamina.madar360.sa"

def dl(url, path):
    os.makedirs(os.path.dirname(path) if os.path.dirname(path) else ".", exist_ok=True)
    try:
        req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
        with urllib.request.urlopen(req, timeout=30) as r, open(path, "wb") as f:
            f.write(r.read())
        print(f"  ✓ {path}")
    except Exception as e:
        print(f"  ✗ FAILED {path}: {e}")

print("=== بدء تحميل ملفات الجولة الافتراضية ===\n")

# ملفات JS الرئيسية
print("--- JavaScript ---")
for f in ["tdvplayer.js", "script.js", "script_general.js"]:
    dl(f"{BASE}/{f}", f)

# favicon
dl(f"{BASE}/favicon.ico", "favicon.ico")

# CSS الخطوط
print("--- CSS ---")
dl(f"{BASE}/fonts.css", "fonts.css")

# الخطوط
print("--- Fonts ---")
FONTS = [
    "Adelle%20Sans%20Devanagari%20Light.woff",
    "Montserrat%20Bold.woff",
    "BebasNeueBook.woff",
    "BebasNeueBold.woff",
    "Adelle%20Sans%20Devanagari%20Thin.woff",
    "Montserrat%20Bold.woff2",
]
for font in FONTS:
    fname = font.replace("%20", " ")
    dl(f"{BASE}/fonts/{font}", f"fonts/{fname}")

# الأيقونات
print("--- Icons ---")
for icon in ["icon16.png", "icon32.png", "icon180.png", "icon192.png"]:
    dl(f"{BASE}/misc/{icon}", f"misc/{icon}")

# ملف اللغة
print("--- Locale ---")
dl(f"{BASE}/locale/en.txt", "locale/en.txt")

# مؤشرات الماوس
print("--- Cursors ---")
dl(f"{BASE}/lib/cursors/grab.cur", "lib/cursors/grab.cur")
dl(f"{BASE}/lib/cursors/grabbing.cur", "lib/cursors/grabbing.cur")

# صور الواجهة
print("--- UI Images ---")
UI_IMGS = [
    "IconButton_EF8F8BD8_E386_8E02_41D6_310FF1964329.png",
    "IconButton_1B9ADD00_16C4_0505_41B4_B043CA1AA270.png",
    "Image_0FFDD355_6A28_169D_41D3_300F75D0BFC5_en.png",
    "Image_1B99DD00_16C4_0505_41B3_51F09727447A_en.png",
]
for img in UI_IMGS:
    dl(f"{BASE}/{img}", img)

# صورة شاشة التحميل
print("--- Loading Screen ---")
dl(
    f"{BASE}/loading/HTMLImage_1D8E0BAF_6AD8_158D_41D3_5986D439E57F.png",
    "loading/HTMLImage_1D8E0BAF_6AD8_158D_41D3_5986D439E57F.png"
)

# قائمة البانوراما
PANORAMAS = [
    "panorama_09E26C76_6A2B_F29F_41D0_F931E49194BD",
    "panorama_4D4643A1_55AD_8F6A_41CA_51CCC34EA87F",
    "panorama_4D475250_55AD_892A_41D0_8BCE69183648",
    "panorama_4D478AF9_55AD_9EDA_41C6_61B665D6EA81",
    "panorama_4D4802F7_55A3_8ED6_41C6_A252FA2115D5",
    "panorama_4D4814CE_55A3_8936_41A2_F64CA3768516",
    "panorama_4D481DBB_55A3_9B5E_41D3_8E9D455D1E6D",
    "panorama_4D4827F7_55A3_76D6_41C6_45732B8E9AA0",
    "panorama_4D4838D9_55A2_FADA_41D4_7F7AC4A288D4",
    "panorama_4D4845B0_55A2_8B6A_419E_0EA7ECF9805E",
    "panorama_4D484BE3_55A3_BEEE_41BA_46D283D41AEE",
    "panorama_4D484E9C_55A2_995A_41D2_71CF59B8CB6D",
    "panorama_4D485351_55A2_8F2A_41C7_D81ACF6F71AA",
    "panorama_4D485766_55A2_97F6_41D0_DDD6A531B4DA",
    "panorama_4D4857AE_55A3_F776_41D2_DA2EA67FB293",
    "panorama_4D4859DF_55A2_9AD6_41B5_9774341F5BCF",
    "panorama_4D486065_55A3_89EA_41D1_9F32A7C7B889",
    "panorama_4D4879A6_55A3_9B76_41C3_DFFA8E993425",
    "panorama_4D48E559_55A2_8BDA_41C7_5DB6DF93FF5B",
    "panorama_4D48F695_55A3_892A_41CD_D58D41B36E84",
    "panorama_4D49078B_55A3_773E_41C1_6B8AC570C221",
    "panorama_4D4909B3_55A3_9B6E_41AC_62BB5CC35DE9",
    "panorama_4D499BAB_55A3_BF7E_41D1_06BCD77D5485",
    "panorama_4D499EF5_55A3_F6EA_41C5_6D9876154F79",
    "panorama_4D49A476_55A3_89D6_41C8_5DBB7C299BC0",
    "panorama_4D49A62A_55A3_897E_41D3_64A5C0D827B5",
    "panorama_4D49ACFA_55A3_9ADE_4188_33CD6077D8EE",
    "panorama_4D4AE0F9_55A3_8ADA_41D1_748DBEBB6B9B",
    "panorama_4D4AEEAB_55A3_797E_41C9_4A81D85C4730",
    "panorama_4D4B0C19_55A2_995A_41AB_BF78D58ABA58",
    "panorama_4D778C3D_55A2_B95A_41D0_435D4B3359CC",
    "panorama_4D779738_55A2_975A_41D3_51047F68E96E",
    "panorama_4D77A00E_55A2_8936_41A4_DA60F9392D1A",
    "panorama_4D77BE5F_55A2_99D6_41AA_55CF2F0C22C7",
    "panorama_4D77C51E_55A2_8B56_41D2_0EB63AC5A4D7",
    "panorama_4D77DA5A_55A2_99DE_41CB_D374F06A3672",
    "panorama_4D77E324_55A2_8F6A_41D4_5CD81EADFEF9",
    "panorama_4D77EBBA_55A2_BF5E_418E_11A78A6E025D",
    "panorama_4D784FE2_55AD_76EE_41BB_D020248DC47D",
    "panorama_4D787921_55AD_7B6A_41C6_B361C1555738",
]

# تحميل thumbnails
print(f"\n--- Panorama Thumbnails ({len(PANORAMAS)} panoramas) ---")
for pano in PANORAMAS:
    dl(f"{BASE}/{pano}_t.webp", f"{pano}_t.webp")

# تحميل صور البانوراما الكاملة
print(f"\n--- Panorama Tiles (6 faces × 4 levels × tiles) ---")
FACES = ["f", "b", "l", "r", "u", "d"]
for i, pano in enumerate(PANORAMAS, 1):
    print(f"  [{i}/{len(PANORAMAS)}] {pano[:30]}...")
    for face in FACES:
        for level in range(4):
            folder = f"media/{pano}_0/{face}/{level}"
            os.makedirs(folder, exist_ok=True)
            # عدد tiles حسب المستوى
            tiles = 1 if level <= 1 else (2 if level == 2 else 4)
            for row in range(tiles):
                for col in range(tiles):
                    url = f"{BASE}/media/{pano}_0/{face}/{level}/{row}_{col}.webp"
                    path = f"{folder}/{row}_{col}.webp"
                    dl(url, path)

print("\n=== اكتمل التحميل! ===")
print("شغّل الخادم المحلي:")
print("  python3 -m http.server 8080")
print("ثم افتح المتصفح على:")
print("  http://localhost:8080")
