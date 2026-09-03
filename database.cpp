#include "database.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDir>
#include <QSqlError>
#include <QStandardPaths>
#include <QDebug>


database::database() {}

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
void addEventDatebase(){
    QSqlDatabase db = QSqlDatabase::database();
    if (!db.isOpen()) {
        if (!db.open()) {
            qDebug() << "Ошибка открытия БД:" << db.lastError().text();
            return;
        }
    }
    QSqlQuery query(db);
    query.prepare("INSERT INTO events (event_date, event_text) VALUES (:date, :text)");
    query.bindValue(":date", "2026-08-31");
    query.bindValue(":text", "В Оттаве канадский изобретатель и бизнесмен Томас Ахерн продемонстрировал первую электроплиту.");

    if (!query.exec()) {
        qDebug() << "Ошибка добавления:" << query.lastError().text();
    } else {
        qDebug() << "Событие добавлено!";
    }
}
void deleteEventDatebase(){
    QSqlDatabase db = QSqlDatabase::database();
    if (!db.isOpen()) {
        if (!db.open()) {
            qDebug() << "Ошибка открытия БД:" << db.lastError().text();
            return;
        }
    }
    QSqlQuery query(db);
    query.prepare("DELETE FROM events WHERE event_date = (:date)");
    query.bindValue(":date","2026-08-31");

    if (!query.exec()) {
        qDebug() << "Ошибка удаления:" << query.lastError().text();
    } else {
        qDebug() << "Событие удалено!";
    }
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
