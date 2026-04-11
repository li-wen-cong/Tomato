/*! @class
*******************************************************************************************
* 类名称：CMultiLanguage.h
* 功能：多语言管理类，语言动态切换，新增语言加载
* 异常类：
-------------------------------------------------------------------------------------------
* 备注：
* 典型用法：
-------------------------------------------------------------------------------------------
* 作者：李文聪
* 时间：2024-12-26
*******************************************************************************************
*/
#ifndef CMULTILANGUAGE_H
#define CMULTILANGUAGE_H

#include <QDir>
#include <QFileInfo>
#include <QTranslator>
#include <QObject>
#include <QApplication>
#include <QDebug>
#include <QQmlApplicationEngine>

class CMultiLanguage : public QObject
{
    Q_OBJECT
public:
    CMultiLanguage(QApplication*app,QObject *parent = nullptr);

    /**
     * 传入Engine 用于实现动态刷新
     * @brief setEngine
     * @param engine
     */
    void setEngine(QQmlApplicationEngine* engine);

public slots:
    /**
     * 设置语言
     * @brief setLanguage
     * @param name
     * @return
     */
    bool setLanguage(QString name);

    /**
     * 获取语言种类
     * @brief getLanguages
     * @return
     */
    QStringList getLanguages();

    /**
     * 加载语言文件到到默认文件夹
     * @brief moreLanguage
     * @param path
     * @return
     */
    bool moreLanguage(QString path);

private:
    QApplication* m_pApplication = nullptr;
    QTranslator* m_pTranslator = nullptr;
    QQmlApplicationEngine* m_pEngine = nullptr;
};

#endif // CMULTILANGUAGE_H
