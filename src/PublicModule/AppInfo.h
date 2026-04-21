#ifndef APPINFO_H
#define APPINFO_H

#include <QTime>
#include <QObject>
#include <QApplication>

//版本信息
#define APP_VERSION_MAJOR 0
#define APP_VERSION_MINOR 0
#define APP_VERSION_PATCH 2
#define APP_VERSION_CODE "Alpha"

//运行平台信息
#define APP_PLATFORM_DESKTOP    0
#define APP_PLATFORM_EMBEDDED   1
#define APP_PLATFORM_ANDROID    2
#define APP_PLATFORM_DEBUG      99
#define APP_BUILD_PLATFORM APP_PLATFORM_DESKTOP

class CAppInfo : public QObject
{
    Q_OBJECT
public:
    CAppInfo(QObject *parent = nullptr) : QObject(parent)
    {
        AppPath = QCoreApplication::applicationDirPath();
    }
    ~CAppInfo(){}

public slots:

    //软件版本
    QString version()
    {
        return QString("Ver.%1.%2.%3_%4")
                .arg(APP_VERSION_MAJOR)
                .arg(APP_VERSION_MINOR)
                .arg(APP_VERSION_PATCH)
                .arg(APP_VERSION_CODE);
    }

    //编译信息
    QString build()
    {
        return QString("%1 %2").arg(__DATE__, __TIME__);
    }

    //平台信息
    int platform()
    {
        return APP_BUILD_PLATFORM;
    }

private:
    QString AppPath;
};

#endif // APPINFO_H
