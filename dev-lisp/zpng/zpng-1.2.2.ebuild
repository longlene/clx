# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A Common Lisp library for creating PNG files."
HOMEPAGE="http://www.xach.com/lisp/zpng/"
SRC_URI="http://github.com/xach/zpng/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="dev-lisp/salza2"

