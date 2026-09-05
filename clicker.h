#ifndef CLICKER_H
#define CLICKER_H

#include <QObject>
#include <QString>

class clicker : public QObject
{
    Q_OBJECT
public:
    clicker(QObject *object = nullptr);

    Q_INVOKABLE void clickYesterday();
    Q_INVOKABLE void clickEvent(QString dateYesterday);

signals:
    void onClickYesterday(QString);
    void onClickEvent(QString);
};

#endif // CLICKER_H
