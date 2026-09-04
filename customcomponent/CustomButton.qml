import QtQuick 2.15
import QtQuick.Controls

Button {
    id: homeButton
    icon.source: "icons/house.svg"
    icon.color: "transparent"
    icon.width: 32
    icon.height: 32

    background: Rectangle {
        implicitWidth: 52
        implicitHeight: 52

        color: homeButton.pressed ? "#1fa307" : homeButton.hovered ? "#bafbae" : "#A1FA91"
        border.color: "#2A5722"
        border.width: 3
        radius: 10
    }
    onClicked: {
        stackView.pop()
    }
}
