import QtQuick 2.12
import GSF_Controls 1.0

import "../Text"

Item
{
    id: root

    signal toggled(bool checked)

    width: label.width + boxSize + spacing
    height: Math.max(label.height, boxSize)
    // 自定义属性
    property bool checked: false
    property int boxSize: cStyle.DPI * 10
    property int spacing: cStyle.DPI * 4

    property alias text: label.text
    property alias radius: checkbox.radius
    property alias font: label.font
    // 点击区域
    MouseArea
    {
        id:_MouseArea
        anchors.fill: parent
        onClicked:
        {
            root.checked = !root.checked
            root.toggled(root.checked)
        }
        cursorShape: Qt.PointingHandCursor
    }

    // 勾选框
    Rectangle
    {
        id: checkbox
        width: boxSize
        height: boxSize
        radius: root.radius
        border.color: root.enabled ? cColor.BrandBase : cColor.BorderBase
        color: cColor.BackgroundBase
        anchors.verticalCenter: parent.verticalCenter
        Text
        {
            text: root.checked ? "\u2713" : ""   // ✓ Unicode: U+2713
            anchors.centerIn: parent
            font.pixelSize: boxSize
            font.bold: true
            color: cColor.TextPrimary
        }
    }

    // 文本
    GSF_Text_Default
    {
        id: label
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: checkbox.right
        anchors.leftMargin: spacing
        color: root.enabled ? cColor.TextPrimary : cColor.TextDisabled
    }
}
