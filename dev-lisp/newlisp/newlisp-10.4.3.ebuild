# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Gentoo Development Guide http://devmanual.gentoo.org/ebuild-writing/index.html
# Ebuild: created by Turketi Sergei - newlisper@gmail.com
#
# EXAMPLE:
#
# If you want the possibility of libffi (USE="libffi"), then:
# 
#   user$ find /usr/ -name ffi.h
#     /usr/lib64/libffi-3.0.10/include/ffi.h
#
# If you have a flag USE = "x86" then:
#
#   root# mkdir /usr/include/i386-linux-gnu/
#   root# ln -s /usr/lib/libffi-3.0.10/include/ffi.h /usr/include/i386-linux-gnu/
#
# If you have a flag USE = "amd64" then:
#
#   root# mkdir /usr/include/x86_64-linux-gnu/
#   root# ln -s /usr/lib/libffi-3.0.10/include/ffi.h /usr/include/x86_64-linux-gnu/
#
# To all:
#   user$ find /usr/ -name ffitarget.h
#     /usr/lib64/libffi-3.0.10/include/ffitarget.h
#   root# ln -s /usr/lib64/libffi-3.0.10/include/ffitarget.h /usr/include/
#

EAPI="4"
DESCRIPTION="newLISP - a new generation of Lisp!"
HOMEPAGE="http://www.newlisp.org/"
SRC_URI="http://www.newlisp.org/downloads/${P}.tgz"
LICENSE="GPL-3"
IUSE="libffi unicode"
SLOT="0"
KEYWORDS="x86 amd64"
RDEPEND="sys-libs/readline
libffi? ( dev-libs/libffi )"
DEPEND="${RDEPEND}"

src_configure ()
{
	return
}

src_compile ()
{ 
	if use libffi && use x86 && use unicode ; then
		make -f ${S}/makefile_linux_utf8_ffi
	elif use libffi && use amd64 && use unicode ; then
		make -f ${S}/makefile_linuxLP64_utf8_ffi
	elif ! use libffi && use x86 && use unicode ; then
		make -f ${S}/makefile_linux_utf8
	elif ! use libffi && use amd64 && use unicode ; then
		make -f ${S}/makefile_linuxLP64_utf8
	elif use libffi && use x86 && ! use unicode ; then
		make -f ${S}/makefile_linux_ffi
	elif use libffi && use amd64 && ! use unicode ; then
		make -f ${S}/makefile_linuxLP64_ffi
	elif ! use libffi && use x86 && ! use unicode ; then
		make -f ${S}/makefile_linux
	elif ! use libffi && use amd64 && ! use unicode ; then
		make -f ${S}/makefile_linuxLP64
	else
		./configure-alt --prefix="/usr"
	fi
}

src_install() 
{
	sudo make install
}
