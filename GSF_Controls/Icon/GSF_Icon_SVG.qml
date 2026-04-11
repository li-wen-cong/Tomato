import QtQuick 2.10
import QtGraphicalEffects 1.0

Image
{
    id: root
    property color color: "white"
    property bool isSvg:
    {
        var s = source.toString().toLowerCase()
        return s.endsWith(".svg") || s.endsWith(".svgz")
    }
    mipmap:true
    layer.enabled: isSvg
    layer.effect: ColorOverlay
    {
        color: root.color
    }
}
