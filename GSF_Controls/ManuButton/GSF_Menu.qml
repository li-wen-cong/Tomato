import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Window 2.12
Menu
{
    id: control
    property bool buttonIsHover:false
    property bool isHover:false
    property alias timer:closeTimer
    property real specifiedWidth:cStyle.DPI * 80

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            specifiedWidth)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    padding: cStyle.RadiusDefault
    overlap: 1
    delegate: GSF_MenuItem{}
    background: Rectangle
    {
        implicitWidth: cStyle.DPI * 80
        implicitHeight: 20 * cStyle.DPI
        color: cColor.BackgroundBase
        border.width: 1
        border.color: cColor.BorderBase
        radius:cStyle.RadiusDefault
        clip:true
    }

    Timer
    {
        id:closeTimer
        running: false
        repeat: true
        interval: 150
        onTriggered:
        {
            isHover = false
            for(var i = 0;i<contentData.length;i++)
            {
                var item = contentData[i]
                if(item.hovered)
                {
                    isHover = true
                    break
                }
            }
            if (!buttonIsHover && !isHover)
            {
                control.close()
                closeTimer.stop()
            }
        }
    }
}

