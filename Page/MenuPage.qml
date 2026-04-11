import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

import GSF_Controls 1.0

import "../GSF_Controls/Button"
import "../GSF_Controls/Text"
import "../GSF_Controls/Icon"

import "./SubPage"

Rectangle
{
    id:root
    color: cColor.BackgroundBase
    property var tabBarModel:
    [
        {name:qsTr("Tomato"),icon:"qrc:/res/10_Tomato.svg"},
        {name:qsTr("Settings"),icon:"qrc:/res/11_Settings.svg"},
        {name:qsTr("About"),icon:"qrc:/res/12_About.svg"}
    ]

    TabBar
    {
        id:tabBar
        width: parent.width
        height: 50 * cStyle.DPI
        anchors.bottom: parent.bottom
        background: Rectangle
        {
            radius:cStyle.RadiusLarge
            color:cColor.BackgroundPage
        }
        Repeater
        {
            id:repeater
            model: tabBarModel
            TabButton
            {
                anchors.top: parent.top
                height: 50 * cStyle.DPI
                background: FocusScope
                {
                    Rectangle
                    {
                        anchors.fill: parent
                        color:cColor.BackgroundPage
                        Rectangle
                        {
                            width: parent.width * 0.8
                            height: 3
                            color:swipeView.currentIndex === index ? cColor.BrandDark : cColor.Transparent
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
                contentItem:FocusScope
                {
                    GSF_Icon_SVG
                    {
                        id:_icon
                        width: 24 * cStyle.DPI
                        height: width
                        anchors.verticalCenter: parent.verticalCenter
                        source: modelData.icon
                        color:swipeView.currentIndex === index ? cColor.BrandDark : cColor.TextPrimary
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.horizontalCenterOffset: -_text.contentWidth / 2 - cStyle.SpacingSmall
                    }
                    GSF_Text_Title
                    {
                        id:_text
                        text:modelData.name
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenterOffset: 12 * cStyle.DPI + cStyle.SpacingSmall
                    }
                }
            }
        }
    }
    SwipeView
    {
        id:swipeView
        width: parent.width
        height: parent.height - 50 * cStyle.DPI
        anchors.top: parent.top
        currentIndex: tabBar.currentIndex
        clip: true
        TomatoClockSettings
        {
        }
        SoftwareSettings
        {
        }
        SoftwareInformation
        {
        }
    }
}
