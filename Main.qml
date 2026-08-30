import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("History Сalendar")
    color: "#D8FFD1"
    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        spacing: 10
        Canvas {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            Layout.margins: 10
            antialiasing: true

            function createEllipse() {
                const context = getContext("2d")

                var radius = 5
                //переменная для C++ под размер окна
                for (var i = 10; i < width; i += 35) {

                    var topX = i
                    var topY = 10
                    var bottomX = i
                    var bottomY = 40

                    context.strokeStyle = "black"
                    context.fillStyle = "white"
                    context.lineWidth = 1

                    context.beginPath()
                    context.arc(topX, topY, radius, 0, 2 * Math.PI)
                    context.fill()
                    context.stroke()

                    context.beginPath()
                    context.arc(bottomX, bottomY, radius, 0, 2 * Math.PI)
                    context.fill()
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
            Layout.margins: 20

            Rectangle {

                width: 300
                height: 200
                color: "#A1FA91"
                border.color: "#2A5722"
                border.width: 3
                radius: 10

                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.columnSpan: 2
                ColumnLayout {
                    anchors.fill: parent
                    Layout.margins: 5
                    Text {
                        id: txtTuesday
                        text: qsTr("2026-08-29")
                        color: "#2A5722"
                        wrapMode: Text.Wrap
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 48
                        font.styleName: "Inter"
                        font.underline: true
                        font.italic: true

                        Layout.margins: 5
                        Layout.fillWidth: true
                    }
                    Text {
                        id: txtYesterday
                        text: qsTr("1883-08-29")
                        color: "#2A5722"
                        wrapMode: Text.Wrap
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 48
                        font.styleName: "Inter"
                        font.underline: true
                        font.italic: true

                        Layout.margins: 5
                        Layout.fillWidth: true
                    }
                    Text {
                        id: txtEvnt
                        text: qsTr("В Оттаве канадский изобретатель и бизнесмен Томас Ахерн продемонстрировал первую электроплиту.")
                        color: "#2A5722"
                        wrapMode: Text.Wrap
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 24
                        font.styleName: "Inter"
                        font.underline: true
                        font.italic: true

                        Layout.margins: 5
                        Layout.fillWidth: true
                    }
                }
            }

            Button {
                id: settingsButton
                icon.source: "icons/cog.svg"
                icon.color: "transparent"
                icon.width: 32
                icon.height: 32

                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 5
                background: Rectangle {

                    implicitWidth: 32
                    implicitHeight: 32
                    color: settingsButton.pressed ? "#1fa307" : settingsButton.hovered ? "#bafbae" : "#A1FA91"

                    radius: 7
                    border.width: 2.0
                    border.color: "#2A5722"
                }
            }
            Button {
                id: manualButton
                icon.source: "icons/info2.svg"
                icon.color: "transparent"
                icon.width: 32
                icon.height: 32

                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 5
                background: Rectangle {

                    implicitWidth: 32
                    implicitHeight: 32
                    color: manualButton.pressed ? "#1fa307" : manualButton.hovered ? "#bafbae" : "#A1FA91"

                    radius: 7
                    border.width: 2.0
                    border.color: "#2A5722"
                }
            }
        }
    }
}
