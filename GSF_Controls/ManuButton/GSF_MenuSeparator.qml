import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T

import "../Text"

T.MenuSeparator
{
    id: control

    property alias text:_Text.text

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 0
    topPadding: 0
    bottomPadding: 0
    contentItem: GSF_Text_Default
    {
        id:_Text
        verticalAlignment:Text.AlignVCenter
        leftPadding: 2 * cStyle.DPI
    }
    background: Rectangle
    {
        color: cColor.BorderBase
    }
}
