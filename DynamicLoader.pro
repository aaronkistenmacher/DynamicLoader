TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    Utils.cpp

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = /home/kistea1/projects/sample/DynamicLoader/qml
QML2_IMPORT_PATH = /home/kistea1/projects/sample/DynamicLoader/qml

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    config/screens.json \
    qml/Framework/MainWindow.qml \
    qml/Framework/ScreenLoader.js \
    qml/Framework/SelectionScreen.qml \
    qml/Widgets/Button.qml \
    qml/Widgets/qmldir \
    qml/Screens/SimpleView.qml

HEADERS += \
    Colors.h \
    Utils.h

