import QtQuick 2.4

Rectangle {
    id: container

    property alias text: buttonText.text

    signal clicked()

    implicitHeight: 200
    implicitWidth: 200

    color: mouseArea.pressed ? Colors.steelBlue : Colors.jellyBean

    radius: 3

    Text {
        id: buttonText

        anchors.fill: parent

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        elide: Text.ElideRight

        color: "white"
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        onClicked: container.clicked()
    }
}
