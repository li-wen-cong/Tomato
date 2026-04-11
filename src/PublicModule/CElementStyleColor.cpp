#include "CElementStyleColor.h"

CElementStyleColor::CElementStyleColor(QObject *parent) : QObject(parent)
{
    this->setBlack(Qt::black);
    this->setWhite(Qt::white);
    this->setTransparent(Qt::transparent);

    this->init(Tomato);
}

void CElementStyleColor::init(int theme)
{
    switch (theme)
    {
    case Light:
        this->LightTheme();
        break;
    case Dark:
        this->DarkTheme();
        break;
    case Tomato:
        this->TomatoTheme();
        break;
    default:
        this->LightTheme();
        break;
    }
}

void CElementStyleColor::LightTheme()
{
    this->setBrandDark(QColor(51,126,204));
    this->setBrandBase(QColor(0x409EFF));
    this->setBrandLight(QColor(121,187,255));
    this->setBrandLighter(QColor(160,207,255));
    this->setBrandExtraLight(QColor(198,226,255));

    this->setSuccessDark(QColor(82,155,46));
    this->setSuccessBase(QColor(0x67C23A));
    this->setSuccessLight(QColor(149, 212, 117));
    this->setSuccessLighter(QColor(179, 225, 157));
    this->setSuccessExtraLight(QColor(209, 237, 196));

    this->setWarningDark(QColor(184, 130, 48));
    this->setWarningBase(QColor(0xE6A23C));
    this->setWarningLight(QColor(238, 190, 119));
    this->setWarningLighter(QColor(243, 209, 158));
    this->setWarningExtraLight(QColor(248, 227, 197));

    this->setDangerDark(QColor(196, 86, 86));
    this->setDangerBase(QColor(0xF56C6C));
    this->setDangerLight(QColor(248, 152, 152));
    this->setDangerLighter(QColor(250, 182, 182));
    this->setDangerExtraLight(QColor(252, 211, 211));

    this->setInfoDark(QColor(115, 118, 122));
    this->setInfoBase(QColor(0x909399));
    this->setInfoLight(QColor(177, 179, 184));
    this->setInfoLighter(QColor(200, 201, 204));
    this->setInfoExtraLight(QColor(222, 223, 224));

    this->setTextPrimary(QColor(0x303133));
    this->setTextRegular(QColor(0x606266));
    this->setTextSecondary(QColor(0x909399));
    this->setTextPlaceholder(QColor(0xA8ABB2));
    this->setTextDisabled(QColor(0xC0C4CC));

    this->setBorderDarker(QColor(0xCDD0D6));
    this->setBorderDark(QColor(0xD4D7DE));
    this->setBorderBase(QColor(0xDCDFE6));
    this->setBorderLight(QColor(0xE4E7ED));
    this->setBorderLighter(QColor(0xEBEEF5));
    this->setBorderExtraLight(QColor(0xF2F6FC));

    this->setFillDarker(QColor(0xE6E8EB));
    this->setFillDark(QColor(0xEBEDF0));
    this->setFillBase(QColor(0xF0F2F5));
    this->setFillLight(QColor(0xF5F7FA));
    this->setFillLighter(QColor(0xFAFAFA));
    this->setFillExtraLight(QColor(0xFAFCFF));
    this->setFillBlank(QColor(0xFFFFFF));

    this->setBackgroundPage(QColor(0xF2F3F5));
    this->setBackgroundBase(QColor(0xFFFFFF));
    this->setBackgroundOverlay(QColor(0xFFFFFF));
}

