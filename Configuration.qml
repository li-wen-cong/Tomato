import QtQuick 2.12
import Qt.labs.settings 1.1

Item
{
    id:root

    property alias tomato: _Tomato
    property alias tips: _Tips
    property alias settings: _Settings

    property string filePath: cTomato.configFilePath()
    Settings
    {
        id:_Tomato
        fileName:filePath
        category: "Tomato"

        property int workDuration: 25
        property int shortRestDuration: 5
        property int longRestDuration: 15
        property int rounds: 4

    }
    Settings
    {
        id:_Tips
        fileName:filePath
        category: "Tips"

        property string title: "Tomato Tips"
        property string shortRest: "Rest now, focus better later."
        property string longRest: "You finished a chapter. Now take an intermission."
        property string finish:"You're not a machine. But you're a focused human."
    }

    Settings
    {
        id:_Settings
        fileName:filePath
        category: "Settings"

        property int theme: 2           //主题
        property real volume: 0.5       //音量
        property int loop: 3            //循环次数
        property int ringtone: 0        //提示音
    }
}
