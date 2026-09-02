#include "clicker.h"
#include <QRandomGenerator>
#include <QDate>

clicker::clicker(QObject *object): QObject(object){

}
void clicker::clicked(){
    QDate dateDay = QDate::currentDate();
    int current = QRandomGenerator::global()->bounded(1,121);
    int yyTuesday =  dateDay.year()-current;
    int mmTuesday = dateDay.month();
    int ddTuesday = dateDay.day();
    QDate dateYesterday(yyTuesday,mmTuesday,ddTuesday);
    emit onClicked_two(dateYesterday.toString("yyyy-MM-dd"));
}


