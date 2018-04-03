#ifndef UTILS_H
#define UTILS_H

#include <QObject>

class QUrl;

class Utils : public QObject
{
    Q_OBJECT
public:
    explicit Utils(QObject *parent = 0);

    Q_INVOKABLE static QString fileContents(const QUrl &path);
};

#endif // UTILS_H
