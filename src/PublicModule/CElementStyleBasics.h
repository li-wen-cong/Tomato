#ifndef CELEMENTSTYLEBASICS_H
#define CELEMENTSTYLEBASICS_H

#include <QObject>
#include <QScreen>
#include <QGuiApplication>
#include <QTime>

#include "PM_Def.h"

class CElementStyleBasics : public QObject
{
    Q_OBJECT

    Q_PROPERTY_AUTO(qreal,DPI)             //DPI
    //圆角
    Q_PROPERTY_AUTO(int,RadiusLarge)
    Q_PROPERTY_AUTO(int,RadiusDefault)
    Q_PROPERTY_AUTO(int,RadiusSmall)
    //间距
    Q_PROPERTY_AUTO(int,SpacingLarge)
    Q_PROPERTY_AUTO(int,SpacingDefault)
    Q_PROPERTY_AUTO(int,SpacingSmall)

public:
    explicit CElementStyleBasics(QObject *parent = nullptr);

public slots:
    void init(int Ratio = 1.0);

    /**
     * 延时
     * @brief sleep_msec
     * @param msec
     */
    void sleep_msec(int msec)
    {
        QTime _Timer = QTime::currentTime().addMSecs(msec);
        while( QTime::currentTime() < _Timer )
        {
            QGuiApplication::processEvents(QEventLoop::AllEvents, 100);
        }
    }
};

#endif // CELEMENTSTYLEBASICS_H
