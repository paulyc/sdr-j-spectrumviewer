######################################################################
# Automatically generated by qmake (2.01a) Tue Oct 6 19:48:14 2009
# but modified by me to accomodate for the includes for qwt, hamlib and
# portaudio
######################################################################

TEMPLATE	= app
TARGET		= spectrumviewer
QT		+= widgets
QMAKE_CFLAGS    +=  -O3 -ffast-math
QMAKE_CXXFLAGS  +=  -O3 -ffast-math
#QMAKE_CFLAGS   +=  -g
#QMAKE_CXXFLAGS +=  -g
#QMAKE_LFLAGS   +=  -g
QMAKE_CXXFLAGS += -isystem $$[QT_INSTALL_HEADERS]
RC_ICONS        =  viewer.ico
RESOURCES       += resources.qrc

TRANSLATIONS = i18n/de_DE.ts i18n/it_IT.ts i18n/hu_HU.ts

DEPENDPATH += . \
	      ./src \
	      ./devices

INCLUDEPATH += . \
	      ./src \
	      ./devices

# Input
HEADERS += ./viewer.h \
           ./src/fft.h \
           ./src/ringbuffer.h \
	   ./src/spectrogramdata.h \
	   ./src/spectrum-scope.h  \
	   ./src/waterfall-scope.h  \
	   ./src/mapper.h \
	   ./src/fir-filters.h \
	   ./devices/device-handler.h

FORMS += ./sdrgui.ui 

SOURCES += ./main.cpp \
           ./viewer.cpp \
	   ./src/mapper.cpp \
           ./src/fft.cpp \
	   ./src/spectrum-scope.cpp \
	   ./src/waterfall-scope.cpp \
	   ./src/fir-filters.cpp \
	   ./devices/device-handler.cpp 

#for Fedora and Ubuntu use
unix { 
CONFIG		+= console 
DESTDIR		= ./linux-bin
exists ("./.git") {
   GITHASHSTRING = $$system(git rev-parse --short HEAD)
   !isEmpty(GITHASHSTRING) {
       message("Current git hash = $$GITHASHSTRING")
       DEFINES += GITHASH=\\\"$$GITHASHSTRING\\\"
   }
}
isEmpty(GITHASHSTRING) {
    DEFINES += GITHASH=\\\"------\\\"
}

INCLUDEPATH	+= /usr/include/qt5/qwt
INCLUDEPATH	+= /usr/local/include
#LIBS		+= -lqwt -lusb-1.0 -lrt -lfftw3f -ldl		# ubuntu 15.04
LIBS		+= -lqwt-qt5 -lusb-1.0 -lrt -lfftw3f -ldl	# fedora 25
LIBS            += -lsndfile
LIBS            += -lsamplerate
CONFIG		+= dabstick
CONFIG		+= airspy
CONFIG		+= sdrplay
#CONFIG		+= elad-s1
#CONFIG		+= soundcard
CONFIG		+= hackrf
}

