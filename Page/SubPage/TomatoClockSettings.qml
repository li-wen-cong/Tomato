import QtQuick 2.12

import "../../GSF_Controls/Text"
import "../../GSF_Controls/Button"
import "../../GSF_Controls/Slider"

import GSF_Controls 1.0

Item
{
    Column
    {
        width: parent.width
        anchors.centerIn: parent
        spacing: cStyle.SpacingSmall
        GSF_Text_Default
        {
            text: qsTr("Work")
            anchors.horizontalCenter: parent.horizontalCenter
        }
        GSF_Button
        {
            text: String("%1:00").arg(workDuration.value)
            width: parent.width * 0.2
            height: 15 * cStyle.DPI
            anchors.horizontalCenter: parent.horizontalCenter
            theme: GSF_Button.Variant.Primary
            plain:true
        }
        Row
        {
            width: parent.width
            height: 10 * cStyle.DPI
            GSF_Text_Small
            {
                width: parent.width * 0.2
                height: parent.height
                text: String("%1:00").arg(workDuration.from)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            GSF_Slider
            {
                id:workDuration
                width: parent.width * 0.6
                theme: GSF_Slider.Variant.Primary
                from: 10
                to:90
                stepSize: 1
                value: GSF_Global.config.tomato.workDuration
                anchors.verticalCenter: parent.verticalCenter
                onValueChanged:
                {
                    GSF_Global.config.tomato.workDuration = value
                }
            }
            GSF_Text_Small
            {
                width: parent.width * 0.2
                height: parent.height
                text: String("%1:00").arg(workDuration.to)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        GSF_Text_Default
        {
            text: qsTr("Short Rest")
            anchors.horizontalCenter: parent.horizontalCenter
        }
        GSF_Button
        {
            text: String("%1:00").arg(shortRestDuration.value)
            width: parent.width * 0.2
            height: 15 * cStyle.DPI
            anchors.horizontalCenter: parent.horizontalCenter
            theme: GSF_Button.Variant.Success
            plain:true
        }
        Row
        {
            width: parent.width
            height: 10 * cStyle.DPI
            GSF_Text_Small
            {
                width: parent.width * 0.2
                height: parent.height
                text: String("%1:00").arg(shortRestDuration.from)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            GSF_Slider
            {
                id:shortRestDuration
                width: parent.width * 0.6
                theme: GSF_Slider.Variant.Success
                from: 3
                to:60
                stepSize: 1
                value: GSF_Global.config.tomato.shortRestDuration
                anchors.verticalCenter: parent.verticalCenter
                onValueChanged:
                {
                    GSF_Global.config.tomato.shortRestDuration = value
                }
            }
            GSF_Text_Small
            {
                width: parent.width * 0.2
                height: parent.height
                text: String("%1:00").arg(shortRestDuration.to)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        GSF_Text_Default
        {
            text: qsTr("Long Rest")
            anchors.horizontalCenter: parent.horizontalCenter
        }
        GSF_Button
        {
            text: String("%1:00").arg(longRestDuration.value)
            width: parent.width * 0.2
            height: 15 * cStyle.DPI
            anchors.horizontalCenter: parent.horizontalCenter
            theme: GSF_Button.Variant.Warning
            plain:true
        }
        Row
        {
            width: parent.width
            height: 10 * cStyle.DPI
            GSF_Text_Small
            {
                width: parent.width * 0.2
                height: parent.height
                text: String("%1:00").arg(longRestDuration.from)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            GSF_Slider
            {
                id:longRestDuration
                width: parent.width * 0.6
                theme: GSF_Slider.Variant.Warning
                from: 5
                to:90
                stepSize: 1
                value: GSF_Global.config.tomato.longRestDuration
                anchors.verticalCenter: parent.verticalCenter
                onValueChanged:
                {
                    GSF_Global.config.tomato.longRestDuration = value
                }
            }
            GSF_Text_Small
            {
                width: parent.width * 0.2
                height: parent.height
                text: String("%1:00").arg(longRestDuration.to)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        GSF_Text_Default
        {
            text: qsTr("Rounds")
            anchors.horizontalCenter: parent.horizontalCenter
        }
        GSF_Button
        {
            text: String("%1:00").arg(rounds.value)
            width: parent.width * 0.2
            height: 15 * cStyle.DPI
            anchors.horizontalCenter: parent.horizontalCenter
            theme: GSF_Button.Variant.Info
            plain:true
        }
        Row
        {
            width: parent.width
            height: 10 * cStyle.DPI
            GSF_Text_Small
            {
                width: parent.width * 0.2
                height: parent.height
                text: String("%1:00").arg(rounds.from)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            GSF_Slider
            {
                id:rounds
                width: parent.width * 0.6
                theme: GSF_Slider.Variant.Info
                from: 1
                to:10
                stepSize: 1
                value: GSF_Global.config.tomato.rounds
                anchors.verticalCenter: parent.verticalCenter
                onValueChanged:
                {
                    GSF_Global.config.tomato.rounds = value
                }
            }
            GSF_Text_Small
            {
                width: parent.width * 0.2
                height: parent.height
                text: String("%1:00").arg(rounds.to)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        Item
        {
            width: 1
            height: cStyle.SpacingDefault * 2
        }
        GSF_Button
        {
            text: qsTr("Reset Defaults")
            width: 75 * cStyle.DPI
            height: 20 * cStyle.DPI
            anchors.horizontalCenter: parent.horizontalCenter
            theme: GSF_Button.Variant.Danger
            plain:true
            onClicked:
            {
                GSF_Global.config.tomato.workDuration = 25
                GSF_Global.config.tomato.shortRestDuration = 5
                GSF_Global.config.tomato.longRestDuration = 15
                GSF_Global.config.tomato.rounds = 4

                cTomato.Work = GSF_Global.config.tomato.workDuration
                cTomato.ShortRest = GSF_Global.config.tomato.shortRestDuration
                cTomato.LongRest = GSF_Global.config.tomato.longRestDuration
                cTomato.Rounds = GSF_Global.config.tomato.rounds

                workDuration.value = GSF_Global.config.tomato.workDuration
                shortRestDuration.value = GSF_Global.config.tomato.shortRestDuration
                longRestDuration.value = GSF_Global.config.tomato.longRestDuration
                rounds.value = GSF_Global.config.tomato.rounds
            }
        }
    }
}

