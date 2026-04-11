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
    property url iconSource: ""

    //按钮样式
    property bool plain: false
    property bool round: false

    //功能_加载显示
    property bool loading: false

    enabled: !loading && root.enabled
    implicitHeight: 40 * cStyle.DPI
    implicitWidth: 120 * cStyle.DPI

    property bool other:
    {
        return loading || iconSource !== ""
    }

    contentItem:FocusScope
    {
        anchors.fill:parent
        Loader
        {
            active: loading
            width: 18 * cStyle.DPI
            height: width
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: cStyle.SpacingDefault
            sourceComponent: Item
            {
                width: 18 * cStyle.DPI
                height: width
                Rectangle
                {
                    width: parent.width
                    height: parent.height
                    radius: width / 2
                    border.width: 2
                    border.color: borderColor
                    color: cColor.Transparent
                    opacity: 0.7
                }
                RotationAnimator on rotation
                {
                    from: 0
                    to: 360
                    duration: 800
                    loops: Animation.Infinite
                    running: true
                }
            }
        }

        GSF_Icon_SVG
        {
            visible: iconSource !== "" && !loading
            source: iconSource
            width: visible ? 18 * cStyle.DPI : 0
            height: width
            anchors.left: parent.left
            anchors.leftMargin: cStyle.SpacingDefault
        }

        GSF_Text_Default
        {
            id:_text
            text: root.text
            color: textColor
            opacity: root.enabled ? 1.0 : 0.6
            width: other ? root.width : root.width - 18 * cStyle.DPI - 2 * cStyle.SpacingDefault
            height: parent.height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
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
