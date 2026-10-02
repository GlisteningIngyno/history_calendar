import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels
import QtQuick.Dialogs

import datebase

Item {

    property bool addOrDelete: false

    id: rootItem
    Datebase{
        id: dateBaseCreate
    }
    FontLoader {
        id: electrolize
        source: "fonts/Electrolize-Regular.ttf"
    }
    ColumnLayout{
        anchors.fill: parent
        Text {
            id: txtInputD
            text: qsTr("Введите дату события")
            font.pixelSize: 20
            font.family: electrolize.name
            font.weight: Font.Normal

            Layout.fillWidth: true

            Layout.topMargin: 30
            Layout.leftMargin: 30
        }
        TextField{
            id: txtFieldDate
            color: "black"

            text: "..."
            font.pixelSize: 15
            font.family: electrolize.name
            font.weight: Font.Normal
            wrapMode: Text.NoWrap
            clip: true

            background: Rectangle {
                implicitWidth: 165
                implicitHeight: 45
                color: "white"
            }

            Layout.leftMargin: 30
        }
        Text {
            id: txtInputE
            text: qsTr("Введите событие")

            font.pixelSize: 20
            font.family: electrolize.name
            font.weight: Font.Normal
            Layout.fillWidth: true

            Layout.topMargin: 30
            Layout.leftMargin: 30
        }
        TextField{
            id: txtFieldEvent
            text: "..."
            color: "black"
            font.pixelSize: 15
            font.family: electrolize.name
            font.weight: Font.Normal
            wrapMode: Text.NoWrap
            clip: true

            background: Rectangle {
                implicitWidth: 165
                implicitHeight: 45
                color: "white"
            }


            Layout.leftMargin: 30
        }
        RowLayout{
            Layout.fillWidth: true
            Button{
                id: btReturnR
                width: 32
                height: 32
                icon.width: 32
                icon.height: 32
                icon.color: "transparent"
                icon.source: "icons/reply-left"

                background: Rectangle {
                    implicitWidth: 32
                    implicitHeight: 32
                    color: btReturnR.pressed ? "#4E3C2B" : btReturnR.hovered ? "#B8916A" : "#72583F"
                }
                Layout.fillWidth: true

                Layout.topMargin: 30
                onClicked: {
                    stackViewTop.pop()
                }
            }
            Button{
                id: btSave
                width: 32
                height: 32
                icon.width: 32
                icon.height: 32
                icon.color: "transparent"
                icon.source: "icons/checkmark"

                background: Rectangle {
                    implicitWidth: 32
                    implicitHeight: 32
                    color: btSave.pressed ? "#4E3C2B" : btSave.hovered ? "#B8916A" : "#72583F"
                }
                Layout.fillWidth: true

                Layout.topMargin: 30
                onClicked: {
                    if(rootItem.addOrDelete){
                        dateBaseCreate.addDateClick(txtFieldDate.text,txtFieldEvent.text)
                        txtFieldDate.text = "Событие добавлено"
                        txtFieldEvent.text = "Событие добавлено"
                    }else{
                        dateBaseCreate.deleteDateClick(txtFieldDate.text,txtFieldEvent.text)
                        txtFieldDate.text = "Событие удалено"
                        txtFieldEvent.text = "Событие удалено"
                    }
                }
            }
        }



    }


}
