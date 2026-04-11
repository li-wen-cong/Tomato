#ifndef CELEMENTSTYLECOLOR_H
#define CELEMENTSTYLECOLOR_H

#include <QColor>
#include <QObject>

#include "PM_Def.h"

class CElementStyleColor : public QObject
{
    Q_OBJECT

    //品牌色
    Q_PROPERTY_AUTO(QColor,BrandDark)               //深色态：按钮 pressed / active 边框
    Q_PROPERTY_AUTO(QColor,BrandBase)               //主色：Primary 按钮 / 链接 / 选中项
    Q_PROPERTY_AUTO(QColor,BrandLight)              //Hover
    Q_PROPERTY_AUTO(QColor,BrandLighter)            //弱高亮：浅选中背景 / tag
    Q_PROPERTY_AUTO(QColor,BrandExtraLight)         //极弱：选中背景填充 / focus glow

    //成功
    Q_PROPERTY_AUTO(QColor,SuccessDark)             //成功按钮 pressed / 边框
    Q_PROPERTY_AUTO(QColor,SuccessBase)             //成功状态 / 成功按钮
    Q_PROPERTY_AUTO(QColor,SuccessLight)            //Hover / 轻提示
    Q_PROPERTY_AUTO(QColor,SuccessLighter)          //成功背景填充
    Q_PROPERTY_AUTO(QColor,SuccessExtraLight)       //成功提示背景（Toast / Tip）

    //警告
    Q_PROPERTY_AUTO(QColor,WarningDark)             //警告按钮 pressed
    Q_PROPERTY_AUTO(QColor,WarningBase)             //警告图标 / 文本
    Q_PROPERTY_AUTO(QColor,WarningLight)            //Hover
    Q_PROPERTY_AUTO(QColor,WarningLighter)          //警告背景
    Q_PROPERTY_AUTO(QColor,WarningExtraLight)       //警告提示背景

    //危险的
    Q_PROPERTY_AUTO(QColor,DangerDark)              //危险按钮 pressed
    Q_PROPERTY_AUTO(QColor,DangerBase)              //错误状态 / 删除按钮
    Q_PROPERTY_AUTO(QColor,DangerLight)             //Hover
    Q_PROPERTY_AUTO(QColor,DangerLighter)           //错误背景
    Q_PROPERTY_AUTO(QColor,DangerExtraLight)        //错误提示背景

    //信息
    Q_PROPERTY_AUTO(QColor,InfoDark)                //信息按钮 pressed
    Q_PROPERTY_AUTO(QColor,InfoBase)                //信息状态 / 删除按钮
    Q_PROPERTY_AUTO(QColor,InfoLight)               //Hover
    Q_PROPERTY_AUTO(QColor,InfoLighter)             //信息背景
    Q_PROPERTY_AUTO(QColor,InfoExtraLight)          //信息提示背景

    //文字
    Q_PROPERTY_AUTO(QColor,TextPrimary)             //标题 / 主要内容 / Button 文本
    Q_PROPERTY_AUTO(QColor,TextRegular)             //正文 / 表格内容
    Q_PROPERTY_AUTO(QColor,TextSecondary)           //描述文字 / 注释
    Q_PROPERTY_AUTO(QColor,TextPlaceholder)         //输入框 placeholder
    Q_PROPERTY_AUTO(QColor,TextDisabled)            //禁用状态文本

    //边框
    Q_PROPERTY_AUTO(QColor,BorderDarker)            //强边框：focus / active
    Q_PROPERTY_AUTO(QColor,BorderDark)              //常规边框（按钮 / 输入框）
    Q_PROPERTY_AUTO(QColor,BorderBase)              //分割线 / 表格线
    Q_PROPERTY_AUTO(QColor,BorderLight)             //弱分割线
    Q_PROPERTY_AUTO(QColor,BorderLighter)           //极弱分割
    Q_PROPERTY_AUTO(QColor,BorderExtraLight)        //几乎不可见线

    //填充色
    Q_PROPERTY_AUTO(QColor,FillDarker)              //pressed / selected 填充
    Q_PROPERTY_AUTO(QColor,FillDark)                //hover 填充
    Q_PROPERTY_AUTO(QColor,FillBase)                //默认控件背景（Button / Input）
    Q_PROPERTY_AUTO(QColor,FillLight)               //禁用背景
    Q_PROPERTY_AUTO(QColor,FillLighter)             //次级区域
    Q_PROPERTY_AUTO(QColor,FillExtraLight)          //最底层
    Q_PROPERTY_AUTO(QColor,FillBlank)               //空白占位 / 容器底色

    //背景颜色
    Q_PROPERTY_AUTO(QColor,BackgroundPage)          //页面背景,应用整体背景
    Q_PROPERTY_AUTO(QColor,BackgroundBase)          //卡片 面板
    Q_PROPERTY_AUTO(QColor,BackgroundOverlay)       //Dialog / Popup / Menu 弹出层

    //基础颜色
    Q_PROPERTY_AUTO(QColor,Black)
    Q_PROPERTY_AUTO(QColor,White)
    Q_PROPERTY_AUTO(QColor,Transparent)
public:
    explicit CElementStyleColor(QObject *parent = nullptr);

    enum Theme
    {
        Light,
        Dark,
        Tomato
    };

public slots:
    void init(int theme);

private:
    void LightTheme();
    void DarkTheme();
    void TomatoTheme();

};

#endif // CELEMENTSTYLECOLOR_H
