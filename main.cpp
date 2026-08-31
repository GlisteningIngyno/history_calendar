#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDate>
#include <QQmlContext>
#include <QRandomGenerator>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDir>
#include <QSqlError>
#include <QStandardPaths>
#include <QDebug>


void initDatabase();
void addEventDatebase();
void deleteEventDatebase();
QString printEventDateBase();

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/HistoryProject2/Main.qml"));

    QDate dateDay = QDate::currentDate();
    engine.rootContext()->setContextProperty("tuesdayDate", dateDay.toString("yyyy-MM-dd"));

    int current = QRandomGenerator::global()->bounded(1,121);
    int yyTuesday =  dateDay.year()-current;
    int mmTuesday = dateDay.month();
    int ddTuesday = dateDay.day();
    QDate dateYesterday(yyTuesday,mmTuesday,ddTuesday);
    engine.rootContext()->setContextProperty("yesterdayDate", dateYesterday.toString("yyyy-MM-dd"));


    //Произвести поиск даты в БД и вывести ее на экран
    //Рассмотреть выбор SQLlite
    initDatabase();
    // addEventDatebase();
    // deleteEventDatebase();
    QString eventStr = printEventDateBase();
    engine.rootContext()->setContextProperty("eventDate",eventStr);


    engine.load(url);

    return app.exec();
}
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
QString printEventDateBase(){
    QString country;
    QSqlDatabase db = QSqlDatabase::database();
    if (!db.isOpen()) {
        if (!db.open()) {
            qDebug() << "Ошибка открытия БД:" << db.lastError().text();
            return "Ошибка открытия БД";
        }
    }
    QSqlQuery query(db);

    if (!query.exec("SELECT event_text FROM events")) {
        qDebug() << "Ошибка вывода данных:" << query.lastError().text();
    }
    if(query.first()){
        country = query.value(0).toString();
    }
    return country;
}
