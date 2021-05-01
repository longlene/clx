# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="59cce5c20043a07ac0aaf96fca28a78c7cd4e870"

DESCRIPTION="Rectangle packer for sprite/texture atlases"
HOMEPAGE="https://github.com/lispgames/binpack"
SRC_URI="https://github.com/lispgames/binpack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""
