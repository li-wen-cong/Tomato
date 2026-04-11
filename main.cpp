#include <QQmlContext>
#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "src/PublicModule/AppInfo.h"
#include "src/PublicModule/CMultiLanguage.h"
#include "src/PublicModule/CElementStyleBasics.h"
#include "src/PublicModule/CElementStyleFont.h"
#include "src/PublicModule/CElementStyleColor.h"

#include "src/CoreModule/CTomatoThread.h"

int main(int argc, char *argv[])
{
    qputenv("QML_DISABLE_DISK_CACHE", "true");

    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
    app.setOrganizationName("Tomato");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("cApp", &app);
    qmlRegisterSingletonType(QUrl("qrc:/GSF_Controls/GSF_Global.qml"), "GSF_Controls", 1, 0, "GSF_Global");


    CAppInfo* cAppInfo = new CAppInfo(&app);
    engine.rootContext()->setContextProperty("cAppInfo", cAppInfo);
    CElementStyleBasics* cStyle = new CElementStyleBasics(&app);
    engine.rootContext()->setContextProperty("cStyle",cStyle);
    CElementStyleFont* cFont = new CElementStyleFont(&app);
    engine.rootContext()->setContextProperty("cFont",cFont);
    CElementStyleColor* cColor = new CElementStyleColor(&app);
    engine.rootContext()->setContextProperty("cColor",cColor);
    CMultiLanguage* cMultiLanguage = new CMultiLanguage(&app,&app);
    cMultiLanguage->setEngine(&engine);
    engine.rootContext()->setContextProperty("cMultiLanguage",cMultiLanguage);

    CTomatoThread* cTomatoThread = new CTomatoThread(&app);
    engine.rootContext()->setContextProperty("cTomato",cTomatoThread);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject *obj, const QUrl &objUrl)
    {
        if (!obj && url == objUrl)
        {
            QCoreApplication::exit(-1);
        }
    }, Qt::QueuedConnection);
    engine.load(url);

    int AppExec = app.exec();

    return AppExec;
}
