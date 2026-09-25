import QtQuick 2.15
import QtQuick.Controls


Item {

    property id nameID: null

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
}
