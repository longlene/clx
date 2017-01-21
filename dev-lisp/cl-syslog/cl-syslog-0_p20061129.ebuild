# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f62d524874616383650e30f7f23320005fd310c1"

DESCRIPTION="Common Lisp syslog interface"
HOMEPAGE="https://github.com/lhope/cl-syslog"
SRC_URI="https://github.com/lhope/cl-syslog/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
