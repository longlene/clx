# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="701017567c3fe57171735aa59cdcb852edda1f70"

DESCRIPTION="Mathematical library for Common Lisp"
HOMEPAGE="https://github.com/martinkersner/cl-math"
SRC_URI="https://github.com/martinkersner/cl-math/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
