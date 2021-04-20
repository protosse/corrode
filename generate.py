#!/usr/bin/python
# -*- coding: UTF-8 -*-
import sys
import os


def main():
    try:
        if len(sys.argv) > 1:
            param = sys.argv[1]
            if param == "moudle":
                moudle()
    except Exception as result:
        print("error：%s" % result)


def moudle():
    if len(sys.argv) > 2:
        name = sys.argv[2]
        path = "lib/modules/" + name
        os.mkdir(path)
        os.open(path+"/" + name + "_binding.dart", os.O_CREAT)
        os.open(path+"/" + name + "_controller.dart", os.O_CREAT)
        os.open(path+"/" + name + "_page.dart", os.O_CREAT)
    else:
        raise Exception("param error")


if __name__ == "__main__":
    main()