## and for windows32 we use:
win32 {
CONFIG		-= console 
DESTDIR		= ../../windows-spectrumviewer

exists ("./.git") {
   GITHASHSTRING = $$system(git rev-parse --short HEAD)
   !isEmpty(GITHASHSTRING) {
       message("Current git hash = $$GITHASHSTRING")
       DEFINES += GITHASH=\\\"$$GITHASHSTRING\\\"
   }
}

isEmpty(GITHASHSTRING) {
    DEFINES += GITHASH=\\\"------\\\"
}

# includes in mingw differ from the includes in fedora linux
INCLUDEPATH 	+= /usr/i686-w64-mingw32/sys-root/mingw/include
INCLUDEPATH 	+= /usr/i686-w64-mingw32/sys-root/mingw/include/qt5/qwt
LIBS		+= -lfftw3f
LIBS		+= -lportaudio		# for the cardreader
LIBS		+= -lqwt-qt5
#LIBS		+= -lsndfile
LIBS		+= -lsamplerate
LIBS		+= -lole32
LIBS		+= -lwinmm
LIBS 		+= -lstdc++
LIBS		+= -lusb-1.0
LIBS		+= -lpthread
CONFIG		+= dabstick
CONFIG		+= airspy
CONFIG		+= sdrplay
#CONFIG		+= soundcard
CONFIG		+= hackrf
#CONFIG		+= extio
}
#
#	the devices
dabstick {
	DEFINES		+= HAVE_RTLSDR
	INCLUDEPATH	+= ./devices/rtlsdr-handler
	HEADERS		+= ./devices/rtlsdr-handler/rtlsdr-handler.h \
	                   ./devices/rtlsdr-handler/dongleselect.h
	SOURCES		+= ./devices/rtlsdr-handler/rtlsdr-handler.cpp \
	                   ./devices/rtlsdr-handler/dongleselect.cpp
	FORMS		+= ./devices/rtlsdr-handler/dabstick-widget.ui
}
#
#	the SDRplay
#
sdrplay {
DEFINES		+= HAVE_SDRPLAY
	INCLUDEPATH	+= ./devices/sdrplay-handler
	HEADERS		+= ./devices/sdrplay-handler/sdrplay-handler.h \
	                   ./devices/sdrplay-handler/sdrplayselect.h
	SOURCES		+= ./devices/sdrplay-handler/sdrplay-handler.cpp \
	                   ./devices/sdrplay-handler/sdrplayselect.cpp
	FORMS		+= ./devices/sdrplay-handler/sdrplay-widget.ui
}
#
airspy {
	DEFINES		+= HAVE_AIRSPY
	INCLUDEPATH	+= ./devices/airspy-handler \
	                   ./devices/airspy-handler/libairspy
	HEADERS		+= ./devices/airspy-handler/airspy-handler.h 
	SOURCES		+= ./devices/airspy-handler/airspy-handler.cpp 
	FORMS		+= ./devices/airspy-handler/airspy-widget.ui
}
#
#	extio dependencies, windows only
#
extio {
	DEFINES		+= HAVE_EXTIO
	INCLUDEPATH	+= ./devices/extio-handler
	HEADERS		+= ./devices/extio-handler/extio-handler.h \
	                   ./devices/extio-handler/common-readers.h \
	                   ./devices/extio-handler/virtual-reader.h \
	                   ./devices/extio-handler/card-reader.h
	SOURCES		+= ./devices/extio-handler/extio-handler.cpp \
	                   ./devices/extio-handler/common-readers.cpp \
	                   ./devices/extio-handler/virtual-reader.cpp \
	                   ./devices/extio-handler/card-reader.cpp
	FORMS		+= ./devices/extio-handler/extio-widget.ui
}

rtl_tcp {
	DEFINES		+= HAVE_RTL_TCP
	QT		+= network
	INCLUDEPATH	+= ./devices/rtl_tcp
	HEADERS		+= ./devices/rtl_tcp/rtl_tcp_client.h
	SOURCES		+= ./devices/rtl_tcp/rtl_tcp_client.cpp
	FORMS		+= ./devices/rtl_tcp/rtl_tcp-widget.ui
}

elad-s1 {
	DEFINES		+= HAVE_ELAD_S1
	INCLUDEPATH	+= ./devices/sw-elad-s1
	HEADERS		+= ./devices/sw-elad-s1/elad-s1.h \
	                   ./devices/sw-elad-s1/elad-worker.h \
	                   ./devices/sw-elad-s1/elad-loader.h
	SOURCES		+= ./devices/sw-elad-s1/elad-s1.cpp \
	                   ./devices/sw-elad-s1/elad-worker.cpp \
	                   ./devices/sw-elad-s1/elad-loader.cpp
	FORMS		+= ./devices/sw-elad-s1/elad-widget.ui
}

soundcard {
	DEFINES		+= HAVE_SOUNDCARD
	INCLUDEPATH	+= ./devices/soundcard
	HEADERS		+= ./devices/soundcard/pa-reader.h \
	                   ./devices/soundcard/soundcard.h
	SOURCES		+= ./devices/soundcard/pa-reader.cpp \
	                   ./devices/soundcard/soundcard.cpp
	FORMS		+= ./devices/soundcard/soundcard-widget.ui
	LIBS		+= -lportaudio
}

#
#       the HACKRF One
#
hackrf {
        DEFINES         += HAVE_HACKRF
        DEPENDPATH      += ./devices/hackrf-handler
        INCLUDEPATH     += ./devices/hackrf-handler
        HEADERS         += ./devices/hackrf-handler/hackrf-handler.h
        SOURCES         += ./devices/hackrf-handler/hackrf-handler.cpp
        FORMS           += ./devices/hackrf-handler/hackrf-widget.ui
}

