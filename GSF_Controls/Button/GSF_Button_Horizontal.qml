import QtQuick 2.12
import QtQuick.Controls 2.12

import "../Icon"
import "../Text"

Button
{
    id:root
    enum Variant
    {
        Default,
        Primary,
        Success,
        Info,
        Warning,
        Danger
    }
    property int theme: 0

    //按钮样式
    property bool plain: false
    property bool round: false
    property alias source: _icon.source
    property alias fontObjet:_text.font

    //功能_加载显示
    property bool loading: false

    enabled: !loading && root.enabled
    implicitHeight: 40 * cStyle.DPI
    implicitWidth: 120 * cStyle.DPI

    contentItem:FocusScope
    {
        Item
        {
            anchors.centerIn: parent
            height: parent.height
            implicitWidth: _text.contentWidth + cStyle.SpacingDefault + _icon.width
            GSF_Icon_SVG
            {
                id:_icon
                color: textColor
                opacity: root.enabled ? 1.0 : 0.6
                width: root.height * 0.6
                height: width
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            GSF_Text_Default
            {
                id:_text
                text: root.text
                color: textColor
                opacity: root.enabled ? 1.0 : 0.6
                verticalAlignment: Text.AlignVCenter
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    background: Rectangle
    {
        id: bg
        radius: round ? height / 2 : cStyle.RadiusDefault
        color: bgColor
        border.color: borderColor
        border.width: 1 * cStyle.DPI
    }

    readonly property color baseColor:
    {
        switch (theme)
        {
        case 1:     return cColor.BrandBase
        case 2:     return cColor.SuccessBase
        case 3:     return cColor.InfoBase
        case 4:     return cColor.WarningBase
        case 5:     return cColor.DangerBase
        default:    return cColor.FillBase
        }
    }

    readonly property color hoverColor:
    {
        switch (theme)
        {
        case 1:     return cColor.BrandLight
        case 2:     return cColor.SuccessLight
        case 3:     return cColor.InfoLight
        case 4:     return cColor.WarningLight
        case 5:     return cColor.DangerLight
        default:    return cColor.FillLight
        }
    }

    readonly property color processColor:
    {
        switch (theme)
        {
        case 1: return cColor.BrandDark
        case 2: return cColor.SuccessDark
        case 3: return cColor.InfoDark
        case 4: return cColor.WarningDark
        case 5: return cColor.DangerDark
        default: return cColor.FillDark
        }
    }

    readonly property color bgColor: plain ? cColor.Transparent : baseColor
    readonly property color bgColorHover: plain ? cColor.FillDark : hoverColor
    readonly property color bgColorPressed: plain ? cColor.FillDarker : processColor
    readonly property color bgDisabledColor: cColor.FillLight
    readonly property color borderColor: plain ? baseColor : cColor.BorderBase
    readonly property color borderColorHover: baseColor
    readonly property color borderColorPressed: processColor
    readonly property color borderColorDisabled: cColor.BorderLight
    readonly property color borderColorFocus: theme === root.Default ? cColor.BrandBase : baseColor
    readonly property color textColor:
    {
        if (!root.enabled)
        {
            return cColor.TextDisabled
        }
        if (plain)
        {
            return theme === 0 ? cColor.TextPrimary : baseColor
        }
        return theme === 0 ? cColor.TextPrimary : cColor.White
    }

    states: [
        State {
            name: "disabled"
            when: !root.enabled
            PropertyChanges {
                target: bg
                color: bgDisabledColor
                border.color: borderColorDisabled
            }
        },
        State {
            name: "pressed"
            when: root.down && root.enabled
            PropertyChanges {
                target: bg
                color: bgColorPressed
                border.color: borderColorPressed
            }
        },
        State {
            name: "hover"
            when: root.hovered && root.enabled
            PropertyChanges {
                target: bg
                color: bgColorHover
                border.color: borderColorHover
            }
        },
        State {
            name: "focus"
            when: root.activeFocus && root.enabled
            PropertyChanges {
                target: bg
                border.color: borderColorFocus
            }
        }
    ]
}
