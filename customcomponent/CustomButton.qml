import QtQuick 2.15
import QtQuick.Controls

Button {
    property url iconSource: "icons/house.svg"
    property string textCustom: qsTr("Добавить")
    property int pixelSizeCustom: 15

    id: homeButton

    background: Rectangle {
        implicitWidth: 52
        implicitHeight: 52

        color: homeButton.pressed ? "#65BAAE" : homeButton.hovered ? "#A8F4E8" : "#8AFFED"
        border.color: "#2A5722"
        border.width: 1
        radius: 5
        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: homeButton.pixelSizeCustom

            id: name
            text: homeButton.textCustom
            color: "black"
        }
    }
}
