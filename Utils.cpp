#include <QDebug>
#include <QFile>
#include <QUrl>

#include "Utils.h"

Utils::Utils(QObject *parent) : QObject(parent)
{

}

QString Utils::fileContents(const QUrl &path)
{
    qDebug() << "Attempting to read contents of file" << path;

    QFile file(path.toLocalFile());

    QString contents;

    if (file.open(QFile::ReadOnly)) {
        contents = file.readAll();
    }
    else {
        qWarning() << "Utils: Failed to read contents of" << path;
    }

    return contents;
}
