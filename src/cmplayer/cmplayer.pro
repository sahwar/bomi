macx {
        QMAKE_CXXFLAGS_X86_64 -= -arch x86_64 -Xarch_x86_64
        QMAKE_CXXFLAGS_X86_64 += -m64
        QMAKE_CXX = /opt/local/bin/g++-mp-4.7
        #QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.5
        #QMAKE_MAC_SDK = /Developer/SDKs/MacOSX10.6.sdk
        QMAKE_INFO_PLIST = Info.plist
        ICON = ../../icons/cmplayer.icns
        TARGET = CMPlayer
        LIBS += -framework Cocoa -framework IOKit -framework AudioUnit -framework CoreAudio -lsigar-universal64-macosx
        HEADERS += app_mac.hpp
        OBJECTIVE_SOURCES += app_mac.mm
        INCLUDEPATH += /opt/local/include /usr/local/include
} else:unix {
        TARGET = cmplayer
        LIBS += -lX11
        HEADERS += app_x11.hpp
        SOURCES += app_x11.cpp
}

INCLUDEPATH += ../mplayer2

LIBS +=  -lpthread -lm -framework OpenAL -framework OpenGL -framework Cocoa \
    -L../mplayer2 -lmplayer2-cmplayer \
    -L/opt/local/lib -ldvdread -lmad -lvorbis -logg -lfaad -ldv -ldvdnav -lxvidcore -lvorbis -logg -ltheora -la52 -ldca -lavutil -lavcodec -lavformat -lswscale -lcdio_paranoia -lcdio_cdda -lcdio


QMAKE_CC = "gcc -std=c99 -ffast-math"


QMAKE_CXXFLAGS += -std=c++11

DESTDIR = ../../bin

!isEmpty(RELEASE) {
        CONFIG += release
        macx:CONFIG += app_bundle
} else {
        CONFIG += debug
        macx:CONFIG -= app_bundle
}

#!isEmpty(VLC_INCLUDE_PATH):INCLUDEPATH += $${VLC_INCLUDE_PATH}
#!isEmpty(VLC_LIB_PATH):LIBS += -L$${VLC_LIB_PATH}

TEMPLATE = app
CONFIG += link_pkgconfig debug_and_release

QT = core gui opengl network

INCLUDEPATH += ../libchardet-1.0.1/src

LIBS += -L../libchardet-1.0.1/src/.libs -lchardet

RESOURCES += rsclist.qrc
HEADERS += playengine.hpp \
    mainwindow.hpp \
    mrl.hpp \
    controlwidget.hpp \
    global.hpp \
    menu.hpp \
    squeezedlabel.hpp \
    colorproperty.hpp \
    qtsingleapplication/qtsingleapplication.h \
    qtsingleapplication/qtlockedfile.h \
    qtsingleapplication/qtlocalpeer.h \
    qtsingleapplication/qtsinglecoreapplication.h \
    translator.hpp \
    pref.hpp \
    videoframe.hpp \
    osdrenderer.hpp \
    subtitle.hpp \
    richstring.hpp \
    subtitle_parser.hpp \
    subtitlerenderer.hpp \
    textosdrenderer.hpp \
    timelineosdrenderer.hpp \
    audiocontroller.hpp \
    info.hpp \
    charsetdetector.hpp \
    abrepeater.hpp \
    playlist.hpp \
    playlistmodel.hpp \
    playlistview.hpp \
    recentinfo.hpp \
    historyview.hpp \
    subtitleview.hpp \
    pref_dialog.hpp \
    osdstyle.hpp \
    simplelistwidget.hpp \
    appstate.hpp \
    dialogs.hpp \
    favoritesview.hpp \
    downloader.hpp \
    logodrawer.hpp \
    framebufferobjectoverlay.hpp \
    pixelbufferoverlay.hpp \
    pixmapoverlay.hpp \
    overlay.hpp \
    videorenderer.hpp \
    avmisc.hpp \
    subtitlemodel.hpp \
    tagiterator.hpp \
    subtitle_parser_p.hpp \
    enums.hpp \
    snapshotdialog.hpp \
    events.hpp \
    listmodel.hpp \
    fragmentprogram.hpp \
    mainwindow_p.hpp \
    pref_widget.hpp \
    playinfoview.hpp \
    widgets.hpp \
    qtcolorpicker.hpp \
    richtext.hpp \
    record.hpp \
    actiongroup.hpp \
    rootmenu.hpp \
    app.hpp \
    videooutput.hpp \
    mpcore.hpp \
    prefdialog.hpp \
    richtexthelper.hpp \
    richtextblock.hpp \
    richtextdocument.hpp \
    mpmessage.hpp

SOURCES += main.cpp \
    playengine.cpp \
    mainwindow.cpp \
    mrl.cpp \
    controlwidget.cpp \
    global.cpp \
    menu.cpp \
    colorproperty.cpp \
    qtsingleapplication/qtsingleapplication.cpp \
    qtsingleapplication/qtlockedfile_win.cpp \
    qtsingleapplication/qtlockedfile_unix.cpp \
    qtsingleapplication/qtlockedfile.cpp \
    qtsingleapplication/qtlocalpeer.cpp \
    qtsingleapplication/qtsinglecoreapplication.cpp \
    translator.cpp \
    pref.cpp \
    videoframe.cpp \
    osdrenderer.cpp \
    subtitle.cpp \
    richstring.cpp \
    subtitle_parser.cpp \
    subtitlerenderer.cpp \
    textosdrenderer.cpp \
    timelineosdrenderer.cpp \
    audiocontroller.cpp \
    info.cpp \
    charsetdetector.cpp \
    abrepeater.cpp \
    playlist.cpp \
    playlistmodel.cpp \
    playlistview.cpp \
    recentinfo.cpp \
    historyview.cpp \
    subtitleview.cpp \
    pref_dialog.cpp \
    osdstyle.cpp \
    simplelistwidget.cpp \
    appstate.cpp \
    dialogs.cpp \
    favoritesview.cpp \
    downloader.cpp \
    logodrawer.cpp \
    framebufferobjectoverlay.cpp \
    pixelbufferoverlay.cpp \
    pixmapoverlay.cpp \
    overlay.cpp \
    videorenderer.cpp \
    subtitlemodel.cpp \
    tagiterator.cpp \
    subtitle_parser_p.cpp \
    enums.cpp \
    snapshotdialog.cpp \
    events.cpp \
    listmodel.cpp \
    fragmentprogram.cpp \
    pref_widget.cpp \
    playinfoview.cpp \
    widgets.cpp \
    qtcolorpicker.cpp \
    richtext.cpp \
    record.cpp \
    actiongroup.cpp \
    rootmenu.cpp \
    app.cpp \
    mplayer-main.c \
    videooutput.cpp \
    prefdialog.cpp \
    richtexthelper.cpp \
    richtextblock.cpp \
    richtextdocument.cpp \
    mpmessage.cpp

TRANSLATIONS += translations/cmplayer_ko.ts \
    translations/cmplayer_en.ts \
    translations/cmplayer_ja.ts
FORMS += \
    ui/aboutdialog.ui \
    ui/opendvddialog.ui \
    ui/snapshotdialog.ui \
    ui/prefdialog.ui

