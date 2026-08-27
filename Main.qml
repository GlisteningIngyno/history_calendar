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
        id: сolumnLayout
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 100

        spacing: 100
        Canvas {
            anchors.fill: parent
            function createEllipse() {
                const context = getContext("2d")

                var radius = 5
                //переменная для C++ под размер окна
                for (var i = 10; i < 640; i += 20) {

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
            anchors.top: сolumnLayout.bottom
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            columns: 2 // два столбца
            rows: 2 // две строки
            columnSpacing: 480

            Canvas {
                Layout.columnSpan: 2
                Layout.preferredHeight: 300
                Layout.preferredWidth: 640
                onPaint: {
                    const context = getContext("2d")
                    context.strokeRect(10, 10, 620, 250)
                }
            }

            Button {
                Layout.preferredHeight: 80
                Layout.preferredWidth: 80
                text: "Настройки"
            }
            Button {
                Layout.preferredHeight: 80
                Layout.preferredWidth: 80
                text: "Справка"
            }
        }
    }
}
