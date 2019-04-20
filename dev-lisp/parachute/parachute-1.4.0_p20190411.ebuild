# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="558c8ed63bc0eec55400fa2ca5af5ab549f0285b"

DESCRIPTION="An extensible and cross-compatible testing framework"
HOMEPAGE="https://github.com/Shinmera/parachute"
SRC_URI="https://github.com/Shinmera/parachute/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/form-fiddle
"
BDEPEND=""
