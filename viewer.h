/*
 *    Copyright (C)  2010, 2011, 2012
 *    Jan van Katwijk (J.vanKatwijk@gmail.com)
 *    Lazy Chair Computing
 *
 *    This file is part of the SDR-J.
 *    Many of the ideas as implemented in SDR-J are derived from
 *    other work, made available through the GNU general Public License. 
 *    All copyrights of the original authors are recognized.
 *
 *    SDR-J is free software; you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation; either version 2 of the License, or
 *    (at your option) any later version.
 *
 *    SDR-J is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with SDR-J; if not, write to the Free Software
 *    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef __SPECTRUM_VIEWER__
#define __SPECTRUM_VIEWER__

#include	<QDialog>
#include	"ui_sdrgui.h"
#include	<qwt.h>
#include	<qwt_slider.h>
#include	<qwt_plot.h>
#include	<qwt_plot_curve.h>
#include	<qwt_plot_marker.h>
#include	<qwt_plot_grid.h>
#include	<qwt_dial.h>
#include	<qwt_plot_spectrogram.h>
#include	<QTimer>
#include	<QWheelEvent>
#include	"waterfall-scope.h"
#include	"spectrum-scope.h"
#include	"mapper.h"
#include	"fir-filters.h"
#include	<atomic>
#include	<complex>
#include <QCloseEvent>
//
#include	<QObject>

class	QSettings;
class	deviceHandler;
/*
 *	The main gui object. It inherits from
 *	QDialog and the generated form
 */
class Viewer: public QDialog,
		      private Ui_SDRplayViewer {
Q_OBJECT
public:
		Viewer	(QSettings *, QWidget *parent = NULL);
		~Viewer	(void);

private:
	QSettings	*spectrumSettings;
	spectrumScope	*HFScope_1;
	waterfallScope	*HFScope_2;
	spectrumScope	*IFScope;
	float		*Window;
	int32_t		inputRate;
	int32_t		bandWidth;
	int32_t		displaySize;
	int16_t		displayRate;
	int16_t		rasterSize;
	int32_t		spectrumSize;
	std::atomic<bool>	running;
	deviceHandler	*theDevice;
	int64_t		currentFrequency;
	int16_t		scanDelayTime;
	void		ClearPanel		(void);
	void		AddtoPanel		(int16_t);
	int		getPanel		(void);
	void		CorrectPanel		(void);
	freqmapper	*theMapper;
	decimatingFIR	*theFilter;
	void		setTuner		(uint64_t);
	void		setnextFrequency	(uint64_t);
	QTimer		*lcd_timer;
	QTimer		*scanTimer;
	QTimer		*displayTimer;
	QTimer		*runTimer;
	int		Panel;
	uint8_t		runMode;
	bool		freezer;
	bool		scanner;
	int32_t		freezeCount;
	void		doFreeze		(double *, double *, int32_t);
	void		IncrementFrequency	(int32_t);
/*
 */
private slots:
	deviceHandler	*setDevice		(void);
	void	stop_lcdTimer		(void);
	void	setStart		(void);
	void	setStop			(void);
	void	lcd_timeout		(void);
	void	updateTimeDisplay	(void);
	void	clickPause		(void);
	void	adjustFrequency		(int);
	void	addOne			(void);
	void	addTwo			(void);
	void	addThree		(void);
	void	addFour			(void);
	void	addFive			(void);
	void	addSix			(void);
	void	addSeven		(void);
	void	addEight		(void);
	void	addNine			(void);
	void	addZero			(void);
	void	addClear		(void);
	void	AcceptFreqinKhz		(void);
	void	AcceptFreqinMhz		(void);
	void	addCorr			(void);

	void	TerminateProcess	(void);
	void	toggle_Freezer		(void);
	void	nextFrequency		(void);
	void	switchScanner		(void);

	void	Display			(uint64_t);
	void	Display			(uint64_t, bool);
public slots:
	void	handleSamples		(void);
	void	set_changeRate		(int);
	void	decimationHandler	(QString);
	void	closeEvent		(QCloseEvent *event);
        void    wheelEvent              (QWheelEvent *);
};

#endif

