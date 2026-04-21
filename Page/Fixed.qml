import QtQuick 2.12

import "./Widget"
import "../GSF_Controls/Button"
import "../GSF_Controls/Text"
import "../GSF_Controls/Slider"

import GSF_Controls 1.0

FocusScope
{
    id:root

    function init()
    {
        annulusProgressBar.to = cTomato.Work * 60 * 1000
        annulusProgressBar.stage = qsTr("Work")
        annulusProgressBar.value = 0
        annulusProgressBar.time = String("%1/%2").arg(GSF_Global.timeTransition(annulusProgressBar.value))
                                                 .arg(GSF_Global.timeTransition(annulusProgressBar.to))
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
            annulusProgressBar.time = String("%1/%2").arg(GSF_Global.timeTransition(annulusProgressBar.value))
                                                     .arg(GSF_Global.timeTransition(annulusProgressBar.to))

        }
    }

    AnnulusProgressBar
    {
        id:annulusProgressBar
        width: parent.height
        height: width
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: cStyle.SpacingDefault
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
    Grid
    {
        width: (parent.width * 0.9 - cStyle.SpacingDefault * 2) / 2
        anchors.right: parent.right
        anchors.rightMargin: cStyle.SpacingDefault
        anchors.verticalCenter: parent.verticalCenter
        rows: 2
        columns: 2
        spacing: cStyle.SpacingSmall
        GSF_Button_Image
        {
            source: "qrc:/res/16_Left.svg"
            width:(parent.width - cStyle.SpacingSmall) / 2
            height: width
            round:true
            plain:true
            theme:GSF_Button_Image.Variant.Info
            tip:qsTr("Backward")
            onClicked:
            {
                cTomato.backward()
            }
        }
        GSF_Button_Image
        {
            source: "qrc:/res/17_Right.svg"
            width:(parent.width - cStyle.SpacingSmall) / 2
            height: width
            round:true
            plain:true
            theme:GSF_Button_Image.Variant.Info
            tip:qsTr("Forward")
            onClicked:
            {
                cTomato.forward()
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
            width:(parent.width - cStyle.SpacingSmall) / 2
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
            source: "qrc:/res/18_Reset.svg"
            width:(parent.width - cStyle.SpacingSmall) / 2
            height: width
            round:true
            plain:true
            theme:GSF_Button_Image.Variant.Danger
            onClicked:
            {
                cTomato.stop()
                cTomato.timeReset()
            }
        }
    }
}
