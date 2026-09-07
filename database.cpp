#include "database.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDir>
#include <QSqlError>
#include <QStandardPaths>
#include <QDebug>
#include <QUrl>
#include <QVariantList>

database::database(QObject *object): QObject(object) {}

QString getDatabasePath() {
    QString appDataPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir dir;
    if (!dir.exists(appDataPath)) {
        dir.mkpath(appDataPath);
    }
    return appDataPath + "/eventDB.db";
}
void initDatabase() {
    QString dbPath = getDatabasePath();
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(dbPath);

    if (!db.open()) {
        qDebug() << "Ошибка открытия БД:" << db.lastError().text();
        return;
    }

    QSqlQuery query;
    if (!query.exec("CREATE TABLE IF NOT EXISTS events ("
                    "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "event_date TEXT, "
                    "event_text TEXT)")) {
        qDebug() << "Ошибка создания таблицы:" << query.lastError().text();
    }
    db.close();
}
QString printEventDateBase(QString dateYesterday){
    QString country;
    QSqlDatabase db = QSqlDatabase::database();
    if (!db.isOpen()) {
        if (!db.open()) {
            qDebug() << "Ошибка открытия БД:" << db.lastError().text();
            return "Ошибка открытия БД";
        }
    }

    QSqlQuery query(db);
    query.prepare("SELECT event_text FROM events WHERE event_date = :dateYesterday");
    query.bindValue(":dateYesterday", dateYesterday);
    if (!query.exec()) {
        qDebug() << "Ошибка вывода данных:" << query.lastError().text();
        return "Ошибка выполнения";
    }
    if(query.first()){
        country = query.value(0).toString();
        qDebug() << "Успешное выполнение" << query.lastError().text();

    }else{
        qDebug() << "События на " << dateYesterday << " нет";
        return "События на дату нет";
    }
    return country;
}





void database::addDateClick(QString date, QString event){
    if(date == " " || date == "" || date == nullptr ){
        emit onAddDateClick("Неверное значение даты!");
        return;
    }
    if(event == " " || event == "" || event == nullptr ){
        emit onAddDateClick("Неверное значение события!");
        return;
    }
    QSqlDatabase db = QSqlDatabase::database();
    if (!db.isOpen()) {
        if (!db.open()) {
            qDebug() << "Ошибка открытия БД:" << db.lastError().text();
            emit onAddDateClick("Ошибка открытия БД");
            return;
        }
    }
    QSqlQuery query(db);
    query.prepare("INSERT INTO events (event_date, event_text) VALUES (:date, :text)");
    query.bindValue(":date", date);
    query.bindValue(":text", event);

    if (!query.exec()) {
        qDebug() << "Ошибка добавления:" << query.lastError().text();
        emit onAddDateClick("Ошибка добавления");
        return;
    } else {
        qDebug() << "Событие добавлено!";
        emit onAddDateClick("Событие добавлено!");
    }
}
void database :: deleteDateClick(QString date, QString event){
    QSqlDatabase db = QSqlDatabase::database();
    if (!db.isOpen()) {
        if (!db.open()) {
            qDebug() << "Ошибка открытия БД:" << db.lastError().text();
            return;
        }
    }
    QSqlQuery query(db);
    query.prepare("DELETE FROM events WHERE event_date = (:date)");
    query.bindValue(":date", date);

    if (!query.exec()) {
        qDebug() << "Ошибка удаления:" << query.lastError().text();
        emit onDeleteDateClick("Ошибка удаления:");

    } else {
        qDebug() << "Событие удалено!";
        emit onDeleteDateClick("Событие удалено!");
    }
}

void database::addFileClick(QUrl fileUrl){
    QSqlDatabase db = QSqlDatabase::database();
    if (!db.isOpen()) {
        if (!db.open()) {
            qDebug() << "Ошибка открытия БД:" << db.lastError().text();
            emit onAddDateClick("Ошибка открытия БД");
            return;
        }
    }
    QString filePath = fileUrl.toLocalFile();
    QFile file(filePath);

    if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        db.transaction();

        QSqlQuery query(db);
        query.prepare("INSERT INTO events (event_date, event_text) VALUES (:date, :text)");

        QTextStream textStream(&file);
        while (!textStream.atEnd()) {
            QString line = textStream.readLine().trimmed();
            if (line.isEmpty()) {
                continue;
            }
            QStringList fields = line.split(',');
            if (fields.size() < 2) {
                qWarning() << "Пропущена некорректная строка:" << line;
                continue;
            }
            query.bindValue(":date", fields[0].trimmed());
            query.bindValue(":text", fields[1].trimmed());
            if (!query.exec()) {
                qWarning() << "Ошибка вставки строки:" << query.lastError().text();
            }
        }
        db.commit();
        file.close();
        emit onAddFileClick("База данных успешно обновлена");

    } else{
        emit onAddFileClick("Файл не удалось открыть");
    }
}

void database:: printTableDB(){
    QVariantList finalDataList;
    QSqlDatabase db = QSqlDatabase::database();
    if (!db.isOpen()) {
        if (!db.open()) {
            qDebug() << "Ошибка открытия БД:" << db.lastError().text();

            emit onPrintTableDB(finalDataList);
            return;
        }
    }
    QSqlQuery query(db);
    query.prepare("SELECT event_date, event_text FROM events");
    if (!query.exec()) {
        qDebug() << "Ошибка выполнения запроса:" << query.lastError().text();
        emit onPrintTableDB(finalDataList);
        return;
    }
    while(query.next()){
        QVariantMap row;
        row["date"] = query.value("event_date").toString();
        row["event"] = query.value("event_text").toString();
        finalDataList.append(row);
    }
    emit onPrintTableDB(finalDataList);

}
