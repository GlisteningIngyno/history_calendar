cmake_minimum_required(VERSION 3.16)

project(HistoryProject2 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Sql)

qt_standard_project_setup()

qt_add_executable(appHistoryProject2
    main.cpp

)

qt_add_qml_module(appHistoryProject2
    URI HistoryProject2
    VERSION 1.0
    QML_FILES
        Main.qml
    RESOURCES
        #ОБЯЗАТЕЛЬНО пометить в репозитории Иконки
        SOURCES database.h database.cpp
        QML_FILES SettingPage.qml
        fonts/Electrolize-Regular.ttf
        icons/download.svg
        icons/upload.svg
        icons/minus.svg
        icons/plus.svg
        icons/search.svg
        icons/reply-left.svg
        QML_FILES ListPage.qml

)


# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appHistoryProject2 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appHistoryProject2
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appHistoryProject2
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Sql
)

include(GNUInstallDirs)
install(TARGETS appHistoryProject2
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
