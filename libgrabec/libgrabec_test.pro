# Unit tests

HEADERS += \
    $$PWD/../grabcommon.h \
    $$PWD/inc/ethercatmaster.h \
    $$PWD/inc/ethercatslave.h \
    $$PWD/inc/grabec_types.h \
    $$PWD/inc/slaves/goldsolowhistledrive.h \

SOURCES += \
    $$PWD/../grabcommon.cpp \
    $$PWD/src/ethercatmaster.cpp \
    $$PWD/src/ethercatslave.cpp \
    $$PWD/src/slaves/goldsolowhistledrive.cpp \
    $$PWD/tests/libgrabec_test.cpp \

INCLUDEPATH += \
      $$PWD/inc \
      $$PWD/../

# Qt unit-test config
QT       += testlib
QT       -= gui

TARGET = libgrabec_test

CONFIG   += c++11 console
CONFIG   -= app_bundle

TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# Ethercat lib
LIBS        += /opt/etherlab/lib/libethercat.a
INCLUDEPATH += /opt/etherlab/include/
DEPENDPATH  += /opt/etherlab/lib/

# Lib real-time
unix:!macx: LIBS += -L$$PWD/../libgrabrt/lib/ -lgrabrt

INCLUDEPATH += $$PWD/../libgrabrt $$PWD/../libgrabrt/inc
DEPENDPATH += $$PWD/../libgrabrt

unix:!macx: PRE_TARGETDEPS += $$PWD/../libgrabrt/lib/libgrabrt.a

# Lib state-machine
unix:!macx: LIBS += -L$$PWD/../../state_machine/lib/ -lstate_machine

INCLUDEPATH += $$PWD/../../state_machine $$PWD/../../state_machine/inc
DEPENDPATH += $$PWD/../../state_machine

unix:!macx: PRE_TARGETDEPS += $$PWD/../../state_machine/lib/libstate_machine.a

