import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels

Rectangle {
    color: "#D8FFD1"
    property StackView stackView: null // Свойство для связи со StackView

    ColumnLayout {
        anchors.fill: parent
        Button {
            Layout.margins: 10
            background: Rectangle {
                implicitWidth: 32
                implicitHeight: 32
                color: "aqua"
            }
            onClicked: {
                stackView.pop()
            }
        }
    }
}
