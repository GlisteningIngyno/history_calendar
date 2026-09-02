#ifndef CLICKER_H
#define CLICKER_H

#include <QObject>
#include <QString>

class clicker : public QObject
{
    Q_OBJECT
public:
    clicker(QObject *object = nullptr);

    Q_INVOKABLE void clicked();

signals:
    void onClicked_two(QString);

private:
    QString value{};
};

#endif // CLICKER_H
