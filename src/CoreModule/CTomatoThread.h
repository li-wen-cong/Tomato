#ifndef CTOMATOTHREAD_H
#define CTOMATOTHREAD_H

#include <QObject>
#include <QMutexLocker>
#include <QFuture>
#include <QtConcurrent/QtConcurrent>

#include "../PublicModule/PM_Def.h"

enum class ETomatoState
{
    start,
    pause,
    stop
};

enum class ETomatoStage
{
    Work,
    ShortRest,
    LongRest,
    Finish
};

class CTomatoThread : public QObject
{
    Q_OBJECT

    Q_PROPERTY_AUTO(int,Work)           //工作
    Q_PROPERTY_AUTO(int,ShortRest)      //短休息
    Q_PROPERTY_AUTO(int,LongRest)       //长休息
    Q_PROPERTY_AUTO(int,Rounds)         //周期

    Q_PROPERTY_AUTO(int,CurrentStage)       //当前阶段
    Q_PROPERTY_AUTO(int,TomatoThreadState)  //当前阶段

public:
    explicit CTomatoThread(QObject *parent = nullptr);
    ~CTomatoThread();

signals:
    void tomatoTimeUpdate();
    void tomatoTips(int tips);

public slots:

    void start();
    void pause();
    void resume();
    void stop();
    void backward();
    void forward();

    /**
     * 重置为默认参数
     * @brief settingsReset
     */
    void settingsReset();

    /**
     * 计时重置
     * @brief timeReset
     */
    void timeReset();

    /**
     * 获取当前阶段的时间
     * @brief getCurrentTime
     * @return
     */
    int getCurrentTime() const;

    /**
     * 获取当前周期
     * @brief getCurrentRounds
     * @return
     */
    int getCurrentRounds() const;

    /**
     * 程序配置文件路径
     * @brief configFilePath
     * @return
     */
    QString configFilePath();

private:
    QMutex m_Mutex;

    QFuture<void> m_TomatoThreadFuture;

    int m_CurrentWork;
    int m_CurrentShortRest;
    int m_CurrentLongRest;
    int m_CurrentRounds;
};

#endif // CTOMATOTHREAD_H
