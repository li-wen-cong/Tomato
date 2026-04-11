import QtQuick 2.12

import "./Text"
import "./Icon"
import "./Button"

FocusScope
{
    Column
    {
        spacing: cStyle.SpacingDefault
        width: 300 * cStyle.DPI
        height: 100 * cStyle.DPI
        anchors.left: parent.left
        anchors.leftMargin: cStyle.SpacingDefault
        GSF_Text_Large
        {
            text: "GeneralSoftwareFramework"
        }
        GSF_Text_Default
        {
            text: "GeneralSoftwareFramework"
        }
        GSF_Text_Small
        {
            text: "GeneralSoftwareFramework"
        }
    }

    Grid
    {
        rows: 3
        columns: 6
        rowSpacing: cStyle.SpacingDefault
        columnSpacing: cStyle.SpacingDefault
        anchors.top: parent.top
        anchors.topMargin: 100 * cStyle.DPI
        anchors.left: parent.left
        anchors.leftMargin: cStyle.SpacingDefault
        GSF_Button
        {
            text: "Default"
            theme:GSF_Button.Variant.Default
        }
        GSF_Button
        {
            text: "Primary"
            theme:GSF_Button.Variant.Primary
        }
        GSF_Button
        {
            text: "Success"
            theme:GSF_Button.Variant.Success
        }
        GSF_Button
        {
            text: "Info"
            theme:GSF_Button.Variant.Info
        }
        GSF_Button
        {
            text: "Warning"
            theme:GSF_Button.Variant.Warning
        }
        GSF_Button
        {
            text: "Danger"
            theme:GSF_Button.Variant.Danger
        }

        GSF_Button
        {
            text: "Default"
            theme:GSF_Button.Variant.Default
            plain: true
        }
        GSF_Button
        {
            text: "Primary"
            theme:GSF_Button.Variant.Primary
            plain: true
        }
        GSF_Button
        {
            text: "Success"
            theme:GSF_Button.Variant.Success
            plain: true
        }
        GSF_Button
        {
            text: "Info"
            theme:GSF_Button.Variant.Info
            plain: true
        }
        GSF_Button
        {
            text: "Warning"
            theme:GSF_Button.Variant.Warning
            plain: true
        }
        GSF_Button
        {
            text: "Danger"
            theme:GSF_Button.Variant.Danger
            plain: true
        }
        GSF_Button
        {
            text: "Default"
            theme:GSF_Button.Variant.Default
            plain: true
            round: true
        }
        GSF_Button
        {
            text: "Primary"
            theme:GSF_Button.Variant.Primary
            plain: true
            round: true
        }
        GSF_Button
        {
            text: "Success"
            theme:GSF_Button.Variant.Success
            plain: true
            round: true
        }
        GSF_Button
        {
            text: "Info"
            theme:GSF_Button.Variant.Info
            plain: true
            round: true
        }
        GSF_Button
        {
            text: "Warning"
            theme:GSF_Button.Variant.Warning
            plain: true
            round: true
        }
        GSF_Button
        {
            text: "Danger"
            theme:GSF_Button.Variant.Danger
            plain: true
            round: true
        }
    }
}
