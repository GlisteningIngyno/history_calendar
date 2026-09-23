import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    property StackView stackView: null
    Text {
        id: txtSettingAdd
        anchors.fill: parent
        anchors.margins: 5
        horizontalAlignment: Text.AlignRight

        text: ""
        font.pixelSize: 15
        color: "Red"
        width: 3
    }
    color: "#D8FFD1"
    ColumnLayout {
        anchors.fill: parent
        Text {
            text: "Введите дату:"
            Layout.fillWidth: parent
            Layout.fillHeight: parent
            Layout.margins: 10
            font.pixelSize: 35
        }
        TextField {
            id: textFieldDate
            Layout.fillWidth: parent
            Layout.fillHeight: parent
            Layout.margins: 3

            color: "black"
            font.pixelSize: 20
            background: Rectangle {
                color: "white"
                border.color: "black"
                border.width: 3
            }
        }
        Text {
            text: "Введите событие"
            Layout.fillWidth: parent
            Layout.fillHeight: parent
            Layout.margins: 10
            font.pixelSize: 35
        }
        TextField {
            id: textFieldEvent
            Layout.fillWidth: parent
            Layout.fillHeight: parent
            Layout.margins: 3

            color: "black"
            font.pixelSize: 20
            background: Rectangle {
                color: "white"
                border.color: "black"
                border.width: 3
            }
        }
        RowLayout {
            CustomButton {
                pixelSizeCustom: 35
                Layout.fillWidth: parent
                Layout.fillHeight: parent
                Layout.margins: 10

                onClicked: {
                    datebaseCustoms.addDateClick(textFieldDate.text,
                                                 textFieldEvent.text)
                }
            }
            CustomButton {
                pixelSizeCustom: 35
                textCustom: "Отмена"
                Layout.fillWidth: parent
                Layout.fillHeight: parent
                Layout.margins: 10
                onClicked: {
                    stackView.pop()
                }
            }
        }
    }
    function onChangedDateBase(newValue) {
        txtSettingAdd.text = newValue
    }
    Component.onCompleted: {
        datebaseCustoms.onAddDateClick.connect(onChangedDateBase)
    }
}
