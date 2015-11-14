######################################################################
# Automatically generated by qmake (2.01a) Tue Oct 6 19:48:14 2009
# but modified by me to accomodate for the includes for qwt, hamlib and
# portaudio
######################################################################

TEMPLATE	= app
TARGET		= sdr-j-spectrumviewer
QT		+= widgets
CONFIG		+= console widgets

DEPENDPATH += . \
	      ./src \
	      ./includes \
	      ./input

INCLUDEPATH += . \
	      ./includes \
	      ./input

# Input
HEADERS += ./includes/gui.h \
	   ./includes/spectrum-constants.h \
           ./includes/fft.h \
           ./includes/ringbuffer.h \
	   ./includes/spectrogramdata.h \
	   ./includes/scope.h  \
	   ./input/virtual-input.h

FORMS += ./sdrgui.ui 

SOURCES += ./src/main.cpp \
           ./src/gui.cpp \
           ./src/fft.cpp \
	   ./src/scope.cpp \
	   ./input/virtual-input.cpp 

#for Fedora and Ubuntu use
unix { 
DESTDIR		= ./linux-bin
INCLUDEPATH	+= /usr/include/qwt
INCLUDEPATH 	+= /usr/include/ 
INCLUDEPATH	+= /usr/local/include
#LIBS		+= -lqwt -lusb-1.0 -lrt -lfftw3f -ldl		# ubuntu 15.04
LIBS		+= -lqwt-qt5 -lusb-1.0 -lrt -lfftw3f -ldl	# fedora 21
CONFIG		+= dabstick
CONFIG		+= airspy
CONFIG		+= sdrplay
}

## and for windows32 we use:
win32 {
DESTDIR	= ./windows-bin-dab
# includes in mingw differ from the includes in fedora linux
INCLUDEPATH 	+= /usr/i686-w64-mingw32/sys-root/mingw/include
INCLUDEPATH 	+= /usr/i686-w64-mingw32/sys-root/mingw/include/qt5/qwt
LIBS	+= -lfftw3f
LIBS	+= -lportaudio
LIBS	+= -lqwt-qt5
LIBS	+= -lsndfile
LIBS	+= -lsamplerate
LIBS	+= -lole32
LIBS	+= -lwinmm
LIBS 	+= -lstdc++
LIBS	+= -lusb-1.0
LIBS	+= -lpthread
CONFIG		+= dabstick
CONFIG		+= airspy
CONFIG		+= sdrplay
}
#
#	the devices
dabstick {
	DEFINES		+= HAVE_DABSTICK
	INCLUDEPATH	+= ./input/dabstick
	HEADERS		+= ./input/dabstick/dabstick.h \
	                   ./input/dabstick/dongleselect.h
	SOURCES		+= ./input/dabstick/dabstick.cpp \
	                   ./input/dabstick/dongleselect.cpp
	FORMS		+= ./input/dabstick/dabstick-widget.ui
}
#
#	the SDRplay
#
sdrplay {
	DEFINES		+= HAVE_SDRPLAY
	INCLUDEPATH	+= ./input/sdrplay
	HEADERS		+= ./input/sdrplay/sdrplay.h \
	                   ./input/sdrplay/sdrplay-loader.h \
	                   ./input/sdrplay/sdrplay-worker.h 
	SOURCES		+= ./input/sdrplay/sdrplay.cpp \
	                   ./input/sdrplay/sdrplay-loader.cpp \
	                   ./input/sdrplay/sdrplay-worker.cpp 
	FORMS		+= ./input/sdrplay/sdrplay-widget.ui
	DEFINES		+= SDRPLAY_LIBRARY_NEW
}
#
#
airspy {
	DEFINES		+= HAVE_AIRSPY
	INCLUDEPATH	+= ./input/airspy \
	                   /usr/local/include/libairspy
	HEADERS		+= ./input/airspy/airspy-handler.h 
	SOURCES		+= ./input/airspy/airspy-handler.cpp 
	FORMS		+= ./input/airspy/airspy-widget.ui
}
#
#	extio dependencies, windows only
#
extio {
	DEFINES		+= HAVE_EXTIO
	INCLUDEPATH	+= ./input/extio-handler
	HEADERS		+= ./input/extio-handler/extio-handler.h \
	                   ./input/extio-handler/common-readers.h \
	                   ./input/extio-handler/virtual-reader.h
	SOURCES		+= ./input/extio-handler/extio-handler.cpp \
	                   ./input/extio-handler/common-readers.cpp \
	                   ./input/extio-handler/virtual-reader.cpp
}

rtl_tcp {
	DEFINES		+= HAVE_RTL_TCP
	QT		+= network
	INCLUDEPATH	+= ./input/rtl_tcp
	HEADERS		+= ./input/rtl_tcp/rtl_tcp_client.h
	SOURCES		+= ./input/rtl_tcp/rtl_tcp_client.cpp
	FORMS		+= ./input/rtl_tcp/rtl_tcp-widget.ui
}

