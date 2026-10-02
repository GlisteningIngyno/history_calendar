
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels
import QtQuick.Dialogs

import datebase


Item {
    Datebase{
        id: dateBaseCreate
    }
    ItemPage {
        id: itemPageTemp
    }
    FontLoader {
        id: electrolize
        source: "fonts/Electrolize-Regular.ttf"
    }
    ColumnLayout{
        anchors.fill: parent
        RowLayout{
            Layout.fillWidth: true
            Button {
                id: btReturn
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
                    color: btReturn.pressed ? "#4E3C2B" : btReturn.hovered ? "#B8916A" : "#F2E0C8"
                }
                onClicked: {
                    stackViewTop.pop()
                }
            }
            Button {
                id: btSearchPosition
                width: 32

                height: 32
                icon.width: 32
                icon.height: 32
                icon.color: "transparent"
                icon.source: "icons/search"

                Layout.fillWidth: true
                background: Rectangle {
                    implicitWidth: 32
                    implicitHeight: 32
                    color: btSearchPosition.pressed ? "#4E3C2B" : btSearchPosition.hovered ? "#B8916A" : "#F2E0C8"
                }
                onClicked: {
                    btReturn.visible = false
                    btSearchPosition.visible = false

                    txtFieldSearch.visible = true
                    btCross.visible = true
                }
            }
            Button {
                id: btCross
                width: 32
                height: 32
                icon.width: 32
                icon.height: 32
                icon.color: "transparent"
                icon.source: "icons/cross"
                visible: false
                Layout.fillWidth: true
                background: Rectangle {
                    implicitWidth: 32
                    implicitHeight: 32
                    color: btCross.pressed ? "#4E3C2B" : btCross.hovered ? "#B8916A" : "#F2E0C8"
                }
                onClicked: {
                    btReturn.visible = true
                    btSearchPosition.visible = true

                    txtFieldSearch.visible = false
                    btCross.visible = false

                    dateBaseCreate.printTableDB()

                }
            }
            TextField{
                id: txtFieldSearch
                visible: false

                text: "Введите дату"
                color: "black"
                wrapMode: Text.NoWrap
                clip: true
                font.pixelSize: 16
                font.family: electrolize.name
                font.weight: Font.Normal

                Layout.fillWidth: parent
                background: Rectangle {
                    implicitWidth: 160
                    implicitHeight: 25
                    color: "transparent"
                }
                onAccepted: {
                    if(txtFieldSearch.text === ""){
                        dateBaseCreate.printTableDB()
                    }
                    else{
                        dateBaseCreate.printTableDB(txtFieldSearch.text)
                        itemPageTemp.visible = false
                    }
                }
            }
        }
        ColumnLayout{
            Layout.fillWidth: true
            Layout.fillHeight: true
            ListView {
                id: listView
                orientation: Qt.Vertical
                Layout.fillWidth: true
                Layout.fillHeight: true
                clip: true
                model: ListModel {
                    id:listModel
                }
                delegate: Item {
                    width: listView.width
                    height: 56
                    Rectangle {
                        anchors.fill: parent
                        opacity: 1.0
                        color: "#FFCEB6"
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 12
                            anchors.rightMargin: 12
                            spacing: 16
                            Column {
                                spacing: 3
                                Layout.alignment: Qt.AlignVCenter
                                Repeater {
                                    model: 3
                                    Rectangle {
                                        width: 5
                                        height: 5
                                        radius: 2.5
                                        color: "#3a3a3a"
                                    }
                                }
                            }
                            Text {
                                text: model.date
                                font.pixelSize: 16
                                color: "#1a1a1a"
                                font.family: electrolize.name
                                font.weight: Font.Normal
                                Layout.alignment: Qt.AlignVCenter
                            }
                            Text {
                                text: model.event
                                font.pixelSize: 16
                                color: "#1a1a1a"
                                elide: Text.ElideRight
                                font.family: electrolize.name
                                font.weight: Font.Normal
                                Layout.fillWidth: true
                                Layout.alignment: Qt.AlignVCenter
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked:{
                                parent.color = "#BF847E"
                                console.log("Clicked:", model.date)
                                itemPageTemp.txtDataVal = model.date
                                itemPageTemp.txtEventVal = model.event
                                console.log("Model.Event:", model.event)
                                stackViewTop.push(itemPageTemp)
                            }
                            onEntered:{
                                parent.color = "#FA968C"
                            }
                            onExited: {
                                parent.color = "#FFCEB6"
                            }
                        }
                    }
                    Rectangle {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: 1
                        color: "#b8a48e"
                    }
                }
            }
        }
        Connections {
               target: dateBaseCreate
               function onOnPrintTableDB(dataList) {
                   listModel.clear()
                   for (var i = 0; i < dataList.length; i++) {
                       listModel.append(dataList[i])
                   }
               }
        }
        Component.onCompleted: {
            dateBaseCreate.printTableDB()
        }
    }
}

