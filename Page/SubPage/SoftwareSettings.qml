import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.12

import "../../GSF_Controls/Text"
import "../../GSF_Controls/Button"
import "../../GSF_Controls/Slider"
import "../../GSF_Controls/ComboBox"
import "../../GSF_Controls/Input"

import GSF_Controls 1.0

Item
{
    id:root

    property bool loadingCompleted:false
    SoundEffect
    {
        id:soundEffect
        source: "qrc:/res/wav/Comic - Birds taking off.wav"
    }
    ScrollView
    {
        anchors.fill: parent
        Column
        {
            spacing: cStyle.SpacingSmall
            Item
            {
                width: root.width
                height: cStyle.SpacingDefault
            }
            GSF_Text_Title
            {
                text: qsTr("Settings")
                width: parent.width * 0.9
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Row
            {
                width: root.width * 0.8
                height: 18 * cStyle.DPI
                anchors.horizontalCenter: parent.horizontalCenter
                GSF_Text_Default
                {
                    width: parent.width * 0.3
                    text: qsTr("Theme")
                    anchors.verticalCenter: parent.verticalCenter
                }
                GSF_ComboBox
                {
                    width: parent.width * 0.7
                    height: parent.height
                    model: ["Light","Dark","Tomato"]
                    currentIndex: GSF_Global.config.settings.theme
                    onCurrentIndexChanged:
                    {
                        GSF_Global.config.settings.theme = currentIndex
                        cColor.init(currentIndex)
                    }
                }
            }
            Row
            {
                width: root.width * 0.8
                height: 18 * cStyle.DPI
                anchors.horizontalCenter: parent.horizontalCenter
                GSF_Text_Default
                {
                    width: parent.width * 0.3
                    text: qsTr("Ringtone")
                    anchors.verticalCenter: parent.verticalCenter
                }
                GSF_ComboBox
                {
                    width: parent.width * 0.7
                    height: parent.height
                    model: ["Comic - Birds taking off",
                        "Jesus College Clock",
                        "Cuckoo only",
                        "Cuckoo & chimes"]
                    currentIndex: GSF_Global.config.settings.loop
                    onCurrentIndexChanged:
                    {
                        if(!loadingCompleted)
                        {
                            loadingCompleted = true
                            return
                        }
                        soundEffect.stop()
                        soundEffect.loops = 1
                        GSF_Global.config.settings.ringtone = currentIndex

                        switch(GSF_Global.config.settings.ringtone)
                        {
                        case 0:
                            soundEffect.source = "qrc:/res/wav/Comic - Birds taking off.wav"
                            break
                        case 1:
                            soundEffect.source = "qrc:/res/wav/Jesus College Clock.wav"
                            break
                        case 2:
                            soundEffect.source = "qrc:/res/wav/Cuckoo only.wav"
                            break
                        case 3:
                            soundEffect.source = "qrc:/res/wav/Cuckoo & chimes.wav"
                            break
                        }
                        soundEffect.volume = GSF_Global.config.settings.volume
                        soundEffect.play()

                    }
                }
            }
            Row
            {
                width: root.width * 0.8
                height: 18 * cStyle.DPI
                anchors.horizontalCenter: parent.horizontalCenter
                GSF_Text_Default
                {
                    width: parent.width * 0.3
                    text: qsTr("Loops")
                    anchors.verticalCenter: parent.verticalCenter
                }
                GSF_ComboBox
                {
                    width: parent.width * 0.7
                    height: parent.height
                    model: ["1","2","3","4","5"]
                    currentIndex: GSF_Global.config.settings.loop - 1
                    onCurrentIndexChanged:
                    {
                        GSF_Global.config.settings.loop = currentIndex + 1
                    }
                }
            }

            Item
            {
                width: root.width
                height: cStyle.SpacingDefault * 2
            }
            GSF_Text_Title
            {
                text: qsTr("Tips text")
                width: parent.width * 0.9
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Column
            {
                width: root.width * 0.8
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: cStyle.SpacingSmall
                GSF_Text_Default
                {
                    text: qsTr("Title:")
                }
                GSF_TextArea
                {
                    width: parent.width
                    height: 18 * cStyle.DPI
                    text: GSF_Global.config.tips.title
                    onEditingFinished:
                    {
                        GSF_Global.config.tips.title = text
                    }
                }
                GSF_Text_Default
                {
                    text: qsTr("Short rest:")
                    width: parent.width * 0.8
                }
                GSF_TextArea
                {
                    width: parent.width
                    height: 35 * cStyle.DPI
                    text: GSF_Global.config.tips.shortRest
                    onEditingFinished:
                    {
                        GSF_Global.config.tips.shortRest = text
                    }
                }
                GSF_Text_Default
                {
                    text: qsTr("Long rest:")
                    width: parent.width * 0.8
                }
                GSF_TextArea
                {
                    width: parent.width
                    height: 35 * cStyle.DPI
                    text: GSF_Global.config.tips.longRest
                    onEditingFinished:
                    {
                        GSF_Global.config.tips.longRest = text
                    }
                }
                GSF_Text_Default
                {
                    text: qsTr("Finish:")
                    width: parent.width * 0.8
                }
                GSF_TextArea
                {
                    width: parent.width
                    height: 35 * cStyle.DPI
                    text: GSF_Global.config.tips.finish
                    onEditingFinished:
                    {
                        GSF_Global.config.tips.finish = text
                    }
                }
            }
            Item
            {
                width: root.width
                height: cStyle.SpacingDefault
            }
        }
    }
}

