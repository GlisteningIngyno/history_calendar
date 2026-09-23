import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels
import QtQuick.Dialogs

import datebase
import "customcomponent"

Rectangle {
    color: "#D8FFD1"
    property StackView stackView: null
    Datebase {
        id: datebaseCustoms
    }
    FileDialog {
        id: fileDialog
        title: "Please choose a file"

        onAccepted: {
            console.log("You chose: " + fileDialog.selectedFile)
            datebaseCustoms.addFileClick(fileDialog.selectedFile)
        }
        onRejected: {
            console.log("Canceled")
        }
    }
    Dialog {
        id: dialog
        title: "Вы уверены, что хотите очистить таблицу?"

        standardButtons: Dialog.Ok | Dialog.Cancel
        implicitWidth: parent.width / 2
        implicitHeight: parent.height / 2

        anchors.centerIn: parent

        onAccepted: {
            console.log("Очистка содержимого таблицы!")
            datebaseCustoms.deleteFileClick()
        }
        onRejected: {
            console.log("Отмена чистки!")
        }
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
                    onClicked: {
                        fileDialog.open()
                    }
                }
                Text {
                    text: "Очистить содержимое таблицы"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter

                    Layout.fillWidth: parent
                    Layout.margins: 2
                    Layout.leftMargin: 10
                }
                CustomButton {
                    textCustom: "Очистить"
                    Layout.fillWidth: parent
                    Layout.margins: 2
                    Layout.columnSpan: 2
                    onClicked: {
                        dialog.open()
                    }
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
                    onClicked: {
                        stackView.push(openViewDateBase)
                    }
                }
                Text {
                    text: "Экспорт данных"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    Layout.fillWidth: parent
                }
                CustomButton {
                    textCustom: "Экпорт"
                    Layout.fillWidth: parent
                    Layout.columnSpan: 2
                    Layout.margins: 2
                    onClicked: {
                        datebaseCustoms.exportFileCSV()
                    }
                }
                function onFileAddDateChaged(newValue) {
                    txtAddEventFile.text = newValue
                    txtAddEventFile.visible = true
                }
                function onFileDeleteChanded(newValue) {
                    txtAddEventFile.text = newValue
                    txtAddEventFile.visible = true
                }
                function onExportFile_(newValue) {
                    txtAddEventFile.text = newValue
                    txtAddEventFile.visible = true
                }

                Component.onCompleted: {
                    datebaseCustoms.onDeleteFileClick.connect(
                                onFileDeleteChanded)
                    datebaseCustoms.onAddFileClick.connect(onFileAddDateChaged)
                    datebaseCustoms.onExportFileCSV.connect(onExportFile_)
                }
            }
        }
        RowLayout {
            Layout.fillWidth: parent
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
            Text {
                id: txtAddEventFile
                text: ""
                visible: false
            }
        }
    }

    Component {
        id: addEventDate
        CustomAddDeletePage {
            stackView: stackViewTop
        }
    }
    Component {
        id: openViewDateBase
        Rectangle {
            ColumnLayout {
                anchors.fill: parent

                TableModel {
                    id: userTable
                    TableModelColumn {
                        display: "date"
                    }
                    TableModelColumn {
                        display: "event"
                    }
                    rows: []
                }

                TableView {
                    model: userTable
                    delegate: Text {
                        text: model.display
                    }
                    Layout.fillWidth: parent
                    Layout.fillHeight: parent
                    Layout.margins: 30
                }
                RowLayout {
                    CustomButton {
                        pixelSizeCustom: 35
                        textCustom: "Отмена"
                        Layout.fillWidth: parent
                        Layout.margins: 10
                        onClicked: {
                            stackView.pop()
                        }
                    }
                    CustomButton {
                        pixelSizeCustom: 35
                        textCustom: "Вывести БД"
                        Layout.fillWidth: parent
                        Layout.margins: 10
                        onClicked: {
                            datebaseCustoms.printTableDB()
                        }
                    }
                }
            }
            Connections {
                target: datebaseCustoms
                function onOnPrintTableDB(dataList) {
                    userTable.rows = dataList
                }
            }
        }
    }
}
