
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
    ColumnLayout{
        anchors.fill: parent
        RowLayout{
            Layout.fillWidth: true
            Button {
                id: btTopBar
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
                    color: btTopBar.pressed ? "#4E3C2B" : btTopBar.hovered ? "#B8916A" : "#F2E0C8"
                }
                onClicked: {
                    stackViewTop.pop()
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
                                Layout.alignment: Qt.AlignVCenter
                            }
                            Text {
                                text: model.event
                                font.pixelSize: 16
                                color: "#1a1a1a"
                                elide: Text.ElideRight
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

