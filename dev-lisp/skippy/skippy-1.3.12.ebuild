# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A graphics library that reads and writes GIF files. It is pure Common Lisp. It supports normal GIFs and animated GIFs."
HOMEPAGE="http://www.xach.com/lisp/skippy/"
SRC_URI="http://github.com/xach/skippy/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

