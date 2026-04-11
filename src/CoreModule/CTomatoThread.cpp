#include "CTomatoThread.h"

#define TOMATO_THREAD_CYCLE 500

CTomatoThread::CTomatoThread(QObject *parent) : QObject(parent)
{
    this->settingsReset();
    this->timeReset();
    this->setTomatoThreadState(static_cast<int>(ETomatoState::stop));
}

CTomatoThread::~CTomatoThread()
{
    this->stop();
}

void CTomatoThread::start()
{
    this->timeReset();

    {
        QMutexLocker locker(&m_Mutex);
        this->setTomatoThreadState(static_cast<int>(ETomatoState::start));
    }

    m_TomatoThreadFuture = QtConcurrent::run([this]()
    {
        while (this->getTomatoThreadState() == static_cast<int>(ETomatoState::start) ||
               this->getTomatoThreadState() == static_cast<int>(ETomatoState::pause))
        {
            QThread::msleep(TOMATO_THREAD_CYCLE);

            QMutexLocker locker(&m_Mutex);
            if(this->getTomatoThreadState() == static_cast<int>(ETomatoState::start))
            {
                switch (static_cast<ETomatoStage>(m_CurrentStage))
                {
                case ETomatoStage::Work:
                    m_CurrentWork += TOMATO_THREAD_CYCLE;
                    if(m_CurrentWork >= this->getWork() * 60 * 1000)
                    {
                        m_CurrentWork = 0;
                        if(m_CurrentRounds == this->getRounds())
                        {
                            this->setCurrentStage(static_cast<int>(ETomatoStage::LongRest));
                            emit tomatoTips(static_cast<int>(ETomatoStage::LongRest));
                        }
                        else
                        {
                            this->setCurrentStage(static_cast<int>(ETomatoStage::ShortRest));
                            emit tomatoTips(static_cast<int>(ETomatoStage::ShortRest));
                        }
                    }
                    break;
                case ETomatoStage::ShortRest:
                    m_CurrentShortRest += TOMATO_THREAD_CYCLE;
                    if(m_CurrentShortRest >= this->getShortRest() * 60 * 1000)
                    {
                        m_CurrentShortRest = 0;
                        this->setCurrentStage(static_cast<int>(ETomatoStage::Work));
                        m_CurrentRounds++;
                    }
                    break;
                case ETomatoStage::LongRest:
                    m_CurrentLongRest += TOMATO_THREAD_CYCLE;
                    if(m_CurrentLongRest >= this->getLongRest() * 60 * 1000)
                    {
                        m_CurrentLongRest = 0;
                        if(m_CurrentRounds == this->getRounds())
                        {
                            this->setCurrentStage(static_cast<int>(ETomatoStage::Finish));
                            emit tomatoTips(static_cast<int>(ETomatoStage::Finish));
                        }
                        else
                        {
                            this->setCurrentStage(static_cast<int>(ETomatoStage::Work));
                        }
                    }
                    break;
                case ETomatoStage::Finish:
                    //结束
                    this->setTomatoThreadState(static_cast<int>(ETomatoState::stop));
                    break;
                }
            }
            emit tomatoTimeUpdate();
        }
    });
}

void CTomatoThread::pause()
{
    QMutexLocker locker(&m_Mutex);
    this->setTomatoThreadState(static_cast<int>(ETomatoState::pause));
}

void CTomatoThread::resume()
{
    QMutexLocker locker(&m_Mutex);
    this->setTomatoThreadState(static_cast<int>(ETomatoState::start));
}

void CTomatoThread::stop()
{
    {
        QMutexLocker locker(&m_Mutex);
        this->setTomatoThreadState(static_cast<int>(ETomatoState::stop));
    }

    if (m_TomatoThreadFuture.isRunning())
    {
        m_TomatoThreadFuture.waitForFinished();
    }
}

void CTomatoThread::backward()
{
    QMutexLocker locker(&m_Mutex);
    if(m_CurrentRounds > 1)
    {
        m_CurrentRounds--;

        m_CurrentWork = 0;
        m_CurrentShortRest = 0;
        m_CurrentLongRest = 0;

        this->setCurrentStage(static_cast<int>(ETomatoStage::Work));
    }
}

void CTomatoThread::forward()
{
    QMutexLocker locker(&m_Mutex);
    if(m_CurrentRounds < this->getRounds())
    {
        m_CurrentRounds++;

        m_CurrentWork = 0;
        m_CurrentShortRest = 0;
        m_CurrentLongRest = 0;

        this->setCurrentStage(static_cast<int>(ETomatoStage::Work));
    }
}

void CTomatoThread::settingsReset()
{
    QMutexLocker locker(&m_Mutex);

    this->setWork(25);
    this->setShortRest(5);
    this->setLongRest(20);
    this->setRounds(4);
}

void CTomatoThread::timeReset()
{
    QMutexLocker locker(&m_Mutex);

    this->setCurrentStage(static_cast<int>(ETomatoStage::Work));

    m_CurrentWork = 0;
    m_CurrentShortRest = 0;
    m_CurrentLongRest = 0;
    m_CurrentRounds = 1;
}

int CTomatoThread::getCurrentRounds() const
{
    return m_CurrentRounds;
}

int CTomatoThread::getCurrentTime() const
{
    switch (static_cast<ETomatoStage>(this->getCurrentStage()))
    {
    case ETomatoStage::Work:return m_CurrentWork;
    case ETomatoStage::ShortRest:return m_CurrentShortRest;
    case ETomatoStage::LongRest:return m_CurrentLongRest;
    default:return 0;
    }
}

QString CTomatoThread::configFilePath()
{
    return GSF_Def::AppConfig("TomatoConfig.ini");
}
