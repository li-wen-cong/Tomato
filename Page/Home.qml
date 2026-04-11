import QtQuick 2.12

import "./Widget"
import "../GSF_Controls/Button"
import "../GSF_Controls/Text"

import GSF_Controls 1.0

FocusScope
{
    id:root

    Component.onCompleted:
    {
        init()
    }

    function timeTransition(ms)
    {
        if (ms <= 0)
        {
            return "00:00";
        }

        var totalSeconds = Math.floor(ms / 1000);
        var minutes = Math.floor(totalSeconds / 60);
        var seconds = totalSeconds % 60;

        var minutesStr = minutes.toString().padStart(2, '0');
        var secondsStr = seconds.toString().padStart(2, '0');

        return minutesStr + ":" + secondsStr;
    }

    function init()
    {
        cTomato.Work = GSF_Global.config.tomato.workDuration
        cTomato.ShortRest = GSF_Global.config.tomato.shortRestDuration
        cTomato.LongRest = GSF_Global.config.tomato.longRestDuration
        cTomato.Rounds = GSF_Global.config.tomato.rounds

        annulusProgressBar.to = cTomato.Work * 60 * 1000
        annulusProgressBar.stage = qsTr("Work")
        annulusProgressBar.value = 0
        annulusProgressBar.time = String("%1/%2").arg(timeTransition(annulusProgressBar.value))
                                                 .arg(timeTransition(annulusProgressBar.to))

        rounds.text = String("%3:%1/%2").arg(cTomato.getCurrentRounds())
                                        .arg(cTomato.Rounds)
                                        .arg(qsTr("Rounds"))
    }

    Connections
    {
        target: cTomato
        onTomatoTimeUpdate:
        {
            switch(cTomato.CurrentStage)
            {
            case 0:
                annulusProgressBar.to = cTomato.Work * 60 * 1000
                annulusProgressBar.stage = qsTr("Work")
                break;
            case 1:
                annulusProgressBar.to = cTomato.ShortRest * 60 * 1000
                annulusProgressBar.stage = qsTr("Short Rest")
                break;
            case 2:
                annulusProgressBar.to = cTomato.LongRest * 60 * 1000
                annulusProgressBar.stage = qsTr("Long Rest")
                break;
            }

            annulusProgressBar.value = cTomato.getCurrentTime()
            annulusProgressBar.time = String("%1/%2").arg(timeTransition(annulusProgressBar.value))
                                                     .arg(timeTransition(annulusProgressBar.to))

            rounds.text = String("%3:%1/%2").arg(cTomato.getCurrentRounds())
                                            .arg(cTomato.Rounds)
                                            .arg(qsTr("Rounds"))
        }
        onTomatoTips:
        {
            switch(tips)
            {
            case 1://短休息
                GSF_Global.singleTrayIcon.showNotification(GSF_Global.config.tips.title, GSF_Global.config.tips.shortRest)
                break;
            case 2://长休息
                GSF_Global.singleTrayIcon.showNotification(GSF_Global.config.tips.title, GSF_Global.config.tips.longRest)
                break;
            case 3://结束
                GSF_Global.singleTrayIcon.showNotification(GSF_Global.config.tips.title, GSF_Global.config.tips.finish)
                break;
            }
        }
    }

    AnnulusProgressBar
    {
        id:annulusProgressBar
        width: parent.width * 0.7
        height: width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.1
        time: "23:00/25:00"
        from: 0
        stage:
        {
            switch(cTomato.CurrentStage)
            {
            case 0:
                return qsTr("Work")
            case 1:
                return qsTr("Short Rest ")
            case 2:
                return qsTr("Long Rest")
            }
        }
    }
    GSF_Text_Large
    {
        id:rounds
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: annulusProgressBar.bottom
        anchors.topMargin: cStyle.SpacingLarge
        font.bold: true
        color: annulusProgressBar.valueColor
        font.pixelSize: (annulusProgressBar.canvasWidth - annulusProgressBar.lineWidth) / 8;
    }
    Rectangle
    {
        color: cColor.BackgroundOverlay
        width: parent.width * 0.95
        height: parent.height * 0.15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: cStyle.SpacingDefault
        radius: cStyle.RadiusDefault

        GSF_Button_Image
        {
            source: "qrc:/res/18_Reset.svg"
            width:root.width * 0.08
            height: width
            round:true
            plain:true
            theme:GSF_Button_Image.Variant.Danger
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: cStyle.SpacingLarge
            onClicked:
            {
                cTomato.stop()
                cTomato.timeReset()
            }
        }

        Row
        {
            anchors.centerIn: parent
            spacing: cStyle.SpacingDefault
            GSF_Button_Image
            {
                source: "qrc:/res/16_Left.svg"
                width:root.width * 0.08
                height: width
                round:true
                plain:true
                theme:GSF_Button_Image.Variant.Info
                anchors.verticalCenter: parent.verticalCenter
                tip:qsTr("Backward")
                onClicked:
                {
                    cTomato.backward()
                }
            }
            GSF_Button_Image
            {
                source:
                {
                    switch(cTomato.TomatoThreadState)
                    {
                    case 0:
                        return "qrc:/res/14_Pause.svg"
                    case 1:
                    case 2:
                        return "qrc:/res/13_Start.svg"
                    }
                }
                width:root.width * 0.13
                height: width
                round:true
                plain:true
                theme:GSF_Button_Image.Variant.Success
                onClicked:
                {
                    switch(cTomato.TomatoThreadState)
                    {
                    case 0:
                        cTomato.pause()
                        break;
                    case 1:
                        cTomato.resume()
                        break
                    case 2:
                        cTomato.start()
                        break
                    }
                }
            }
            GSF_Button_Image
            {
                source: "qrc:/res/17_Right.svg"
                width:root.width * 0.08
                height: width
                round:true
                plain:true
                theme:GSF_Button_Image.Variant.Info
                anchors.verticalCenter: parent.verticalCenter
                tip:qsTr("Forward")
                onClicked:
                {
                    cTomato.forward()
                }
            }
        }
    }
}
