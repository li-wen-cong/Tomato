import QtQuick 2.0
import QtQuick.Window 2.0
import "../GSF_Controls/Drag"
import "../GSF_Controls/Icon"
import "../GSF_Controls/ToolTip"

import "./Widget"

import GSF_Controls 1.0

FocusScope
{
    id:root
    property int lastX: x
    property int lastY: y
    property var control: parent

    property bool isHome:true
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
                        control.flags = control.flags | Qt.WindowStaysOnTopHint
                    }
                    else
                    {
                        control.flags = control.flags & ~Qt.WindowStaysOnTopHint
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
                onClicked:
                {
                    cApp.quit()
                }
            }
        }
    }
}
