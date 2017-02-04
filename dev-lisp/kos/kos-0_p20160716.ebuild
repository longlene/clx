# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="db09c9a4825b74fa281fce653a640e882d7d62b4"

DESCRIPTION="king-of-shadows"
HOMEPAGE="https://github.com/fouric/kos"
SRC_URI="https://github.com/fouric/kos/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-termbox
"
