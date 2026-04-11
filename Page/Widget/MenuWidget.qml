import QtQuick 2.0

import "../../GSF_Controls/Text"
import "../../GSF_Controls/Icon"
Rectangle
{
    id:root
    property bool isSelect: false
    property alias source: icon.source
    property alias text: body.text

    signal clicked

    property bool isHover:false

    color: isHover ? cColor.BrandLight : isSelect ? cColor.BrandExtraLight : cColor.Transparent
    radius: cStyle.RadiusDefault
    GSF_Icon_SVG
    {
        id:icon
        width: 20 * cStyle.DPI
        height: width
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: cStyle.SpacingLarge
        color: itemColor
    }
    GSF_Text_Default
    {
        id:body
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20 * cStyle.DPI + cStyle.SpacingLarge + cStyle.SpacingDefault
        color: itemColor
    }
    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: isHover = true
        onExited:isHover = false
        onClicked:
        {
            root.clicked()
        }
    }

    property color itemColor: isHover || isSelect ? cColor.TextPrimary : cColor.TextRegular
}
