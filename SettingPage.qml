import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels

import datebase
import "customcomponent"

Rectangle {
    color: "#D8FFD1"
    property StackView stackView: null // Свойство для связи со StackView
    Datebase {
        id: datebaseCustoms
    }

    ColumnLayout {
        anchors.fill: parent
        Text {
            text: "Настройки"
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 48
            font.styleName: "Inter"
            Layout.fillWidth: parent
            Layout.margins: 10
        }

        Rectangle {
            color: "#A1FA91"
            border.color: "#2A5722"
            border.width: 3
            radius: 5

            Layout.fillWidth: parent
            Layout.fillHeight: parent
            Layout.margins: 10

            GridLayout {
                anchors.fill: parent
                anchors.margins: 5
                columns: 3
                rows: 4
                columnSpacing: 5
                Text {
                    text: "Добавить дату или файл"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    Layout.fillWidth: parent
                }
                CustomButton {
                    textCustom: "Добавить"
                    Layout.fillWidth: parent
                    Layout.margins: 2
                    onClicked: {
                        stackView.push(addEventDate)
                    }
                }
                CustomButton {
                    textCustom: "Файл"

                    Layout.fillWidth: parent
                    Layout.margins: 2
                }
                Text {
                    text: "Удалить дату или файл"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter

                    Layout.fillWidth: parent
                    Layout.margins: 2
                    Layout.leftMargin: 10
                }
                CustomButton {
                    textCustom: "Удалить"
                    Layout.fillWidth: parent
                    Layout.margins: 2
                    onClicked: {
                        stackView.push(deleteEventDate)
                    }
                }
                CustomButton {
                    textCustom: "Файл"
                    Layout.fillWidth: parent
                    Layout.margins: 2
                }
                Text {
                    text: "Таблица данных"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter

                    Layout.fillWidth: parent
                }
                CustomButton {
                    textCustom: "Смотреть"
                    Layout.fillWidth: parent
                    Layout.columnSpan: 2
                    Layout.margins: 2
                }

                Text {
                    text: "Изменить тему"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter

                    Layout.fillWidth: parent
                }
                CustomButton {
                    textCustom: "Изменить"
                    Layout.fillWidth: parent
                    Layout.columnSpan: 2
                    Layout.margins: 2
                }
            }
        }

        Button {
            id: homeButton
            icon.source: "icons/house.svg"
            icon.color: "transparent"
            icon.width: 32
            icon.height: 32

            Layout.margins: 15

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
    Component {
        id: addEventDate
        Rectangle {
            Text {
                id: txtSettingAdd
                anchors.fill: parent
                anchors.margins: 5
                text: ""
            }

            color: "#D8FFD1"
            GridLayout {
                anchors.fill: parent
                anchors.margins: 5
                columns: 3
                rows: 3
                columnSpacing: 5
                TextField {
                    id: textFieldDate
                    Layout.fillWidth: parent
                    color: "pink"
                }
                TextField {
                    id: textFieldEvent
                    Layout.fillWidth: parent
                }
                CustomButton {
                    Layout.fillWidth: parent
                    onClicked: {
                        datebaseCustoms.addDateClick(textFieldDate.text,
                                                     textFieldEvent.text)
                    }
                }
            }
            function onChangedDateBase(newValue) {
                txtSettingAdd.text = newValue
            }
            Component.onCompleted: {
                datebaseCustoms.onAddDateClick.connect(onChangedDateBase)
            }
        }
    }
    Component {
        id: deleteEventDate
        Rectangle {
            Text {
                id: txtSettingDelete
                anchors.fill: parent
                anchors.margins: 5
                text: ""
            }

            color: "#D8FFD1"
            GridLayout {
                anchors.fill: parent
                anchors.margins: 5
                columns: 3
                rows: 3
                columnSpacing: 5
                TextField {
                    id: textFieldDate
                    Layout.fillWidth: parent
                    color: "pink"
                }
                TextField {
                    id: textFieldEvent
                    Layout.fillWidth: parent
                }
                CustomButton {
                    Layout.fillWidth: parent
                    onClicked: {
                        datebaseCustoms.deleteDateClick(textFieldDate.text)
                    }
                }
            }
            function onChangedDateBase(newValue) {
                txtSettingAdd.text = newValue
            }
            Component.onCompleted: {
                datebaseCustoms.onDeleteDateClick.connect(onChangedDateBase)
            }
        }
    }
}
