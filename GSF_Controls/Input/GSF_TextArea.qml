import QtQuick 2.12
import QtQuick.Controls 2.12
import GSF_Controls 1.0

Item
{
    id: root

    property int radius: 0
    property alias text: textArea.text
    property alias font: textArea.font
    property alias horizontalAlignment: textArea.horizontalAlignment
    property alias inputMethodHints: textArea.inputMethodHints
    property alias color: textArea.color
    property alias backgroundItem: _background
    property alias wrapMode: textArea.wrapMode
    property alias textArea: textArea
    signal editingFinished()

    implicitWidth: 213
    implicitHeight: Math.max(42, textArea.implicitHeight + 2 * cStyle.DPI * 5)

    Rectangle
    {
        id: _background
        anchors.fill: parent
        radius: root.radius
        color: root.enabled ? cColor.BackgroundBase : cColor.BorderBase
        border.color: textArea.activeFocus ? cColor.BrandDark : cColor.BorderBase
        border.width: 1
    }

    ScrollView
    {
        id: scrollView
        anchors
        {
            fill: parent
            margins: 0
        }
        clip: true
        TextArea
        {
            id: textArea
            font: cFont.DefaultFont
            color: root.enabled ? cColor.TextRegular : cColor.TextDisabled
            selectedTextColor: cColor.InfoLight
            selectByMouse: true
            wrapMode: TextArea.WrapAtWordBoundaryOrAnywhere
            verticalAlignment: TextArea.AlignTop
            inputMethodHints: Qt.ImhMultiLine | Qt.ImhPreferNumbers
            placeholderTextColor: cColor.InfoExtraLight
            background: null
            onEditingFinished: root.editingFinished()
            padding: 2

            onActiveFocusChanged:
            {
                if (!focus)
                {
                    root.editingFinished()
                }
            }
        }
    }
}
