import QtQuick 2.0
import QtQuick.Window 2.0
import "../GSF_Controls/Drag"
import "../GSF_Controls/Icon"
import "../GSF_Controls/ToolTip"
import "../GSF_Controls/Text"

import "./Widget"

import GSF_Controls 1.0

FocusScope
{
    id:root
    property int lastX: x
    property int lastY: y
    property var control: parent

    property bool isHome:true



    Connections
    {
        target: cTomato
        onTomatoTimeUpdate:
        {
            rounds.text = String("%3:%1/%2").arg(cTomato.getCurrentRounds())
                                            .arg(cTomato.Rounds)
                                            .arg(qsTr("Rounds"))
        }
    }

    Rectangle
    {
        width: parent.width
        height: 26 * cStyle.DPI
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        color: cColor.BackgroundPage
        MouseArea {
            id: dragArea
            width: parent.width - cStyle.SpacingSmall * 2
            height: parent.height - cStyle.SpacingSmall
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            onPressed:
            {
                root.lastX = mouseX
                root.lastY = mouseY
            }
            onPositionChanged:
            {
                if(control.visibility === Window.Maximized)
                {
                    control.showNormal()
                }
                if (pressed)
                {
                    control.x += mouseX - root.lastX
                    control.y += mouseY - root.lastY
                }
            }
            onDoubleClicked:
            {
                if(control.visibility === Window.Maximized)
                {
                    control.showNormal()
                }
                else
                {
                    control.showMaximized()
                }
            }
        }
        GSF_Text_Default
        {
            id:rounds
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: cStyle.SpacingDefault
            visible:fixedButton.fixed
            color: cColor.BrandDark
        }

        ButtonWidget
        {
            height: 20 * cStyle.DPI
            width: 25 * cStyle.DPI
            color: isHover ? cColor.BrandBase : cColor.BackgroundPage
            source: isHome ? "qrc:/res/1_Menu.svg" : "qrc:/res/8_Home.svg"
            iconColor:cColor.BrandDark
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: cStyle.SpacingDefault
            visible:!fixedButton.fixed
            onClicked:
            {
                if(isHome)
                {
                    GSF_Global.singleStackView.pushPage(Qt.resolvedUrl("qrc:/Page/MenuPage.qml"),3,200)
                }
                else
                {
                    cTomato.Work = configuration.tomato.workDuration
                    cTomato.ShortRest = configuration.tomato.shortRestDuration
                    cTomato.LongRest = configuration.tomato.longRestDuration
                    cTomato.Rounds = configuration.tomato.rounds

                    GSF_Global.singleStackView.home()
                }
                isHome = !isHome
            }
        }
        Row
        {
            height: 20 * cStyle.DPI
            spacing: 0
            anchors.right: parent.right
            anchors.rightMargin: cStyle.SpacingSmall
            anchors.verticalCenter: parent.verticalCenter
            ButtonWidget
            {
                id:fixedButton
                height: parent.height
                width: 25 * cStyle.DPI
                color: isHover || fixed ? cColor.BrandBase : cColor.BackgroundPage
                source: "qrc:/res/19_Fixed.svg"
                iconColor:  cColor.BrandDark
                property bool fixed: false
                onClicked:
                {
                    if(!fixed)
                    {
                        //1、修改窗口属性
                        control.flags = control.flags | Qt.WindowStaysOnTopHint

                        //3、加载页面
                        GSF_Global.singleStackView.pushPage(Qt.resolvedUrl("qrc:/Page/Fixed.qml"),3,200)

                        //2、调整大小
                        applicationWindow.width = 135
                        applicationWindow.height = 90


                    }
                    else
                    {
                        //1、修改窗口属性
                        control.flags = control.flags & ~Qt.WindowStaysOnTopHint

                        //3、加载页面
                        GSF_Global.singleStackView.home()

                        //2、调整大小
                        applicationWindow.width = 240
                        applicationWindow.height = 320


                    }
                    fixed = !fixed
                }
            }
            ButtonWidget
            {
                height: parent.height
                width: 25 * cStyle.DPI
                color: isHover ? cColor.BrandBase : cColor.BackgroundPage
                source: "qrc:/res/7_Min.svg"
                iconColor:cColor.BrandDark
                visible:!fixedButton.fixed
                onClicked:
                {
                    if(control.visibility === Window.Maximized)
                    {
                        control.showNormal()
                    }
                    else
                    {
                        control.showMinimized()
                    }
                }
            }
            ButtonWidget
            {
                height: parent.height
                width: 25 * cStyle.DPI
                color: isHover ? cColor.DangerBase : cColor.BackgroundPage
                source: "qrc:/res/4_Close.svg"
                iconColor:cColor.BrandDark
                visible:!fixedButton.fixed
                onClicked:
                {
                    cApp.quit()
                }
            }
        }
    }
}
