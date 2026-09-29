import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels
import QtQuick.Dialogs

Item {

    property string txtDataVal: "какая-то дата"
    property string txtEventVal: "какое-то событие"

    id: root
    FontLoader {
        id: electrolize
        source: "fonts/Electrolize-Regular.ttf"
    }
    ColumnLayout{
        anchors.fill: parent

        Button {
            id: btTopBar2
            width: 32

            height: 32
            icon.width: 32
            icon.height: 32
            icon.color: "transparent"
            icon.source: "icons/reply-left"

            Layout.fillWidth: true

            background: Rectangle {
                implicitWidth: 32
                implicitHeight: 32
                color: btTopBar2.pressed ? "#4E3C2B" : btTopBar2.hovered ? "#B8916A" : "#F2E0C8"
            }
            onClicked: {
                stackViewTop.pop()
            }
        }
        RowLayout{
            Layout.leftMargin: 30
            Layout.topMargin: 30
            Layout.fillWidth: true

            Text {
                id: txtDataPriew
                text: "Дата: "
                font.pixelSize: 15
                font.family: electrolize.name
                font.weight: Font.Normal

                Layout.fillWidth: true

            }
            Text {
                id: txtDataValue
                text: root.txtDataVal
                font.pixelSize: 15
                font.family: electrolize.name
                font.weight: Font.Normal

                Layout.fillWidth: true
            }
        }
        Text {
            id: txtEventPriew
            text: "Событие: "
            font.pixelSize: 15
            font.family: electrolize.name
            font.weight: Font.Normal
            Layout.fillWidth: true

            Layout.topMargin: 30
            Layout.leftMargin: 30


        }
        Text {
            id: txtEventValue
            text: root.txtEventVal
            font.pixelSize: 15
            font.family: electrolize.name
            font.weight: Font.Normal
            wrapMode: Text.Wrap

            Layout.leftMargin: 30

            Layout.topMargin: 30

            Layout.fillWidth: true
            Layout.fillHeight: true

        }
    }
}
