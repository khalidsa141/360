#!/bin/bash
# سكريبت تحميل جميع ملفات الجولة الافتراضية
# قصواء مينا - النسخة المحلية
# شغّل هذا السكريبت مرة واحدة لتحميل جميع الموارد

BASE="https://qasswamina.madar360.sa"
echo "=== بدء تحميل ملفات الجولة الافتراضية ==="

# إنشاء مجلدات
mkdir -p media fonts lib/cursors misc locale loading

# ===== الملفات الرئيسية =====
echo "--- تحميل ملفات JavaScript الرئيسية ---"
curl -L "$BASE/tdvplayer.js" -o tdvplayer.js
curl -L "$BASE/script.js" -o script.js
curl -L "$BASE/script_general.js" -o script_general.js
curl -L "$BASE/favicon.ico" -o favicon.ico

# ===== CSS الخطوط =====
echo "--- تحميل CSS ---"
curl -L "$BASE/fonts.css" -o fonts.css 2>/dev/null || echo "fonts.css: not found directly, may be inline"

# ===== الخطوط =====
echo "--- تحميل الخطوط ---"
for FONT in "Adelle%20Sans%20Devanagari%20Light.woff" "Montserrat%20Bold.woff" "BebasNeueBook.woff" "BebasNeueBold.woff"; do
  FNAME=$(echo "$FONT" | sed 's/%20/ /g')
  curl -L "$BASE/fonts/$FONT" -o "fonts/$FNAME"
done

# ===== الأيقونات =====
echo "--- تحميل الأيقونات ---"
curl -L "$BASE/misc/icon16.png" -o misc/icon16.png
curl -L "$BASE/misc/icon32.png" -o misc/icon32.png
curl -L "$BASE/misc/icon180.png" -o misc/icon180.png
curl -L "$BASE/misc/icon192.png" -o misc/icon192.png

# ===== اللغة =====
echo "--- تحميل ملف اللغة ---"
curl -L "$BASE/locale/en.txt" -o locale/en.txt

# ===== مؤشرات الماوس =====
echo "--- تحميل مؤشرات الماوس ---"
curl -L "$BASE/lib/cursors/grab.cur" -o lib/cursors/grab.cur
curl -L "$BASE/lib/cursors/grabbing.cur" -o lib/cursors/grabbing.cur

# ===== صور الواجهة =====
echo "--- تحميل صور الواجهة ---"
for IMG in \
  "IconButton_EF8F8BD8_E386_8E02_41D6_310FF1964329.png" \
  "IconButton_1B9ADD00_16C4_0505_41B4_B043CA1AA270.png" \
  "Image_0FFDD355_6A28_169D_41D3_300F75D0BFC5_en.png" \
  "Image_1B99DD00_16C4_0505_41B3_51F09727447A_en.png"; do
  curl -L "$BASE/$IMG" -o "$IMG"
done

# ===== صور شاشة التحميل =====
echo "--- تحميل صور الـ Loading ---"
curl -L "$BASE/loading/HTMLImage_1D8E0BAF_6AD8_158D_41D3_5986D439E57F.png" -o "loading/HTMLImage_1D8E0BAF_6AD8_158D_41D3_5986D439E57F.png"

