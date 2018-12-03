# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="28a496444e971bf77f82dd9bf54aaef37289f0d1"

DESCRIPTION="Common lisp bindings for xkbcommon using cffi-grovel"
HOMEPAGE="https://github.com/sdilts/cl-xkbcommon"
SRC_URI="https://github.com/sdilts/cl-xkbcommon/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
BDEPEND=""
