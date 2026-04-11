#include "CMultiLanguage.h"

#include "PM_Def.h"

CMultiLanguage::CMultiLanguage(QApplication *app, QObject *parent) : QObject(parent)
{
    m_pApplication = app;
    m_pTranslator = new QTranslator(this);
}

void CMultiLanguage::setEngine(QQmlApplicationEngine *engine)
{
    m_pEngine = engine;
}

bool CMultiLanguage::setLanguage(QString name)
{
    bool state = false;
    QString path = GSF_Def::AppConfig("/Language/");
    if(m_pTranslator->load(name + ".qm",path))
    {
        state = m_pApplication->installTranslator(m_pTranslator);
    }
    else
    {
        state = m_pApplication->removeTranslator(m_pTranslator);
    }
    if(m_pEngine != nullptr)
    {
        m_pEngine->retranslate();   //刷新QML界面
    }
    return state;
}

QStringList CMultiLanguage::getLanguages()
{
    QString path = GSF_Def::AppConfig("/Language/");
    QDir dir(path);
    QStringList filters;
    filters << "*.qm";
    dir.setNameFilters(filters);

    QStringList fileList  = dir.entryList();
    QStringList fileNames;
    foreach (const QString &file, fileList)
    {
        QFileInfo fileInfo(dir.absoluteFilePath(file));
        fileNames << fileInfo.baseName();   //不带后缀
    }
    fileNames.append("English");
    return fileNames;
}

bool CMultiLanguage::moreLanguage(QString path)
{
    QString targetPath = GSF_Def::AppConfig("/Language/");
    QString targetFile = GSF_Def::AppConfig("/Language/") + QFileInfo(path).fileName();

    //先判断Language路径是否存在
    QFileInfo info(targetPath);
    if(!info.exists())
    {
        QDir dir(targetPath);
        dir.mkpath(targetPath);
    }

    QDir dir(targetFile);
    if(dir.exists(targetFile))
    {
        dir.remove(targetFile);
    }

    // 创建 QFile 对象
    QFile file(path);
    if(!file.copy(targetFile))
    {
        return false;
    }

    return setLanguage(QFileInfo(path).baseName());
}
