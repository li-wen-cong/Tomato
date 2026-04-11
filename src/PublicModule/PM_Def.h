#ifndef GSF_DEF_H
#define GSF_DEF_H

#include <QDir>
#include <QDebug>
#include <QObject>
#include <QStandardPaths>
#include <QMutexLocker>
#include <QFont>
namespace GSF_Def
{
static QString m_DataPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
static QString m_ConfigPath = QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation);

//软件配置文件路径
inline QString AppConfig(const QString &path = "")
{
    QFileInfo fi(path);
    QString dirPath = fi.path();
    QString fullPath = m_ConfigPath + "/" + path;

    if (!dirPath.isEmpty())
    {
        QDir dir(m_ConfigPath + "/" + dirPath);
        if (!dir.exists() && !dir.mkpath("."))
        {
            qWarning() << "Failed to create persistent directory:" << dir.absolutePath();
        }
    }
    return QDir::cleanPath(fullPath);
}

//软件数据文件路径
inline QString AppData(const QString &path = "")
{
    QFileInfo fi(path);
    QString dirPath = fi.path();
    QString fullPath = m_DataPath + "/" + path;

    if (!dirPath.isEmpty())
    {
        QDir dir(m_DataPath + "/" + dirPath);
        if (!dir.exists() && !dir.mkpath("."))
        {
            qWarning() << "Failed to create persistent directory:" << dir.absolutePath();
        }
    }
    return QDir::cleanPath(fullPath);
}
}

//定义Q_PROPERTY_AUTO宏 自动生成对应属性，以及get、set、rest、sig方法
#define Q_PROPERTY_AUTO(type, name, ...) \
Q_PROPERTY(type name READ get##name WRITE set##name RESET reset##name NOTIFY name##Changed __VA_ARGS__) \
    public: \
    type get##name() const { return m_##name; } \
    void set##name(const type &value) { if (m_##name != value) { m_##name = value; emit name##Changed(); } } \
    void reset##name() { set##name(type()); } \
    Q_SIGNAL void name##Changed(); \
    private: \
    type m_##name;

#endif // GSF_DEF_H
