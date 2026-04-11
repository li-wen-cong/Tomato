import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.platform 1.1

SystemTrayIcon
{
    id:root
    visible: true
    tooltip: qsTr("Tomato")
    iconSource: "qrc:/res/Tomato.ico"
    function showNotification(title, message)
    {
        showMessage(title, message, SystemTrayIcon.Information, 3000)
    }
}
