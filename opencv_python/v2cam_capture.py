#!/usr/bin/env python2
## This script use cv2 interface to preview live camera feed (only one camera)
## with trackbars for adjust camera control value

import cv2
import cv2.cv as cv

max_tb_scale = 100
capture = 0


def onGainTB(val):
    fval = float(val) / max_tb_scale
    if not capture.set(cv.CV_CAP_PROP_GAIN, fval):
        pass
    print "CV_CAP_PROP_GAIN ", capture.get(cv.CV_CAP_PROP_GAIN)


def onHueTB(val):
    fval = float(val) / max_tb_scale
    if not capture.set(cv.CV_CAP_PROP_HUE, fval):
        pass
    print "CV_CAP_PROP_HUE ", capture.get(cv.CV_CAP_PROP_HUE)


def onSaturationTB(val):
    fval = float(val) / max_tb_scale
    if not capture.set(cv.CV_CAP_PROP_SATURATION, fval):
        pass
    print "CV_CAP_PROP_SATURATION ", capture.get(cv.CV_CAP_PROP_SATURATION)


def onBrightnessTB(val):
    fval = float(val) / max_tb_scale
    if not capture.set(cv.CV_CAP_PROP_BRIGHTNESS, fval):
        pass
    print "CV_CAP_PROP_BRIGHTNESS ", capture.get(cv.CV_CAP_PROP_BRIGHTNESS)


def onContrastTB(val):
    fval = float(val) / max_tb_scale
    if not capture.set(cv.CV_CAP_PROP_CONTRAST, fval):
        pass
    print "CV_CAP_PROP_CONTRAST ", capture.get(cv.CV_CAP_PROP_CONTRAST)


def main():
    global capture
    cam_number = 0

    capture = cv2.VideoCapture()
    if capture:
        print "video capture device connected"
    else:
        print "Error: can't connect to any camera"
        quit()

    if capture.open(cam_number):
        print "camera opened"
        print "CV_CAP_PROP_FRAME_WIDTH ", capture.get(cv.CV_CAP_PROP_FRAME_WIDTH)
        print "CV_CAP_PROP_FRAME_HEIGHT", capture.get(cv.CV_CAP_PROP_FRAME_HEIGHT)
        print "CV_CAP_PROP_BRIGHTNESS  ", capture.get(cv.CV_CAP_PROP_BRIGHTNESS)
        print "CV_CAP_PROP_CONTRAST    ", capture.get(cv.CV_CAP_PROP_CONTRAST)
        print "CV_CAP_PROP_SATURATION  ", capture.get(cv.CV_CAP_PROP_SATURATION)
        print "CV_CAP_PROP_HUE         ", capture.get(cv.CV_CAP_PROP_HUE)
        print "CV_CAP_PROP_GAIN        ", capture.get(cv.CV_CAP_PROP_GAIN)
        # for i in range(0,20):
        #     print i, capture.get(i)

    cv2.namedWindow("preview", flags=cv2.CV_WINDOW_AUTOSIZE)
    cv.CreateTrackbar("brightness", "preview", int(capture.get(cv.CV_CAP_PROP_BRIGHTNESS) * max_tb_scale), max_tb_scale, onBrightnessTB)
    cv.CreateTrackbar("contrast", "preview", int(capture.get(cv.CV_CAP_PROP_CONTRAST) * max_tb_scale), max_tb_scale, onContrastTB)
    cv.CreateTrackbar("stauration", "preview", int(capture.get(cv.CV_CAP_PROP_SATURATION) * max_tb_scale), max_tb_scale, onSaturationTB)
    cv.CreateTrackbar("hue", "preview", int(capture.get(cv.CV_CAP_PROP_HUE) * max_tb_scale), max_tb_scale, onHueTB)
    cv.CreateTrackbar("gain", "preview", int(capture.get(cv.CV_CAP_PROP_GAIN) * max_tb_scale), max_tb_scale, onGainTB)

    key = -1
    retval = False
    frame = []
    while capture.isOpened():
        key = cv2.waitKey(5) % 256
        if key == 27:
            cv2.destroyAllWindows()
            capture.release()
            quit()

        retval, frame = capture.read()
        if retval:
            cv2.imshow("preview", frame)

if __name__ == '__main__':
    main()
