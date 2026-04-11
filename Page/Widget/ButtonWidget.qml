import QtQuick 2.0

import "../../GSF_Controls/Icon"
import "../../GSF_Controls/Text"
import "../../GSF_Controls/ToolTip"

Rectangle
{
    id:root
    implicitHeight: 50 * cStyle.DPI
    implicitWidth: 50 * cStyle.DPI
    radius: cStyle.RadiusDefault

    property alias source: icon.source
    property alias iconColor: icon.color
    property bool isHover:false
    property double iconSize:0.5
    property alias text:tips.text
    property alias placement: tips.placement
    property bool hasSubMenu: false

    signal clicked

    GSF_Icon_SVG
    {
        id:icon
        width: parent.height * iconSize
        height: width
        anchors.centerIn: parent
    }
    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: isHover = true
        onExited: isHover = false
        onClicked:
        {
            tips.close()
            root.clicked()
        }
    }

    GSF_ToolTip
    {
        id:tips
        visible: root.isHover && text.length > 0
        delay: 200
    }
    Canvas {
        id: subMenuIndicator
        visible: root.hasSubMenu
        width: 6 * cStyle.DPI
        height: width
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 4 * cStyle.DPI
        onPaint:
        {
            var ctx = getContext("2d")
            ctx.clearRect(0, 0, width, height)
            ctx.fillStyle = cColor.TextPrimary
            ctx.beginPath()
            ctx.moveTo(width, 0)
            ctx.lineTo(0, height)
            ctx.lineTo(width, height)
            ctx.lineTo(width, 0)
            ctx.closePath()
            ctx.fill()
        }
    }
}
