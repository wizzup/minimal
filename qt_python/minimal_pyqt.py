#!/usr/bin/env python3
# minimal qt application that show empty window (with title)

## need sys.exit() and sys.argv
import sys

## using PyQt
from PyQt4 import QtGui


################################################################################
## the only window class derived form QWidget
################################################################################
class Window(QtGui.QWidget):
    pass

## init aka constructor of the widget
## it is a good idea to pass default parameter to base class
    def __init__(self, parent=None):
        QtGui.QWidget.__init__(self, parent)

## set title text
        self.setWindowTitle('Hello Qt')


################################################################################
## program entry-point, using python trick __name__
################################################################################
if __name__ == '__main__':
    app = QtGui.QApplication(sys.argv)
    window = Window()
    window.show()
    sys.exit(app.exec())
