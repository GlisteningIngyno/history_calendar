#ifndef DATABASE_H
#define DATABASE_H

#include <QString>

class database
{
public:
    database();
};

QString getDatabasePath();
void initDatabase();
QString printEventDateBase(QString dateYesterday);
void addEventDatebase();
void deleteEventDatebase();



#endif // DATABASE_H
