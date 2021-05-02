# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit subversion eutils

DESCRIPTION="Libresample from Asterisk Third Party, needed for eSpeak"
HOMEPAGE="http://svnview.digium.com/svn/thirdparty/libresample/"

ESVN_REPO_URI="http://svn.digium.com/svn/thirdparty/libresample/trunk"

LICENSE="UNK"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile(){
emake DESTDIR="${D}"  || die
}

src_install(){
dolib "libresample.so"
}
