HEADERS += \
    $$PWD/inc/cdpr_types.h \
    $$PWD/inc/kinematics.h \
    $$PWD/inc/diffkinematics.h \
    $$PWD/inc/diff2kinematics.h \
    $$PWD/inc/statics.h \
    $$PWD/inc/dynamics.h \
    $$PWD/inc/under_actuated_utils.h \
    $$PWD/tools/json.hpp \
    $$PWD/tools/robotconfigjsonparser.h \
    $$PWD/../grabcommon.h

SOURCES += \
    $$PWD/src/cdpr_types.cpp \
    $$PWD/src/kinematics.cpp \
    $$PWD/src/diffkinematics.cpp \
    $$PWD/src/diff2kinematics.cpp \
    $$PWD/src/statics.cpp \
    $$PWD/src/dynamics.cpp \
    $$PWD/src/under_actuated_utils.cpp \
    $$PWD/tools/robotconfigjsonparser.cpp \
    $$PWD/../grabcommon.cpp

INCLUDEPATH += \
    $$PWD/inc \
    $$PWD/tools \
    $$PWD/..

QT       -= gui

CONFIG   += staticlib c++11
CONFIG   -= app_bundle

TEMPLATE = lib

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# Lib numeric
unix:!macx: LIBS += -L$$PWD/../libnumeric/lib/ -lnumeric
INCLUDEPATH += $$PWD/../libnumeric $$PWD/../libnumeric/inc
DEPENDPATH += $$PWD/../libnumeric
unix:!macx: PRE_TARGETDEPS += $$PWD/../libnumeric/lib/libnumeric.a

# Lib geometric
unix:!macx: LIBS += -L$$PWD/../libgeom/lib/ -lgeom
INCLUDEPATH += $$PWD/../libgeom $$PWD/../libgeom/inc
DEPENDPATH += $$PWD/../libgeom
unix:!macx: PRE_TARGETDEPS += $$PWD/../libgeom/lib/libgeom.a

# Armadillo lib
DEFINES += ARMA_DONT_PRINT_ERRORS
LIBS += -llapack -lblas -larmadillo
