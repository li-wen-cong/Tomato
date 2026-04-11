import QtQuick 2.0

import "../../GSF_Controls/Text"

Item
{
    id:root
    Column
    {
        width: parent.width
        spacing: cStyle.SpacingDefault
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.12
        Image
        {
            source: "qrc:/res/About.png"
            width: parent.width * 0.3
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
        }
        GSF_Text_Title
        {
            text: "Tomato"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        GSF_Text_Default
        {
            text: cAppInfo.version()
            anchors.horizontalCenter: parent.horizontalCenter
        }
        GSF_Text_Default
        {
            text: cAppInfo.build()
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
