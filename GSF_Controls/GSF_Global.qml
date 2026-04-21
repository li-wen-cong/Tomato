pragma Singleton
import QtQuick 2.12
import QtQuick.Window 2.12

QtObject
{
    //页面堆栈
    property var singleStackView
    //TrayIcon
    property var singleTrayIcon
    //Settings
    property var config

    //提示框
    property var singlePopup
    function tips(title,body,yes,no,callback_yes,callback_no)
    {
        singlePopup.title = title
        singlePopup.body = body

        singlePopup.confirmButtonText = yes
        singlePopup.onConfirmCallback = callback_yes

        singlePopup.cancelButtonText = no
        singlePopup.onCancelCallback = callback_no

        singlePopup.open()
    }

    //密码输入
    property var singlePasswordInput
    function password(titleText,confirmCallbackFunction)
    {
        singlePasswordInput.title = titleText
        singlePasswordInput.password = ""
        singlePasswordInput.onConfirmCallback = function()
        {
            confirmCallbackFunction(singlePasswordInput.password)
        }
        singlePasswordInput.open()
    }

    //字符串输入
    property var singleStringInput
    function inputString(titleText,confirmCallbackFunction)
    {
        singleStringInput.title = titleText
        singleStringInput.inputString = ""
        singleStringInput.onConfirmCallback = function()
        {
            confirmCallbackFunction(singleStringInput.inputString)
        }
        singleStringInput.open()
    }

    //虚拟数字键盘
    property var singleNemberVirtualKeyboard

    //IO监控
    property var single_IO
    property var single_Axis
    property var single_Machine
    property var single_FTC

    property var single_File
    function openFileManager(isSave,isPreview,filters,confirmCallbackFunction)
    {
        single_File.isSave = isSave
        single_File.filters = filters
        single_File.isPreview = isPreview
        single_File.onConfirmCallback = confirmCallbackFunction
        single_File.open()
    }

    property var single_StatusBar_Custom

    function timeTransition(ms)
    {
        if (ms <= 0)
        {
            return "00:00";
        }

        var totalSeconds = Math.floor(ms / 1000);
        var minutes = Math.floor(totalSeconds / 60);
        var seconds = totalSeconds % 60;

        var minutesStr = minutes.toString().padStart(2, '0');
        var secondsStr = seconds.toString().padStart(2, '0');

        return minutesStr + ":" + secondsStr;
    }
}
