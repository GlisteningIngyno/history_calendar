import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("History Сalendar")
    color: "#e9d1af"
    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        spacing: 10
        Canvas {
            //надо исправялть, на Layout
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            Layout.margins: 1
            antialiasing: true

            function createEllipse() {
                const context = getContext("2d")

                var radius = 5
                //переменная для C++ под размер окна
                for (var i = 10; i < width; i += 20) {

                    var topX = i
                    var topY = 10
                    var bottomX = i
                    var bottomY = 40

                    context.strokeStyle = "black"
                    context.lineWidth = 1

                    context.beginPath()
                    context.arc(topX, topY, radius, 0, 2 * Math.PI)
                    context.stroke()

                    context.beginPath()
                    context.arc(bottomX, bottomY, radius, 0, 2 * Math.PI)
                    context.stroke()

                    context.strokeStyle = "green"
                    context.beginPath()
                    context.moveTo(topX, topY)
                    context.lineTo(bottomX, bottomY)
                    context.stroke()
                }
            }
            onPaint: createEllipse()
        }
        GridLayout {
            columns: 2
            rows: 2
            rowSpacing: 10
            columnSpacing: 300

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5

            Rectangle {
                width: 300
                height: 200
                color: "white"
                border.color: "#00cec9"
                border.width: 3
                radius: 10
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.columnSpan: 2
                GridLayout {
                    columns: 3
                    rows: 3
                    anchors.fill: parent
                    columnSpacing: 3
                    rowSpacing: 3
                    Rectangle {
                        antialiasing: true
                        color: "#81ecec"
                        border.color: "#00cec9"
                        border.width: 2
                        radius: 10
                        height: 100
                        width: 100
                        Layout.row: 0
                        Layout.column: 1
                        Layout.fillWidth: true
                        Text {
                            id: txt1
                            text: qsTr("2026-08-28")
                            font.pixelSize: 40
                        }
                    }
                    Rectangle {
                        antialiasing: true
                        color: "#81ecec"
                        border.color: "#00cec9"
                        border.width: 2
                        radius: 10
                        height: 100
                        width: 100
                        Layout.row: 1
                        Layout.column: 0
                        Layout.fillWidth: true
                        Text {
                            id: txt2
                            text: qsTr("1026-08-28")
                            font.pixelSize: 40
                        }
                    }
                    Rectangle {
                        antialiasing: true
                        color: "#81ecec"
                        border.color: "#00cec9"
                        border.width: 2
                        radius: 10
                        height: 100
                        width: 100
                        Layout.row: 1
                        Layout.column: 2
                        Layout.fillWidth: true
                        Text {
                            id: txt3
                            text: qsTr("Winner")
                            font.pixelSize: 40
                        }
                    }
                    Button {
                        antialiasing: true
                        // color: "#81ecec"
                        // border.color: "#00cec9"
                        // border.width: 2
                        // radius: 10
                        height: 100
                        width: 100
                        Layout.row: 2
                        Layout.column: 1
                        Layout.preferredHeight: 60
                        Layout.fillWidth: true
                        text: "-->"
                        // Layout.fillHeight: true
                    }
                    // Text {
                    //     id: txtRectangle1
                    //     text: qsTr("Текущая дата")
                    //     font.pixelSize: 15
                    //     Layout.row: 0
                    //     Layout.column: 1
                    //     Layout.fillWidth: true
                    // }
                    // Text {==
                    //     id: txtRectangle2
                    //     font.pixelSize: 15
                    //     text: qsTr("Дата прошлого")
                    //     Layout.row: 1
                    //     Layout.column: 0
                    //     Layout.fillWidth: true
                    // }
                    // Text {
                    //     id: txtRectangle3
                    //     text: qsTr("Историческое событие")
                    //     font.pixelSize: 15
                    //     Layout.row: 1
                    //     Layout.column: 2
                    //     Layout.fillWidth: true
                    // }
                    // Button {
                    //     text: "-->"
                    //     font.pixelSize: 15

                    //     Layout.row: 2
                    //     Layout.column: 1
                    //     Layout.fillWidth: true
                    // }
                }
            }
            Button {
                width: 50
                height: 50
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 5
                text: qsTr("Настройки")
            }
            Button {
                width: 50
                height: 50
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 5
                text: qsTr("Справка")
            }
        }
    }
}
