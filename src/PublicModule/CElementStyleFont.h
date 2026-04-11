#ifndef CELEMENTSTYLEFONT_H
#define CELEMENTSTYLEFONT_H

#include <QFont>
#include <QObject>

#include "PM_Def.h"

class CElementStyleFont : public QObject
{
    Q_OBJECT

    Q_PROPERTY_AUTO(QFont,Large)            //大

    Q_PROPERTY_AUTO(QFont,DefaultFont)      //默认
    Q_PROPERTY_AUTO(QFont,Small)            //小

    Q_PROPERTY_AUTO(QFont,Title)            //标题

public:
    explicit CElementStyleFont(QObject *parent = nullptr);

public slots:
    void init(int Large = 12,int DefaultFont = 8,int Small = 8 ,int Title = 10);
};

#endif // CELEMENTSTYLEFONT_H
