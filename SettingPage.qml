import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels
import QtQuick.Dialogs

import datebase

GridLayout {
    Datebase {
        id: dateBaseCust
    }
    FileDialog {
        id: fileDialogUpload
        onAccepted: {
            console.log("You chose: " + fileDialogUpload.selectedFile)
            dateBaseCust.importFileClick(fileDialogUpload.selectedFile)
        }
        onRejected: {
            console.log("Отмена импорта")
        }
    }
    FileDialog {
        id: fileDialogDownload
        fileMode: FileDialog.SaveFile
        onAccepted: {
            console.log("You chose: " + fileDialogDownload.selectedFile)
            dateBaseCust.exportFileCSV(fileDialogDownload.selectedFile)
        }
        onRejected: {
            console.log("Отмена экспорта")
        }
    }
    Component{
        id: pageList
        ListPage{}

    }

    columns: 2
    rows: 3
    columnSpacing: 0
    rowSpacing: 0
    property StackView stackView: null
    Button {
        id: btReturn
        width: 20
        height: 20
        Layout.fillWidth: parent
        Layout.fillHeight: parent

        icon.width: 64
        icon.height: 64
        icon.color: "transparent"
        icon.source: "icons/reply-left"

        background: Rectangle {
            implicitWidth: 20
            implicitHeight: 20
            color: btReturn.pressed ? "#4E3C2B" : btReturn.hovered ? "#B8916A" : "#F2E0C8"
        }
        onClicked: {
            stackViewTop.pop()
        }
    }
    Button {
        id: btPrintDB
        width: 20
        height: 20
        Layout.fillWidth: parent
        Layout.fillHeight: parent

        icon.width: 64
        icon.height: 64
        icon.color: "transparent"
        icon.source: "icons/search"

        background: Rectangle {
            implicitWidth: 20
            implicitHeight: 20
            color: btPrintDB.pressed ? "#4E3C2B" : btPrintDB.hovered ? "#B8916A" : "#72583F"
        }
        onClicked: {
            stackViewTop.push(pageList)
        }
    }
    Button {
        id: btAddEvent2
        width: 20
        height: 20
        Layout.fillWidth: parent
        Layout.fillHeight: parent

        icon.width: 64
        icon.height: 64
        icon.color: "transparent"
        icon.source: "icons/plus"

        background: Rectangle {
            implicitWidth: 20
            implicitHeight: 20
            color: btAddEvent2.pressed ? "#4E3C2B" : btAddEvent2.hovered ? "#B8916A" : "#72583F"
        }
    }
    Button {
        id: btDeleteEvent2
        width: 20
        height: 20
        Layout.fillWidth: parent
        Layout.fillHeight: parent

        icon.width: 64
        icon.height: 64
        icon.color: "transparent"
        icon.source: "icons/minus"

        background: Rectangle {
            implicitWidth: 20
            implicitHeight: 20
            color: btDeleteEvent2.pressed ? "#4E3C2B" : btDeleteEvent2.hovered ? "#B8916A" : "#F2E0C8"
        }
    }
    Button {
        id: btImportFile
        width: 20
        height: 20
        Layout.fillWidth: parent
        Layout.fillHeight: parent

        icon.width: 64
        icon.height: 64
        icon.color: "transparent"
        icon.source: "icons/download"

        background: Rectangle {
            implicitWidth: 20
            implicitHeight: 20
            color: btImportFile.pressed ? "#4E3C2B" : btImportFile.hovered ? "#B8916A" : "#F2E0C8"
        }
        onClicked: {
            fileDialogDownload.open()
        }
    }
    Button {
        id: btExportFile
        width: 20
        height: 20
        Layout.fillWidth: parent
        Layout.fillHeight: parent

        icon.width: 64
        icon.height: 64
        icon.color: "transparent"
        icon.source: "icons/upload"

        background: Rectangle {
            implicitWidth: 20
            implicitHeight: 20
            color: btExportFile.pressed ? "#4E3C2B" : btExportFile.hovered ? "#B8916A" : "#72583F"
        }
        onClicked: {
            fileDialogUpload.open()
        }
    }
}
