import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import GSF_Controls 1.0

import "./Page"
import "./GSF_Controls"

ApplicationWindow
{
    id:applicationWindow
    visible: true
    width: 240
    height: 320
    title: qsTr("Hello World")
    flags : Qt.FramelessWindowHint | Qt.Window
    color: cColor.BackgroundPage

    Component.onCompleted:
    {
        GSF_Global.singleTrayIcon = trayIcon
        GSF_Global.config = configuration

        loader.setSource("qrc:/GSF_Controls/View/GSF_StackView.qml")

        cTomato.Work = configuration.tomato.workDuration
        cTomato.ShortRest = configuration.tomato.shortRestDuration
        cTomato.LongRest = configuration.tomato.longRestDuration
        cTomato.Rounds = configuration.tomato.rounds
    }

    FramelessWindow
    {
        anchors.fill: parent
        control: applicationWindow
        //页面堆栈
        Loader
        {
            id:loader
            width: parent.width - cStyle.SpacingSmall * 2
            height: parent.height - cStyle.SpacingSmall - 45 * cStyle.DPI
            source: ""
            anchors.bottom: parent.bottom
            anchors.bottomMargin: cStyle.SpacingSmall
            anchors.horizontalCenter: parent.horizontalCenter
            onLoaded:
            {
                GSF_Global.singleStackView.pushPage(Qt.resolvedUrl("qrc:/Page/Home.qml"),3,200)
            }
        }
    }

    TomatoSystemTrayIcon
    {
        id:trayIcon
    }
    Configuration
    {
        id:configuration
    }
}
