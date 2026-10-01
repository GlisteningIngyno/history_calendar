import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels

ApplicationWindow {
    width: 300
    height: 500
    visible: true
    title: qsTr("History Сalendar")
    color: "#F2E0C8"
    StackView {
        id: stackViewTop
        anchors.fill: parent
        initialItem: mainPage
    }
    FontLoader {
        id: electrolize
        source: "fonts/Electrolize-Regular.ttf"
    }
    Component {
        id: mainPage
        ColumnLayout {
            Button {
                id: btSettings
                height: 30
                width: 30
                Layout.leftMargin: 30
                Layout.topMargin: 10

                background: ColumnLayout {
                    spacing: 3
                    Rectangle {
                        implicitWidth: 30
                        implicitHeight: 5
                        color: btSettings.pressed ? "#4E3C2B" : btSettings.hovered ? "#B8916A" : "#72583F"
                    }
                    Rectangle {
                        implicitWidth: 30
                        implicitHeight: 5
                        color: btSettings.pressed ? "#4E3C2B" : btSettings.hovered ? "#B8916A" : "#72583F"
                    }
                    Rectangle {
                        implicitWidth: 30
                        implicitHeight: 5
                        color: btSettings.pressed ? "#4E3C2B" : btSettings.hovered ? "#B8916A" : "#72583F"
                    }
                }
                onClicked: {
                    stackViewTop.push(pageSettings)
                }
            }
            //Главное поле
            ColumnLayout {
                Layout.leftMargin: 65

                Text {
                    id: txtDay
                    text: txtDayComp
                    font.pixelSize: 128
                    font.family: electrolize.name
                    font.weight: Font.Normal
                }
                Text {
                    id: txtMonthYear
                    text: txtYearComp
                    font.pixelSize: 24
                    font.family: electrolize.name
                    font.weight: Font.Normal

                }
            }
            ColumnLayout {
                spacing: 10
                Layout.fillHeight: parent
                Text {
                    id: txtEventDay
                    text: qsTr("Событие дня")
                    font.pixelSize: 15
                    font.family: electrolize.name
                    font.weight: Font.Normal

                    Layout.leftMargin: 30
                }
                Text {
                    id: txtEventText
                    text: txtEventDateComp

                    font.pixelSize: 15
                    font.family: electrolize.name
                    font.weight: Font.Normal
                    font.underline: true

                    wrapMode: Text.Wrap
                    Layout.fillWidth: parent
                    Layout.leftMargin: 45
                    Layout.rightMargin: 15

                }
                //Переделать в кнопку
                Text {
                    id: txtEventMore
                    text: qsTr("Больше событий...")
                    font.pixelSize: 15
                    font.family: electrolize.name
                    font.weight: Font.Normal

                    Layout.leftMargin: 30
                }
            }
            //Нижняя панель
            GridLayout {
                columns: 2
                rows: 2
                columnSpacing: 60
                Layout.leftMargin: 30
                TextField {
                    width: 260
                    height: 25
                    text: "Создать событие"
                    font.pixelSize: 15
                    font.family: electrolize.name
                    font.weight: Font.Normal
                    color: "black"
                    wrapMode: Text.NoWrap
                    clip: true

                    background: Rectangle {
                        implicitWidth: 160
                        implicitHeight: 25
                        color: "transparent"
                    }
                }
                Button {
                    id: btAddEvent
                    width: 20
                    height: 20
                    background: Rectangle {
                        implicitWidth: 20
                        implicitHeight: 20
                        radius: 50
                        border.color: "black"
                        color: btAddEvent.pressed ? "#4E3C2B" : btAddEvent.hovered ? "#B8916A" : "transparent"
                        Text {
                            anchors.centerIn: parent
                            id: txtBtAddEvent
                            text: qsTr("+")
                            font.pixelSize: 30
                            font.family: electrolize.name
                            font.weight: Font.Normal
                        }
                    }
                }
                Rectangle {
                    width: 100
                    height: 3
                    Layout.columnSpan: 2
                    Layout.fillWidth: parent
                    color: "black"
                }
            }
        }
    }
    Component {
        id: pageSettings
        SettingPage {}
    }
}
