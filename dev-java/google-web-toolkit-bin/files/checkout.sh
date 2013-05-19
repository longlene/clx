#!/bin/bash

PV="1.3.3"
SVN_URL="http://google-web-toolkit.googlecode.com/svn"

rm -rf gwt tools
svn checkout "${SVN_URL}/tags/${PV}/" gwt && tar -cjf "gwt-${PV}.tar.bz2" gwt
svn checkout "${SVN_URL}/tools/" tools && tar -cjf "gwt-tools.tar.bz2" tools
