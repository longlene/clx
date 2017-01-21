# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="131f0a1be7708ef886dcaa2dd21f22ce6d67e80a"

DESCRIPTION="Foreign-Numeric-Vector"
HOMEPAGE="https://github.com/blindglobe/fnv"
SRC_URI="https://github.com/blindglobe/fnv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/iterate
	dev-lisp/trivial-garbage
"