# ===== صور Thumbnails البانوراما =====
echo "--- تحميل صور مصغرة للبانوراما (40 صورة) ---"
THUMBNAILS=(
"panorama_09E26C76_6A2B_F29F_41D0_F931E49194BD_t.webp"
"panorama_4D4643A1_55AD_8F6A_41CA_51CCC34EA87F_t.webp"
"panorama_4D475250_55AD_892A_41D0_8BCE69183648_t.webp"
"panorama_4D478AF9_55AD_9EDA_41C6_61B665D6EA81_t.webp"
"panorama_4D4802F7_55A3_8ED6_41C6_A252FA2115D5_t.webp"
"panorama_4D4814CE_55A3_8936_41A2_F64CA3768516_t.webp"
"panorama_4D481DBB_55A3_9B5E_41D3_8E9D455D1E6D_t.webp"
"panorama_4D4827F7_55A3_76D6_41C6_45732B8E9AA0_t.webp"
"panorama_4D4838D9_55A2_FADA_41D4_7F7AC4A288D4_t.webp"
"panorama_4D4845B0_55A2_8B6A_419E_0EA7ECF9805E_t.webp"
"panorama_4D484BE3_55A3_BEEE_41BA_46D283D41AEE_t.webp"
"panorama_4D484E9C_55A2_995A_41D2_71CF59B8CB6D_t.webp"
"panorama_4D485351_55A2_8F2A_41C7_D81ACF6F71AA_t.webp"
"panorama_4D485766_55A2_97F6_41D0_DDD6A531B4DA_t.webp"
"panorama_4D4857AE_55A3_F776_41D2_DA2EA67FB293_t.webp"
"panorama_4D4859DF_55A2_9AD6_41B5_9774341F5BCF_t.webp"
"panorama_4D486065_55A3_89EA_41D1_9F32A7C7B889_t.webp"
"panorama_4D4879A6_55A3_9B76_41C3_DFFA8E993425_t.webp"
"panorama_4D48E559_55A2_8BDA_41C7_5DB6DF93FF5B_t.webp"
"panorama_4D48F695_55A3_892A_41CD_D58D41B36E84_t.webp"
"panorama_4D49078B_55A3_773E_41C1_6B8AC570C221_t.webp"
"panorama_4D4909B3_55A3_9B6E_41AC_62BB5CC35DE9_t.webp"
"panorama_4D499BAB_55A3_BF7E_41D1_06BCD77D5485_t.webp"
"panorama_4D499EF5_55A3_F6EA_41C5_6D9876154F79_t.webp"
"panorama_4D49A476_55A3_89D6_41C8_5DBB7C299BC0_t.webp"
"panorama_4D49A62A_55A3_897E_41D3_64A5C0D827B5_t.webp"
"panorama_4D49ACFA_55A3_9ADE_4188_33CD6077D8EE_t.webp"
"panorama_4D4AE0F9_55A3_8ADA_41D1_748DBEBB6B9B_t.webp"
"panorama_4D4AEEAB_55A3_797E_41C9_4A81D85C4730_t.webp"
"panorama_4D4B0C19_55A2_995A_41AB_BF78D58ABA58_t.webp"
"panorama_4D778C3D_55A2_B95A_41D0_435D4B3359CC_t.webp"
"panorama_4D779738_55A2_975A_41D3_51047F68E96E_t.webp"
"panorama_4D77A00E_55A2_8936_41A4_DA60F9392D1A_t.webp"
"panorama_4D77BE5F_55A2_99D6_41AA_55CF2F0C22C7_t.webp"
"panorama_4D77C51E_55A2_8B56_41D2_0EB63AC5A4D7_t.webp"
"panorama_4D77DA5A_55A2_99DE_41CB_D374F06A3672_t.webp"
"panorama_4D77E324_55A2_8F6A_41D4_5CD81EADFEF9_t.webp"
"panorama_4D77EBBA_55A2_BF5E_418E_11A78A6E025D_t.webp"
"panorama_4D784FE2_55AD_76EE_41BB_D020248DC47D_t.webp"
"panorama_4D787921_55AD_7B6A_41C6_B361C1555738_t.webp"
)

for T in "${THUMBNAILS[@]}"; do
  curl -L "$BASE/$T" -o "$T"
done

