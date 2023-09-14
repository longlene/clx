# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit common-lisp-3

DESCRIPTION="Colorized output on ANSI terminals and more"
HOMEPAGE="https://mrkkrp/github.io/cl-ansi-term/"
SRC_URI="https://github.com/mrkkrp/cl-ansi-term/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
"
