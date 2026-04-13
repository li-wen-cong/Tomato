import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0

import GSF_Controls 1.0

import "../Text"
import "../Input"

T.ComboBox
{
    id: control

    property int radius: 0
    signal itemAboutToHide()

    implicitWidth: implicitBackgroundWidth;
    implicitHeight: implicitBackgroundHeight;
    rightPadding: height * 0.8
    leftPadding: 0
    topPadding: 0
    bottomPadding: 0
    leftInset: 0
    rightInset: 0
    topInset: 0
    bottomInset: 0
    editable: false
    font:cFont.DefaultFont

    model:[0,1,2,3,4,5,6,7,8,9,10,11,12]

    // 弹出框行委托
    delegate: ItemDelegate
    {
        width: parent.width
        height: control.height
        // 行字体样式
        contentItem:GSF_Text_Default
        {
            text: modelData
            anchors.fill: parent
            verticalAlignment:Text.AlignVCenter
            leftPadding:cStyle.DPI * 5
            color: cColor.TextPrimary
        }
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled;
        background:Rectangle
        {
            color:highlighted ? cColor.BrandDark : cColor.BackgroundOverlay
        }
    }
    // 右侧下拉箭头
    indicator: FocusScope
    {
        id: canvas
        width: cStyle.DPI * 15
        height: cStyle.DPI * 4
        anchors.verticalCenter:parent.verticalCenter
        anchors.right:parent.right
        GSF_Text_Large
        {
            text:"⌵"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            property real offset: -parent.height * 0.55
            anchors.verticalCenterOffset: control.down ? -offset : offset
            rotation: control.down ? 180 : 0
        }
    }

    //ComboBox的文字位置样式
    contentItem: GSF_Text_Default
    {
        text: control.displayText
        color:control.enabled ? cColor.TextPrimary : cColor.BorderExtraLight
        verticalAlignment:Text.AlignVCenter
        leftPadding:cStyle.DPI * 2
        elide: Text.ElideRight
    }

    // ComboBox 的背景样式
    background: Rectangle
    {
        implicitWidth: 120;
        implicitHeight: 30;
        radius: control.radius
        color:
        {
            if(!control.enabled)
            {
                return cColor.BorderLight
            }
            else
            {
                return cColor.BackgroundBase
            }
        }
        border.color: control.hovered ? cColor.BrandDark : cColor.BrandBase
        border.width: 0.5
        visible: !control.flat || control.down;
    }

    // 弹出窗口样式
    popup: T.Popup
    {
        z:1
        y: control.height + cStyle.DPI * 1
        width: control.width
        height: control.count > 8 ? control.height * 8 : control.height * control.count
        background: Rectangle
        {
            color: cColor.BrandDark
            border.color: cColor.BorderLight
            border.width: 1
            radius: control.radius
            layer.enabled: true
            layer.effect: DropShadow
            {
                color: cColor.TextPrimary
                radius: 3
                samples: 12
            }
        }
        contentItem: ListView
        {
            clip: true
            //禁用橡皮筋效果
            boundsBehavior: Flickable.StopAtBounds
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0
            T.ScrollIndicator.vertical: ScrollIndicator{}
        }

        onAboutToHide:
        {
            itemAboutToHide()
        }
    }
}
