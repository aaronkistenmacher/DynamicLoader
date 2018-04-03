#ifndef COLORS_H
#define COLORS_H

#include <QObject>
#include <QColor>

// Color names from: http://chir.ag/projects/name-that-color

class Colors : public QObject {
    Q_OBJECT
    Q_PROPERTY(QColor matisse READ matisse CONSTANT)
    Q_PROPERTY(QColor jellyBean READ jellyBean CONSTANT)
    Q_PROPERTY(QColor steelBlue READ steelBlue CONSTANT)

    Q_PROPERTY(QColor woodsmoke READ woodsmoke CONSTANT)

public:
    Colors(QObject *parent=0) : QObject(parent) { }

    // BLUES
    QColor matisse() const { return QColor("#2376A7"); }
    QColor jellyBean() const { return QColor("#246389"); }
    QColor steelBlue() const { return QColor("#488BB2"); }

    // GRAYS
    QColor woodsmoke() const { return QColor("#151518"); }
};

#endif // COLORS_H
