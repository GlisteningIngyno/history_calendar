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
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.columnSpan: 2
                Layout.margins: 5
                ColumnLayout {
                    spacing: 10
                    Text {
                        id: txtRectangle1
                        text: qsTr("Текущая дата")
                    }
                    Text {
                        id: txtRectangle2
                        text: qsTr("Дата прошлого")
                    }
                    Text {
                        id: txtRectangle3
                        text: qsTr("Историческое событие")
                    }
                }
            }
            Button {
                width: 50
                height: 50
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 5
                Text {
                    id: btSettings
                    text: qsTr("Настройки")
                }
            }
            Button {
                width: 50
                height: 50
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 5
                Text {
                    id: btManual
                    text: qsTr("Справка")
                }
            }
        }
    }
}
