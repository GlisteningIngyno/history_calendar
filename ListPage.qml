import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels
import QtQuick.Dialogs

import datebase


Item {
    Datebase{
        id: dateBaseCreate
    }

    ListView {
        id: listViewT
        Layout.fillWidth: true
        Layout.fillHeight: true // Займет всё оставшееся пространство
        clip: true              // Чтобы текст не вылезал при прокрутке
        spacing: 5

        // ОБЯЗАТЕЛЬНО: Описываем, КАК отображать каждую строчку из БД
        delegate: Rectangle {
            width: listViewT.width
            height: 40
            color: "#f5f5f5"
            border.color: "#e0e0e0"
            radius: 4

            RowLayout {
                anchors.fill: parent
                anchors.margins: 10

                Text {
                    // Из QVariantMap (C++) ключ "date" приходит сюда как свойство modelData.date
                    text: modelData.date
                    font.bold: true
                    Layout.preferredWidth: 100
                }

                Text {
                    // Ключ "event" приходит как modelData.event
                    text: modelData.event
                    Layout.fillWidth: true
                }
            }
        }
    }
    function onCreatedListView(newValue){
        listViewT.model = newValue
    }

    Component.onCompleted: {
        dateBaseCreate.onPrintTableDB.connect(onCreatedListView)
        dateBaseCreate.printTableDB()

    }
}
