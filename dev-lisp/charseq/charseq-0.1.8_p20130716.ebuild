# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="daad0e44835496f7f0679ceab854c6c59dcd2f88"

DESCRIPTION="simple-array character typed string"
HOMEPAGE="https://github.com/sile/charseq"
SRC_URI="https://github.com/sile/charseq/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
