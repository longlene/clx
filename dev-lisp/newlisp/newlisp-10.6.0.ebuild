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
IUSE="libffi unicode vim-syntax doc"
SLOT="0"
KEYWORDS="x86 amd64"
DEPEND="sys-libs/readline
libffi? ( dev-libs/libffi )"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/strip/d' makefile*
}

src_configure ()
{
	:
}

src_compile ()
{
	local mymakefile="Makefile"
	if use x86 ; then
		if use libffi && use unicode ; then
			mymakefile=makefile_linux_utf8_ffi
		elif ! use libffi && use unicode ; then
			mymakefile=makefile_linux_utf8
		elif use libffi && ! use unicode ; then
			mymakefile=makefile_linux_ffi
		elif ! use libffi && ! use unicode ; then
			mymakefile=makefile_linux
		fi
		emake -f $mymakefile
	elif use amd64 ; then
		if use libffi && use unicode ; then
			mymakefile=makefile_linuxLP64_utf8_ffi
		elif ! use libffi && use unicode ; then
			mymakefile=makefile_linuxLP64_utf8
		elif use libffi && ! use unicode ; then
			mymakefile=makefile_linuxLP64_ffi
		elif ! use libffi && ! use unicode ; then
			mymakefile=makefile_linuxLP64
		fi
		emake -f $mymakefile
	else
		./configure-alt --prefix=/usr
	fi
}

src_install() {
	dobin newlisp
	dobin util/newlispdoc
	doman doc/newlisp.1 && rm doc/newlisp.1
	use doc && dodoc -r doc
	dobin guiserver/newlisp-edit.lsp

	if use vim-syntax ; then
		insinto /usr/share/vim/vimfiles/syntax
		doins util/newlisp.vim
	fi
	rm util/newlisp.vim


	dodir /usr/share/${PN}
	insinto /usr/share/${PN}
	doins -r util
	doins -r modules
	doins -r guiserver
}

# eof
