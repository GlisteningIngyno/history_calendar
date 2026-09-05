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

#include <clicker.h>
#include "database.h"

void initDatabase();
void addEventDatebase();
void deleteEventDatebase();
QString printEventDateBase(QString dateYesterday);

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/HistoryProject2/Main.qml"));

    QDate dateDay = QDate::currentDate();
    engine.rootContext()->setContextProperty("tuesdayDate", dateDay.toString("yyyy-MM-dd"));

    qmlRegisterType<clicker>("clicker", 1, 0,"Clicker");
    qmlRegisterType<database>("datebase",1,0,"Datebase");

    int current = QRandomGenerator::global()->bounded(1,121);
    int yyTuesday =  dateDay.year()-current;
    int mmTuesday = dateDay.month();
    int ddTuesday = dateDay.day();
    QDate dateYesterday(yyTuesday,mmTuesday,ddTuesday);
    engine.rootContext()->setContextProperty("yesterdayDate", dateYesterday.toString("yyyy-MM-dd"));

    initDatabase();
    QString eventStr = printEventDateBase(dateYesterday.toString("yyyy-MM-dd"));
    engine.rootContext()->setContextProperty("eventDate",eventStr);
    engine.load(url);

    return app.exec();
}

