# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5556ccf1aa1655980baa06c26a48aa1e2c83e152"

DESCRIPTION="Portability library for IEEE float features"
HOMEPAGE="https://github.com/Shinmera/float-features"
SRC_URI="https://github.com/Shinmera/float-features/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documenttion-utils
"
BDEPEND=""
