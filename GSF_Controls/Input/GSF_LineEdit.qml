import QtQuick 2.12
import QtQuick.Controls 2.12
import GSF_Controls 1.0

Item
{
    id: root

    property int radius: 0
    property string unix: ""       // 单位文本
    property alias text: textInput.text
    property alias font: textInput.font
    property alias horizontalAlignment: textInput.horizontalAlignment
    property alias inputMethodHints: textInput.inputMethodHints
    property alias color: textInput.color
    property alias backgroundItem: _background
    signal editingFinished()

    implicitWidth: 213
    implicitHeight: Math.max(42, textInput.implicitHeight + 2 * cStyle.DPI * 5)  // 动态高度

    Rectangle
    {
        id: _background
        anchors.fill: parent
        radius: root.radius
        color: root.enabled ? cColor.BackgroundBase : cColor.BorderBase
        border.color: textInput.activeFocus ? cColor.BrandDark : cColor.BorderBase
        border.width: 1
    }

    TextInput
    {
        id: textInput
        anchors
        {
            left: parent.left
            right: unixText.left
            verticalCenter: parent.verticalCenter
            leftMargin: cStyle.DPI * 2
            rightMargin: cStyle.DPI * 2
        }
        font: cFont.DefaultFont
        color: root.enabled ? cColor.InfoBase : cColor.InfoExtraLight
        selectedTextColor: cColor.InfoLight
        selectByMouse: true
        clip: true
        verticalAlignment: TextInput.AlignVCenter
        inputMethodHints: Qt.ImhPreferNumbers
        onEditingFinished: root.editingFinished()
        onActiveFocusChanged:
        {
            if (!focus)
            {
                root.editingFinished()
            }
        }
    }

    Text
    {
        id: unixText
        text: root.unix
        font: cFont.Small
        color: cColor.TextRegular
        anchors
        {
            right: parent.right
            rightMargin: cStyle.DPI * 2
            verticalCenter: parent.verticalCenter
        }
        visible: root.unix.length > 0
    }
}
