import QtQuick 2.0

import "../../GSF_Controls/Text"
import "../../GSF_Controls/Button"

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
        Item{height: 1;width: 1}
        GSF_Button_Horizontal
        {
            width: 120 * cStyle.DPI
            height: 40 * cStyle.DPI
            source: "qrc:/res/About.png"
            text: "@Github"
            theme:GSF_Button_Image.Variant.Primary
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked:
            {
                Qt.openUrlExternally("https://github.com/li-wen-cong/Tomato")
            }
        }
    }
}