void CElementStyleColor::DarkTheme()
{
    this->setBrandDark(QColor(51, 126, 204));
    this->setBrandBase(QColor(0x409EFF));
    this->setBrandLight(QColor(102, 177, 255));
    this->setBrandLighter(QColor(121, 187, 255));
    this->setBrandExtraLight(QColor(160, 207, 255));

    this->setSuccessDark(QColor(95, 160, 60));
    this->setSuccessBase(QColor(0x67C23A));
    this->setSuccessLight(QColor(133, 206, 97));
    this->setSuccessLighter(QColor(149, 212, 117));
    this->setSuccessExtraLight(QColor(179, 225, 157));

    this->setWarningDark(QColor(180, 135, 70));
    this->setWarningBase(QColor(0xE6A23C));
    this->setWarningLight(QColor(235, 180, 99));
    this->setWarningLighter(QColor(238, 190, 119));
    this->setWarningExtraLight(QColor(243, 209, 158));

    this->setDangerDark(QColor(200, 90, 90));
    this->setDangerBase(QColor(0xF56C6C));
    this->setDangerLight(QColor(248, 131, 131));
    this->setDangerLighter(QColor(248, 152, 152));
    this->setDangerExtraLight(QColor(250, 182, 182));

    this->setInfoDark(QColor(140, 142, 147));
    this->setInfoBase(QColor(0x909399));
    this->setInfoLight(QColor(177, 179, 184));
    this->setInfoLighter(QColor(200, 201, 204));
    this->setInfoExtraLight(QColor(222, 223, 224));

    this->setTextPrimary(QColor(0xE5EAF3));
    this->setTextRegular(QColor(0xCFD3DC));
    this->setTextSecondary(QColor(0xA3A6AD));
    this->setTextPlaceholder(QColor(0x8D9095));
    this->setTextDisabled(QColor(0x6C6E72));

    this->setBorderDarker(QColor(0x636466));
    this->setBorderDark(QColor(0x58585B));
    this->setBorderBase(QColor(0x4C4D4F));
    this->setBorderLight(QColor(0x414243));
    this->setBorderLighter(QColor(0x363637));
    this->setBorderExtraLight(QColor(0x2B2B2C));

    this->setFillDarker(QColor(0x424243));
    this->setFillDark(QColor(0x39393A));
    this->setFillBase(QColor(0x303133));
    this->setFillLight(QColor(0x262727));
    this->setFillLighter(QColor(0x1D1E1F));
    this->setFillExtraLight(QColor(0x141414));
    this->setFillBlank(QColor(0x1D1E1F));

    this->setBackgroundPage(QColor(0x0F1012));
    this->setBackgroundBase(QColor(0x141414));
    this->setBackgroundOverlay(QColor(0x1D1E1F));
}

void CElementStyleColor::TomatoTheme()
{
    // 主色：番茄红/橙色调
    this->setBrandDark(QColor(204, 68, 51));        // 深番茄红
    this->setBrandBase(QColor(0xFF6B5E));           // 基础番茄红
    this->setBrandLight(QColor(255, 139, 117));     // 亮番茄红
    this->setBrandLighter(QColor(255, 179, 158));   // 更亮
    this->setBrandExtraLight(QColor(255, 214, 201));// 极亮

    // 成功色：保留绿色系，但与番茄主色协调（偏暖绿）
    this->setSuccessDark(QColor(94, 142, 68));
    this->setSuccessBase(QColor(0x7CB342));
    this->setSuccessLight(QColor(165, 196, 110));
    this->setSuccessLighter(QColor(199, 219, 154));
    this->setSuccessExtraLight(QColor(228, 240, 200));

    // 警告色：偏向橙黄（与番茄主色呼应）
    this->setWarningDark(QColor(217, 119, 51));
    this->setWarningBase(QColor(0xFDAE6B));
    this->setWarningLight(QColor(255, 192, 120));
    this->setWarningLighter(QColor(255, 214, 158));
    this->setWarningExtraLight(QColor(255, 235, 204));

    // 危险色：更深沉的红色（与品牌色区分）
    this->setDangerDark(QColor(209, 66, 66));
    this->setDangerBase(QColor(0xFF6B6B));
    this->setDangerLight(QColor(255, 148, 148));
    this->setDangerLighter(QColor(255, 184, 184));
    this->setDangerExtraLight(QColor(255, 215, 215));

    // 信息色：保持中性灰（偏暖灰，与暖色调主题一致）
    this->setInfoDark(QColor(128, 120, 115));
    this->setInfoBase(QColor(0xA59E99));
    this->setInfoLight(QColor(187, 178, 172));
    this->setInfoLighter(QColor(212, 203, 197));
    this->setInfoExtraLight(QColor(235, 228, 223));

    // 文字色（保持不变，中性灰色适应暖色背景）
    this->setTextPrimary(QColor(0x2C2C2C));
    this->setTextRegular(QColor(0x5A5A5A));
    this->setTextSecondary(QColor(0x8F8F8F));
    this->setTextPlaceholder(QColor(0xB0B0B0));
    this->setTextDisabled(QColor(0xCACACA));

    // 边框色（暖灰基调）
    this->setBorderDarker(QColor(0xD4C9C2));
    this->setBorderDark(QColor(0xDDD2CB));
    this->setBorderBase(QColor(0xE5DCD6));
    this->setBorderLight(QColor(0xEEE7E2));
    this->setBorderLighter(QColor(0xF5F0EC));
    this->setBorderExtraLight(QColor(0xFBF8F6));

    // 填充色（暖白/暖灰）
    this->setFillDarker(QColor(0xEAE2DC));
    this->setFillDark(QColor(0xF0E8E2));
    this->setFillBase(QColor(0xF5EFEA));
    this->setFillLight(QColor(0xFAF6F3));
    this->setFillLighter(QColor(0xFDFCFA));
    this->setFillExtraLight(QColor(0xFFFEFD));
    this->setFillBlank(QColor(0xFFFFFF));

    // 背景色（暖白/米白）
    this->setBackgroundPage(QColor(0xFEF7F2));
    this->setBackgroundBase(QColor(0xFFFFFF));
    this->setBackgroundOverlay(QColor(0xFFFFFF));
}
