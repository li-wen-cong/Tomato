import QtQuick 2.12
import QtQuick.Controls 2.12

import "../../GSF_Controls/Text"

Item
{
    id: control

    implicitWidth: 160
    implicitHeight: 160

    property alias time: _Time.text
    property alias stage: _Stage.text

    property real from: 0       //最小值
    property real to: 100       //最大值
    property real value: 0      //当前值

    property real percent: (value-from)/(to-from) //百分比[0,1]

    property int canvasMargin: 3
    property int canvasWidth: width < height ? width : height
    property int canvasRadius: canvasWidth / 2 - canvasMargin
    property int lineWidth: 6
    property int lineBorder: 3
    property color bgColor: cColor.BrandDark
    property color valueColor: cColor.BrandLighter
    //
    property real _valueAngle: Math.PI/2+Math.PI*2*percent
    on_ValueAngleChanged: canvas.requestPaint()
    //
    property real speed: 0.1
    property real offset: 0

    Canvas {
        id: canvas
        width: canvasWidth
        height: canvasWidth
        onPaint:
        {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, canvasWidth, canvasWidth);
            ctx.lineCap = "round";

            drawBg(ctx);
            drawValue(ctx);
        }

        //context.arc(x,y,r,sAngle,eAngle,counterclockwise);
        //x:圆的中心的x坐标。
        //y:圆的中心的y坐标。
        //r:圆的半径。
        //sAngle:起始角，以弧度计。（弧的圆形的三点钟位置是0度）。
        //eAngle:结束角，以弧度计。
        //counterclockwise:可选参数。False=顺时针，true=逆时针。
        function drawBg(ctx)
        {
            var color_offset = offset > Math.PI ? (1 - (offset - Math.PI) / Math.PI) : (offset / Math.PI);

            ctx.beginPath();
            ctx.arc(canvasWidth / 2, canvasWidth / 2, canvasRadius - lineWidth / 2 - lineBorder, 0, 2 * Math.PI);
            ctx.lineWidth = lineWidth + lineBorder * 2;
            ctx.strokeStyle = Qt.lighter(bgColor, 1.7 + 0.2 * color_offset);
            ctx.stroke();

            ctx.beginPath();
            ctx.arc(canvasWidth / 2, canvasWidth / 2, canvasRadius - lineWidth / 2 - lineBorder, 0, 2 * Math.PI);
            ctx.lineWidth = lineWidth;
            ctx.strokeStyle = Qt.lighter(bgColor, 1.6 + 0.2 * color_offset);
            ctx.stroke();
        }

        function drawValue(ctx)
        {
            ctx.beginPath();
            ctx.arc(canvasWidth / 2, canvasWidth / 2, canvasRadius - lineWidth / 2 - lineBorder, Math.PI / 2, _valueAngle, false);
            ctx.lineWidth = lineWidth;
            ctx.strokeStyle = cColor.BrandExtraLight;
            ctx.stroke();
        }

        Column
        {
            width: parent.width
            height: _Time.contentHeight + _Stage.contentHeight + cStyle.SpacingDefault
            anchors.centerIn: parent
            spacing: cStyle.SpacingDefault
            GSF_Text_Small
            {
                id: _Stage
                color: valueColor
                width: parent.width
                font.pixelSize: (canvasWidth - lineWidth) / 6;
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
            }
            GSF_Text_Title
            {
                id: _Time
                color: valueColor
                width: parent.width
                font.pixelSize: (canvasWidth - lineWidth) / 8;
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    Timer
    {
        running: visible
        repeat: true
        interval: 35
        onTriggered:
        {
            //波浪移动
            offset += speed;
            offset %= Math.PI * 2;
            canvas.requestPaint();
        }
    }
}
