#!/bin/sh
ps aux|grep chromium|awk '{print $2}'|xargs kill -9