# ===== صور البانوراما الكاملة =====
echo "--- تحميل صور البانوراما الكاملة (6 وجهات لكل مشهد) ---"
PANORAMAS=(
"panorama_09E26C76_6A2B_F29F_41D0_F931E49194BD"
"panorama_4D4643A1_55AD_8F6A_41CA_51CCC34EA87F"
"panorama_4D475250_55AD_892A_41D0_8BCE69183648"
"panorama_4D478AF9_55AD_9EDA_41C6_61B665D6EA81"
"panorama_4D4802F7_55A3_8ED6_41C6_A252FA2115D5"
"panorama_4D4814CE_55A3_8936_41A2_F64CA3768516"
"panorama_4D481DBB_55A3_9B5E_41D3_8E9D455D1E6D"
"panorama_4D4827F7_55A3_76D6_41C6_45732B8E9AA0"
"panorama_4D4838D9_55A2_FADA_41D4_7F7AC4A288D4"
"panorama_4D4845B0_55A2_8B6A_419E_0EA7ECF9805E"
"panorama_4D484BE3_55A3_BEEE_41BA_46D283D41AEE"
"panorama_4D484E9C_55A2_995A_41D2_71CF59B8CB6D"
"panorama_4D485351_55A2_8F2A_41C7_D81ACF6F71AA"
"panorama_4D485766_55A2_97F6_41D0_DDD6A531B4DA"
"panorama_4D4857AE_55A3_F776_41D2_DA2EA67FB293"
"panorama_4D4859DF_55A2_9AD6_41B5_9774341F5BCF"
"panorama_4D486065_55A3_89EA_41D1_9F32A7C7B889"
"panorama_4D4879A6_55A3_9B76_41C3_DFFA8E993425"
"panorama_4D48E559_55A2_8BDA_41C7_5DB6DF93FF5B"
"panorama_4D48F695_55A3_892A_41CD_D58D41B36E84"
"panorama_4D49078B_55A3_773E_41C1_6B8AC570C221"
"panorama_4D4909B3_55A3_9B6E_41AC_62BB5CC35DE9"
"panorama_4D499BAB_55A3_BF7E_41D1_06BCD77D5485"
"panorama_4D499EF5_55A3_F6EA_41C5_6D9876154F79"
"panorama_4D49A476_55A3_89D6_41C8_5DBB7C299BC0"
"panorama_4D49A62A_55A3_897E_41D3_64A5C0D827B5"
"panorama_4D49ACFA_55A3_9ADE_4188_33CD6077D8EE"
"panorama_4D4AE0F9_55A3_8ADA_41D1_748DBEBB6B9B"
"panorama_4D4AEEAB_55A3_797E_41C9_4A81D85C4730"
"panorama_4D4B0C19_55A2_995A_41AB_BF78D58ABA58"
"panorama_4D778C3D_55A2_B95A_41D0_435D4B3359CC"
"panorama_4D779738_55A2_975A_41D3_51047F68E96E"
"panorama_4D77A00E_55A2_8936_41A4_DA60F9392D1A"
"panorama_4D77BE5F_55A2_99D6_41AA_55CF2F0C22C7"
"panorama_4D77C51E_55A2_8B56_41D2_0EB63AC5A4D7"
"panorama_4D77DA5A_55A2_99DE_41CB_D374F06A3672"
"panorama_4D77E324_55A2_8F6A_41D4_5CD81EADFEF9"
"panorama_4D77EBBA_55A2_BF5E_418E_11A78A6E025D"
"panorama_4D784FE2_55AD_76EE_41BB_D020248DC47D"
"panorama_4D787921_55AD_7B6A_41C6_B361C1555738"
)

FACES=(f b l r u d)
LEVELS=(0 1 2 3)

for PANO in "${PANORAMAS[@]}"; do
  for LEVEL in "${LEVELS[@]}"; do
    for FACE in "${FACES[@]}"; do
      DIR="media/${PANO}_0/${FACE}/${LEVEL}"
      mkdir -p "$DIR"
      # تحديد عدد الـ tiles لكل مستوى
      case $LEVEL in
        0) MAX=0 ;;
        1) MAX=0 ;;
        2) MAX_R=1; MAX_C=1 ;;
        3) MAX_R=3; MAX_C=3 ;;
      esac
      if [ "$LEVEL" -le 1 ]; then
        curl -s -L "$BASE/media/${PANO}_0/${FACE}/${LEVEL}/0_0.webp" \
          -o "$DIR/0_0.webp" && echo "✓ $PANO/$FACE/$LEVEL/0_0" || echo "✗ FAILED: $PANO/$FACE/$LEVEL/0_0"
      elif [ "$LEVEL" -eq 2 ]; then
        for R in 0 1; do
          for C in 0 1; do
            curl -s -L "$BASE/media/${PANO}_0/${FACE}/${LEVEL}/${R}_${C}.webp" \
              -o "$DIR/${R}_${C}.webp"
          done
        done
        echo "✓ Level 2 tiles: $PANO/$FACE"
      else
        for R in 0 1 2 3; do
          for C in 0 1 2 3; do
            curl -s -L "$BASE/media/${PANO}_0/${FACE}/${LEVEL}/${R}_${C}.webp" \
              -o "$DIR/${R}_${C}.webp"
          done
        done
        echo "✓ Level 3 tiles: $PANO/$FACE"
      fi
    done
  done
done

echo ""
echo "=== اكتمل التحميل! ==="
echo "الآن شغّل: python3 -m http.server 8080"
echo "ثم افتح: http://localhost:8080"
