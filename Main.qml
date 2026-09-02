import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    //Для анимации используем Flipable
    width: 650
    height: 450
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
            Flipable {
                id: flipable
                Layout.fillHeight: parent
                Layout.fillWidth: parent
                Layout.columnSpan: 2
                property bool flipped: false
                front: ColumnLayout {
                    anchors.fill: parent //костыль
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#A1FA91"
                        border.color: "#2A5722"
                        border.width: 3
                        radius: 10
                        ColumnLayout {
                            anchors.fill: parent
                            Text {
                                id: txtTuesday
                                text: tuesdayDate
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
                                text: yesterdayDate
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
                                text: eventDate
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
                }
                back: ColumnLayout {
                    anchors.fill: parent
                    Rectangle {
                        color: "#A1FA91"
                        border.color: "#2A5722"
                        border.width: 3
                        radius: 10

                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        ColumnLayout {
                            anchors.fill: parent
                            Text {
                                id: txtTuesday_
                                text: tuesdayDate
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
                                id: txtYesterday_
                                text: yesterdayDate
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
                                id: txtEvnt_
                                text: eventDate
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
                }
                transform: Rotation {
                    id: rotation
                    origin.x: flipable.width / 2
                    origin.y: flipable.height / 2
                    axis {
                        x: 1
                        y: 0
                        z: 0
                        //Для исчезновения листа
                        // x: 1
                        // y: 0
                        // z: 1
                    } // Вращаем вокруг вертикальной оси Y
                    angle: 0 // Начальный угол
                }
                states: State {
                    name: "back"
                    when: flipable.flipped
                    PropertyChanges {
                        target: rotation
                        angle: 180
                    }
                }
                transitions: Transition {
                    NumberAnimation {
                        target: rotation
                        property: "angle"
                        duration: 500
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: flipable.flipped = !flipable.flipped
                }
            }
            Button {
                id: settingsButton
                icon.source: "icons/cog.svg"
                icon.color: "transparent"
                icon.width: 32
                icon.height: 32

                Layout.fillWidth: parent
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

                Layout.fillWidth: parent
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
