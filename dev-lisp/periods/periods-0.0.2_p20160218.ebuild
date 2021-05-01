# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3e56c2a5faec09f82b3a05806f5ef1f1a3ab746d"

DESCRIPTION="Common Lisp library for manipulating date/time objects at a higher level"
HOMEPAGE="https://github.com/jwiegley/periods"
SRC_URI="https://github.com/jwiegley/periods/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/local-time
	dev-lisp/series
"
