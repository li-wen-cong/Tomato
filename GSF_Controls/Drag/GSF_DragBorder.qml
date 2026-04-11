import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

Item {
    id: root
    property var control: parent
    property int borderWidth: 8
    //阴影
    layer.enabled: true
    layer.effect: DropShadow
    {
        color: cColor.BorderBase
        radius: 3
        samples: 12
    }
    //左上角的拖拽
    GSF_DragItem
    {
        id: leftTopHandle
        posType: posLeftTop
        width: borderWidth
        height: borderWidth
        onPosChange:
        {
            //不要简化这个判断条件，化简之后不容易看懂. Qml引擎会自动简化
            if (control.x + xOffset < control.x + control.width)
            {
                control.x += xOffset;
            }
            if (control.y + yOffset < control.y + control.height)
            {
                control.y += yOffset;
            }
            if (control.width - xOffset > 0)
            {
                control.width-= xOffset;
            }
            if (control.height -yOffset > 0)
            {
                control.height -= yOffset;
            }
        }
    }
    //右上角拖拽
    GSF_DragItem
    {
        id: rightTopHandle
        posType: posRightTop
        x: parent.width - width
        width: borderWidth
        height: borderWidth
        onPosChange:
        {
            //向左拖动时，xOffset为负数
            if (control.width + xOffset > 0)
            {
                control.width += xOffset;
            }
            if (control.height - yOffset > 0)
            {
                control.height -= yOffset;
            }
            if (control.y + yOffset < control.y + control.height)
            {
                control.y += yOffset;
            }
        }
    }
    //左下角拖拽
    GSF_DragItem {
        id: leftBottomHandle
        posType: posLeftBottom
        y: parent.height - height
        width: borderWidth
        height: borderWidth
        onPosChange: {
            if (control.x + xOffset < control.x + control.width)
            {
                control.x += xOffset;
            }
            if (control.width - xOffset > 0)
            {
                control.width-= xOffset;
            }
            if (control.height + yOffset > 0)
            {
                control.height += yOffset;
            }
        }
    }
    //右下角拖拽
    GSF_DragItem {
        id: rightBottomHandle
        posType: posRightBottom
        x: parent.width - width
        y: parent.height - height
        width: borderWidth
        height: borderWidth
        onPosChange: {
            if (control.width + xOffset > 0)
            {
                control.width += xOffset;
            }
            if (control.height + yOffset > 0)
            {
                control.height += yOffset;
            }
        }
    }
    //上边拖拽
    GSF_DragItem {
        posType: posTop
        width: parent.width - leftTopHandle.width - rightTopHandle.width
        height: borderWidth
        x: leftBottomHandle.width
        onPosChange: {
            if (control.y + yOffset < control.y + control.height)
            {
                control.y += yOffset;
            }
            if (control.height - yOffset > 0)
            {
                control.height -= yOffset;
            }
        }
    }

    //左边拖拽
    GSF_DragItem {
        posType: posLeft
        height: parent.height - leftTopHandle.height - leftBottomHandle.height
        width: borderWidth

        y: leftTopHandle.height
        onPosChange: {
            if (control.x + xOffset < control.x + control.width)
            {
                control.x += xOffset;
            }
            if (control.width - xOffset > 0)
            {
                control.width-= xOffset;
            }
        }
    }
    //右边拖拽
    GSF_DragItem
    {
        posType: posRight
        x: parent.width - width
        height: parent.height - rightTopHandle.height - rightBottomHandle.height
        width: borderWidth
        y: rightTopHandle.height
        onPosChange:
        {
            if (control.width + xOffset > 0)
            {
                control.width += xOffset;
            }
        }
    }
    //下边拖拽
    GSF_DragItem
    {
        posType: posBottom
        x: leftBottomHandle.width
        y: parent.height - height
        width: parent.width - leftBottomHandle.width - rightBottomHandle.width
        height: borderWidth
        onPosChange: {
            if (control.height + yOffset > 0)
            {
                control.height += yOffset;
            }
        }
    }
}
