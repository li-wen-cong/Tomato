import QtQuick 2.0

import "../../GSF_Controls/Text"

FocusScope
{
    id:root
    signal clicked

    enum Direction
    {
        Left,
        Right,
        Top,
        Bottom
    }

    property int direction:0

    Canvas
    {
        id: border
        anchors.fill: parent
        onPaint:
        {
            var ctx = getContext("2d")
            ctx.clearRect(0, 0, width, height)
            ctx.fillStyle = cColor.BorderLight
            ctx.beginPath()
            ctx.moveTo(width, 0)
            ctx.lineTo(0, height / 5)
            ctx.lineTo(0, height / 5 * 4)
            ctx.lineTo(width, height)
            ctx.closePath()
            ctx.fill()
        }
    }
    Canvas
    {
        id: indicator
        anchors.fill: parent
        rotation:
        {
            switch(direction)
            {
            case 0:
                return 0
            case 1:
                return 180
            case 2:
                return 90
            case 3:
                return 270
            }
        }

        onPaint:
        {
            var ctx = getContext("2d")
            ctx.strokeStyle = cColor.TextPrimary
            ctx.lineWidth = 1
            ctx.beginPath()
            ctx.moveTo(width / 3, height / 2 + width / 3)
            ctx.lineTo(width / 3 * 2, height / 2)
            ctx.lineTo(width / 3, height / 2 - width / 3)
            ctx.stroke()
        }
    }
    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            root.clicked()
        }
    }
}
