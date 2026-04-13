import QtQuick 2.12
import QtQuick.Controls 2.12

Slider
{
    id: root
    value: 0.5
    orientation: Qt.Vertical  // 关键：声明为垂直方向

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

    // 竖向滑块的背景（轨道）
    background: Rectangle
    {
        x: root.leftPadding + root.availableWidth / 2 - width / 2
        y: root.topPadding
        implicitWidth: 4
        implicitHeight: 200
        width: implicitWidth
        height: root.availableHeight
        radius: 2
        color: cColor.FillBase

        // 填充部分（从下往上填充，与视觉位置对应）
        Rectangle
        {
            // 竖向：Y轴从 visualPosition * height 开始，填到最底部
            y: root.visualPosition * parent.height
            width: parent.width
            height: parent.height - y
            radius: parent.width / 2
            color: baseColor
        }
    }

    // 竖向滑块的手柄
    handle: Rectangle
    {
        x: root.leftPadding + root.availableWidth / 2 - width / 2
        // 竖向：Y轴位置随 visualPosition 变化
        y: root.topPadding + root.visualPosition * (root.availableHeight - height)
        width: 10 * cStyle.DPI
        height: width
        radius: width / 2
        color: root.pressed ? handleColorBase : handleColorHover
        border.color: cColor.BrandBase
    }
}
