# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="17fa8b760c0e5f9e1ce61ad25308107dcddaa30d"

DESCRIPTION="The time based task scheduler for Common Lisp"
HOMEPAGE="https://github.com/byulparan/scheduler"
SRC_URI="https://github.com/byulparan/scheduler/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/cffi
	dev-lisp/pileup
"
