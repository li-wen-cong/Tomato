import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Shapes 1.12

import "../Text"
import "../CheckBox"

MenuItem
{
    id: control

    property string note: ""

    implicitWidth: 160 * cStyle.DPI
    implicitHeight: 40 * cStyle.DPI

    padding: cStyle.SpacingDefault

    contentItem: FocusScope
    {
        width:_body.contentWidth + _note.contentWidth + control.padding * 2
        anchors.left: parent.left
        anchors.leftMargin: checkable ? _check.width + control.padding : control.padding
        GSF_Text_Default
        {
            id:_body
            height: parent.height
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: control.text
            color: cColor.TextPrimary
            anchors.left: parent.left
        }
        GSF_Text_Small
        {
            id:_note
            height: parent.height
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: control.note
            color: cColor.TextRegular
            anchors.right: parent.right
        }
    }


    indicator: GSF_CheckBox
    {
        id:_check
        visible:control.checkable
        checked:control.checked
        anchors.verticalCenter:parent.verticalCenter
        anchors.left:parent.left
        anchors.leftMargin:control.padding
    }

    arrow: Shape
    {
        id: item_arrow
        visible: control.subMenu
        height: cStyle.DPI * 20
        width: height
        anchors.verticalCenter:parent.verticalCenter
        x: parent.width - width
        ShapePath
        {
            strokeWidth: 0
            strokeColor: cColor.TextRegular
            fillRule: ShapePath.WindingFill
            fillColor: cColor.TextRegular
            startX: item_arrow.width/4
            startY: item_arrow.height*3/4
            PathLine { x:item_arrow.width/4; y:item_arrow.height/4 }
            PathLine { x:item_arrow.width/2; y:item_arrow.height/2 }
            PathLine { x:item_arrow.width/4; y:item_arrow.height*3/4 }
        }
    }

    background: Rectangle
    {
        radius:cStyle.RadiusDefault
        color:
        {
            if(control.down)
            {
                return cColor.BrandBase
            }
            else if(control.highlighted)
            {
                return cColor.BrandExtraLight
            }
            else
            {
                return cColor.Transparent
            }
        }
    }
}
