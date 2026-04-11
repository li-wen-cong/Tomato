import QtQuick 2.12
import QtQuick.Controls 2.12

import "../Text"

ToolTip
{
    id: style
    z:9999

    enum Placement
    {
        Top,
        Bottom,
        Left,
        Right
    }
    property int placement: 0
    property int offset: cStyle.SpacingDefault
    // 样式参数
    contentItem: GSF_Text_Default
    {
        text: style.text
        color:cColor.White
    }
    background: Rectangle
    {
        color: cColor.Black
        radius: cStyle.RadiusDefault
        border.color: cColor.BorderBase
        border.width: 1
    }

    function updatePosition()
    {
        if (!parent)
        {
            return
        }

        switch (placement)
        {
        case 0:
            x = parent.width / 2 - width / 2
            y = -height - offset
            break
        case 1:
            x = parent.width / 2 - width / 2
            y = parent.height + offset
            break
        case 2:
            x = -width - offset
            y = parent.height / 2 - height / 2
            break
        case 3:
            x = parent.width + offset
            y = parent.height / 2 - height / 2
            break
        }
    }

    onVisibleChanged:
    {
        if (visible)
        {
            updatePosition()
        }
    }
    onWidthChanged: updatePosition()
    onHeightChanged: updatePosition()
}
