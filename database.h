#ifndef DATABASE_H
#define DATABASE_H


#include <QObject>
#include <QString>

class database : public QObject
{
    Q_OBJECT
public:
    database(QObject *object = nullptr);

    Q_INVOKABLE void addDateClick(QString date, QString event);
    Q_INVOKABLE void deleteDateClick(QString date, QString event);
signals:
    void onAddDateClick(QString);
    void onDeleteDateClick(QString);
private:
    QString value{};
    QString event{};
};

QString getDatabasePath();
void initDatabase();
QString printEventDateBase(QString dateYesterday);

#endif // DATABASE_H
