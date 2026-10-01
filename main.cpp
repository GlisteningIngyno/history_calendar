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

#include "database.h"
#include <QVariantMap>

void initDatabase();
void addEventDatebase();
QString printEventDateBase(QString dateYesterday);

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/HistoryProject2/Main.qml"));


    qmlRegisterType<database>("datebase",1,0,"Datebase");

    QVariantMap settings = {
        {"1", "январь"},
        {"2", "февраль"},
        {"3", "март"},
        {"4", "апрель"},
        {"5", "май"},
        {"6", "июнь"},
        {"7", "июль"},
        {"8", "август"},
        {"9", "сентябрь"},
        {"10", "октябрь"},
        {"11", "ноябрь"},
        {"12", "декабрь"},
    };

    QDate dateDay = QDate::currentDate();
    int current = QRandomGenerator::global()->bounded(1,121);
    int yyTuesday =  dateDay.year()-current;
    int mmTuesday = dateDay.month();
    int ddTuesday = dateDay.day();

    QString numberYear = QString::fromStdString(std::to_string(yyTuesday));
    QString numberMonth = QString::fromStdString(std::to_string(mmTuesday));
    QString result = "ПУСТO";
    if(settings.contains(numberMonth)){
        result = settings[numberMonth].toString()+" "+numberYear;
    }

    QString tDdTuesday = QString::fromStdString(std::to_string(ddTuesday));
    if(ddTuesday < 10){
        tDdTuesday = "0"+QString::fromStdString(std::to_string(ddTuesday));
    }

    engine.rootContext()->setContextProperty("txtDayComp", tDdTuesday);
    engine.rootContext()->setContextProperty("txtYearComp", result);

    initDatabase();
    QDate dateYesterday(yyTuesday,mmTuesday,ddTuesday);
    QString eventStr = printEventDateBase(dateYesterday.toString("yyyy-MM-dd"));

    engine.rootContext()->setContextProperty("txtEventDateComp",eventStr);

    engine.load(url);
    return app.exec();
}


