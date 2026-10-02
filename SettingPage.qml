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
    Dialog {
        id: dialog
        title: "Вы, уверены?"
        standardButtons: Dialog.Ok | Dialog.Cancel

        anchors.centerIn: parent

        onAccepted: {
            dateBaseCust.deleteFileClick()
            console.log("Ok clicked")
        }
        onRejected:{
            console.log("Cancel clicked")
        }
    }
    AddDelPage{
        id: addDelPage1
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
        onClicked: {
            addDelPage1.addOrDelete = true
            stackViewTop.push(addDelPage1)
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
        onClicked: {
            addDelPage1.addOrDelete = false

            stackViewTop.push(addDelPage1)
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
    //Reset DB
    Button{
        id: btVisible
        width: 10
        height: 10
        Layout.fillWidth: parent
        Layout.fillHeight: parent
        Layout.columnSpan: 2
        visible: true

        icon.width: 32
        icon.height: 32
        icon.color: "transparent"
        icon.source: "icons/eye"


        background: Rectangle {
            implicitWidth: 20
            implicitHeight: 20
            color: btVisible.pressed ? "#4E3C2B" : btVisible.hovered ? "#B8916A" : "#BBA68D"
        }
        onClicked: {
            btResetDB.visible = true
            btNoVisible.visible = true

            btVisible.visible = false
        }

    }
    Button{
        id: btResetDB
        width: 32
        height: 32
        Layout.fillWidth: parent
        Layout.fillHeight: parent
        visible: false


        icon.width: 32
        icon.height: 32
        icon.color: "transparent"
        icon.source: "icons/trash"

        background: Rectangle {
            implicitWidth: 20
            implicitHeight: 20
            color: btResetDB.pressed ? "#4E3C2B" : btResetDB.hovered ? "#B8916A" : "#72583F"
        }
        onClicked: {
            dialog.open()
        }
    }
    Button{
        id: btNoVisible
        width: 20
        height: 20
        Layout.fillWidth: parent
        Layout.fillHeight: parent
        visible: false

        icon.width: 32
        icon.height: 32
        icon.color: "transparent"
        icon.source: "icons/eye-crossed"


        background: Rectangle {
            implicitWidth: 20
            implicitHeight: 20
            color: btNoVisible.pressed ? "#4E3C2B" : btNoVisible.hovered ? "#B8916A" : "#F2E0C8"
        }
        onClicked: {
            btResetDB.visible = false
            btNoVisible.visible = false
            btVisible.visible = true
        }
    }
    Component.onCompleted: {
        addDelPage1.visible = false


    }
}
