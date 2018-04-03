import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

import Widgets 1.0 as Widgets

import 'ScreenLoader.js' as MainScript

Item {
    id: container

    QtObject {
        //p-impl
        id: d

        // TODO make this configurable from the environment
        readonly property string rootDir: Qt.resolvedUrl('../../')
        readonly property string configDir: rootDir + 'config'
        property string screenDir

        function createScreen(path) {

        }

        function run() {
            viewStack.push(buttonGridComponent);
            var screenConfigFile = configDir + '/screens.json';
            var config = Utils.fileContents(screenConfigFile);

            try {
                var configJson = JSON.parse(config);

                var rootDir = d.rootDir + configJson['rootDir'];
                var screens = configJson['screens'];
                if (rootDir && screens) {
                    d.screenDir = rootDir;
                    for (var i = 0; i < screens.length; i++) {
                        screenModel.append(screens[i]);
                    }
                }
                else {
                    console.warn('Invalid config file', screenConfigFile);
                }
            }
            catch(error) {
                console.warn('Failed to parse config file', screenConfigFile);
            }
        }
    }

    Rectangle {
        anchors.fill: parent

        color: Colors.woodsmoke
    }

    ListModel {
        id: screenModel
    }

    Component {
        id: buttonGridComponent

        Item {
            GridLayout {
                id: buttonGrid

                columns: 3
                columnSpacing: 10
                rowSpacing: 10

                width: childrenRect.width
                height: childrenRect.height

                anchors.centerIn: parent

                Repeater {
                    id: buttonGridRepeater

                    model: screenModel

                    delegate: Widgets.Button {
                        text: model.name
                        onClicked: {
                            var screenFile = d.screenDir + model.view;
                            viewStack.push(screenFile);
                        }
                    }
                }
            }
        }
    }

    StackView {
        id: viewStack
        anchors.fill: parent

        delegate: StackViewDelegate {
            function transitionFinished(properties)
            {
                properties.exitItem.opacity = 1
            }

            pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 200
                }
                PropertyAnimation {
                    target: exitItem
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 200
                }
            }
        }
    }

    Widgets.Button {
        anchors { top: parent.top; left: parent.left; margins: 12 }

        height: 62

        text: "Back"

        visible: viewStack.depth > 1

        onClicked: viewStack.pop()
    }

    Component.onCompleted: d.run()

}

