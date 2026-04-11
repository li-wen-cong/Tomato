import QtQuick 2.12
import QtQuick.Controls 2.12

Slider
{
    id: root
    value: 0.5

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


    readonly property color baseColor:
    {
        switch (theme)
        {
        case 1:     return cColor.BrandDark
        case 2:     return cColor.SuccessDark
        case 3:     return cColor.InfoDark
        case 4:     return cColor.WarningDark
        case 5:     return cColor.DangerDark
        default:    return cColor.FillDark
        }
    }

    readonly property color handleColorBase:
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

    readonly property color handleColorHover:
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

    background: Rectangle
    {
        x: root.leftPadding
        y: root.topPadding + root.availableHeight / 2 - height / 2
        implicitWidth: 200
        implicitHeight: 4
        width: root.availableWidth
        height: implicitHeight
        radius: 2
        color:cColor.FillBase
        Rectangle
        {
            width: root.visualPosition * parent.width
            height: parent.height
            radius: parent.height / 2
            color: baseColor
        }
    }

    handle: Rectangle
    {
        x: root.leftPadding + root.visualPosition * (root.availableWidth - width)
        y: root.topPadding + root.availableHeight / 2 - height / 2
        width: 20 * cStyle.DPI
        height: width
        radius: width / 2
        color: root.pressed ? handleColorBase : handleColorHover
        border.color: cColor.BrandBase
    }
}
