#include "CElementStyleFont.h"

CElementStyleFont::CElementStyleFont(QObject *parent) : QObject(parent)
{
    this->init();
}

void CElementStyleFont::init(int Large, int DefaultFont, int Small, int Title)
{
#ifdef _WIN32
    this->setLarge(QFont("Microsoft YaHei", Large, QFont::Bold));
    this->setDefaultFont(QFont("Microsoft YaHei", DefaultFont, QFont::Normal));
    this->setSmall(QFont("Microsoft YaHei", Small, QFont::ExtraLight));
    this->setTitle(QFont("Microsoft YaHei", Title, QFont::DemiBold));
#else
    this->setLarge(QFont("Noto Sans", Large, QFont::Bold));
    this->setDefaultFont(QFont("Noto Sans", DefaultFont, QFont::Normal));
    this->setSmall(QFont("Noto Sans", Small, QFont::ExtraLight));
    this->setTitle(QFont("Noto Sans", Title, QFont::DemiBold));
#endif
}
