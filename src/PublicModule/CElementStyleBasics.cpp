#include "CElementStyleBasics.h"

CElementStyleBasics::CElementStyleBasics(QObject *parent) : QObject(parent)
{
    this->init();
}

void CElementStyleBasics::init(int Ratio)
{
    QScreen *screen = QGuiApplication::primaryScreen();
    QSize screenSize = screen->size();

    //缩放方案：保证不同分辨率下显示比例始终一致
    qreal dpi = std::min((double)screenSize.width() / 1920.0, (double)screenSize.height() / 1080.0);

    this->setDPI(dpi * Ratio);

    this->setRadiusLarge(6);
    this->setRadiusDefault(3);
    this->setRadiusSmall(1);

    this->setSpacingLarge(10);
    this->setSpacingDefault(5);
    this->setSpacingSmall(3);
}
