#ifndef DATABASE_H
#define DATABASE_H


#include <QObject>
#include <QString>
#include <QUrl>
#include <QVariantList>

class database : public QObject
{
    Q_OBJECT
public:
    database(QObject *object = nullptr);

    Q_INVOKABLE void addDateClick(QString date, QString event);
    Q_INVOKABLE void deleteDateClick(QString date, QString event);
    Q_INVOKABLE void importFileClick(QUrl filePath);
    Q_INVOKABLE void deleteFileClick();
    Q_INVOKABLE void printTableDB();
    Q_INVOKABLE void exportFileCSV(QUrl filePath);

signals:
    void onAddDateClick(QString);
    void onDeleteDateClick(QString);
    void onAddFileClick(QString);
    void onPrintTableDB(QVariantList);
    void onDeleteFileClick(QString);
    void onExportFileCSV(QString);
};

QString getDatabasePath();
void initDatabase();
QString printEventDateBase(QString dateYesterday);

#endif // DATABASE_H
