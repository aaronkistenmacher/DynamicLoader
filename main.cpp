#include <QDir>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "Colors.h"
#include "Utils.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Colors *colors = new Colors(&engine);
    engine.rootContext()->setContextProperty("Colors", colors);

    Utils *utils = new Utils(&engine);
    engine.rootContext()->setContextProperty("Utils", utils);

    engine.load(QUrl(QDir::currentPath() + "/qml/Framework/MainWindow.qml"));

    return app.exec();
}

