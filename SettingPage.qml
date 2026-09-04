import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels

import "./customcomponent" as CustomComponent

Rectangle {
    color: "#D8FFD1"
    property StackView stackView: null // Свойство для связи со StackView

    ColumnLayout {
        anchors.fill: parent
        Text {
            text: "Настройки"
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 48
            font.styleName: "Inter"
            Layout.fillWidth: parent
            Layout.margins: 15
        }

        Rectangle {
            color: "#A1FA91"
            border.color: "#2A5722"
            border.width: 3
            radius: 10

            Layout.fillWidth: parent
            Layout.fillHeight: parent
            GridLayout {
                anchors.fill: parent
                columns: 3
                rows: 2
                columnSpacing: 10
                Text {
                    text: "Добавить дату или файл"

                    Layout.fillWidth: parent
                    Layout.margins: 10
                }
                Button {
                    text: "Добавить"

                    Layout.margins: 10
                    Layout.fillWidth: parent
                }
                Button {
                    text: "Файл"

                    Layout.margins: 10
                    Layout.fillWidth: parent
                }
                Text {
                    text: "Добавить дату или файл"

                    Layout.fillWidth: parent
                    Layout.margins: 10
                }
                Button {
                    text: "Добавить"

                    Layout.margins: 10
                    Layout.fillWidth: parent
                }
                Button {
                    text: "Файл"

                    Layout.margins: 10
                    Layout.fillWidth: parent
                }
                Text {
                    text: "Добавить дату или файл"

                    Layout.fillWidth: parent
                    Layout.margins: 10
                }
                Button {
                    text: "Добавить"

                    Layout.margins: 10
                    Layout.fillWidth: parent
                }
                Button {
                    text: "Файл"

                    Layout.margins: 10
                    Layout.fillWidth: parent
                }
                Text {
                    text: "Добавить дату или файл"

                    Layout.fillWidth: parent
                    Layout.margins: 10
                }
                Button {
                    text: "Добавить"

                    Layout.margins: 10
                    Layout.fillWidth: parent
                }
                Button {
                    text: "Файл"

                    Layout.margins: 10
                    Layout.fillWidth: parent
                }
                Text {
                    text: "Добавить дату или файл"

                    Layout.fillWidth: parent
                    Layout.margins: 10
                }
                Button {
                    text: "Добавить"

                    Layout.margins: 10
                    Layout.fillWidth: parent
                }
                Button {
                    text: "Файл"

                    Layout.margins: 10
                    Layout.fillWidth: parent
                }
            }
        }

        Button {
            id: homeButton
            icon.source: "icons/house.svg"
            icon.color: "transparent"
            icon.width: 32
            icon.height: 32

            Layout.margins: 25

            background: Rectangle {
                implicitWidth: 52
                implicitHeight: 52

                color: homeButton.pressed ? "#1fa307" : homeButton.hovered ? "#bafbae" : "#A1FA91"
                border.color: "#2A5722"
                border.width: 3
                radius: 10
            }
            onClicked: {
                stackView.pop()
            }
        }
    }
} // TableModel {//     id: eventDateTable//     TableModelColumn {//         display: "name"//     }//     TableModelColumn {//         display: "age"//     }//     rows: [{//             "name": "Tom",//             "age": 39//         }, {
//             "name": "Bob",
//             "age": 43
//         }, {
//             "name": "Sam",
//             "age": 28
//         }]
// }
// TableView {
//     model: eventDateTable
//     Layout.fillWidth: parent
//     Layout.fillHeight: parent
//     Layout.margins: 25
//     delegate: Text {
//         text: model.display
//     }
// }

