#include "clicker.h"
#include <QRandomGenerator>
#include <QDate>
#include "database.h"

clicker::clicker(QObject *object): QObject(object){

}
void clicker::clickYesterday(){
    QDate dateDay = QDate::currentDate();
    int current = QRandomGenerator::global()->bounded(1,121);
    int yyTuesday =  dateDay.year()-current;
    int mmTuesday = dateDay.month();
    int ddTuesday = dateDay.day();
    QDate dateYesterday(yyTuesday,mmTuesday,ddTuesday);
    emit onClickYesterday(dateYesterday.toString("yyyy-MM-dd"));
}
void clicker::clickEvent(QString dateYesterday){
    QString resultEvent = printEventDateBase(dateYesterday);
    emit onClickEvent(resultEvent);
}
