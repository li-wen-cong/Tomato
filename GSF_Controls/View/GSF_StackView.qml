import QtQuick 2.3
import QtQuick.Controls 2.2

import GSF_Controls 1.0

StackView
{
    id: stackView

    property int transitionDuration: 100
    property int lastPushDirection: 1

    // 动画方向枚举
    enum Direction
    {
        LeftToRight,
        RightToLeft,
        TopToBottom,
        BottomToTop
    }

    Component.onCompleted:
    {
        GSF_Global.singleStackView = stackView
    }

    function pushPage(url, direction, timer = 200, properties = {})
    {
        lastPushDirection = direction
        transitionDuration = timer
        if(properties.length === 0)
        {
            stackView.push(Qt.resolvedUrl(url))
        }
        else
        {
            stackView.push(Qt.resolvedUrl(url),properties)
        }
    }

    function home()
    {
        stackView.pop(stackView.get(0))
    }

    pushEnter: Transition
    {
        PropertyAnimation
        {
            property: "x"
            from: (stackView.lastPushDirection === 1 ? stackView.width :
                  stackView.lastPushDirection === 0 ? -stackView.width : 0)
            to: 0
            duration: stackView.transitionDuration
            easing.type: Easing.OutCubic
        }
        PropertyAnimation
        {
            property: "y"
            from: (stackView.lastPushDirection === 3 ? stackView.height :
                  stackView.lastPushDirection === 2 ? -stackView.height : 0)
            to: 0
            duration: stackView.transitionDuration
            easing.type: Easing.OutCubic
        }
    }

    pushExit: Transition
    {
        PropertyAnimation
        {
            property: "x"
            from: 0
            to: (stackView.lastPushDirection === 1 ? -stackView.width :
                stackView.lastPushDirection === 0 ? stackView.width : 0)
            duration: stackView.transitionDuration
            easing.type: Easing.OutCubic
        }
        PropertyAnimation
        {
            property: "y"
            from: 0
            to: (stackView.lastPushDirection === 3 ? -stackView.height :
                stackView.lastPushDirection === 2 ? stackView.height : 0)
            duration: stackView.transitionDuration
            easing.type: Easing.OutCubic
        }
    }

    popEnter: Transition
    {
        PropertyAnimation
        {
            property: "x"
            from: (stackView.lastPushDirection === 1 ? -stackView.width :
                  stackView.lastPushDirection === 0 ? stackView.width : 0)
            to: 0
            duration: stackView.transitionDuration
            easing.type: Easing.OutCubic
        }
        PropertyAnimation
        {
            property: "y"
            from: (stackView.lastPushDirection === 3 ? -stackView.height :
                  stackView.lastPushDirection === 2 ? stackView.height : 0)
            to: 0
            duration: stackView.transitionDuration
            easing.type: Easing.OutCubic
        }
    }

    popExit: Transition
    {
        PropertyAnimation
        {
            property: "x"
            from: 0
            to: (stackView.lastPushDirection === 1 ? stackView.width :
                stackView.lastPushDirection === 0 ? -stackView.width : 0)
            duration: stackView.transitionDuration
            easing.type: Easing.OutCubic
        }
        PropertyAnimation
        {
            property: "y"
            from: 0
            to: (stackView.lastPushDirection === 3 ? stackView.height :
                stackView.lastPushDirection === 2 ? -stackView.height : 0)
            duration: stackView.transitionDuration
            easing.type: Easing.OutCubic
        }
    }

    // 页面切换时防止重复点击
    MouseArea
    {
        anchors.fill: parent
        visible: stackView.busy
        z: stackView.z + 1
    }
}
