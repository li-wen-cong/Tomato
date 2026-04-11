import QtQuick 2.12
import QtQuick.Controls 2.12

import "../../GSF_Controls/Text"
import "../../GSF_Controls/Button"
import "../../GSF_Controls/Slider"
import "../../GSF_Controls/ComboBox"
import "../../GSF_Controls/Input"

import GSF_Controls 1.0

Item
{
    id:root
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
                height: 35 * cStyle.DPI
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
            Item
            {
                width: root.width
                height: cStyle.SpacingDefault * 2
            }
            GSF_Text_Title
            {
                text: qsTr("Tips")
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
                    height: 35 * cStyle.DPI
                    text: GSF_Global.config.tips.title
                }
                GSF_Text_Default
                {
                    text: qsTr("Short rest:")
                    width: parent.width * 0.8
                }
                GSF_TextArea
                {
                    width: parent.width
                    height: 70 * cStyle.DPI
                    text: GSF_Global.config.tips.shortRest
                }
                GSF_Text_Default
                {
                    text: qsTr("Long rest:")
                    width: parent.width * 0.8
                }
                GSF_TextArea
                {
                    width: parent.width
                    height: 70 * cStyle.DPI
                    text: GSF_Global.config.tips.longRest
                }
                GSF_Text_Default
                {
                    text: qsTr("Finish:")
                    width: parent.width * 0.8
                }
                GSF_TextArea
                {
                    width: parent.width
                    height: 70 * cStyle.DPI
                    text: GSF_Global.config.tips.finish
                }
            }
        }
    }
}

