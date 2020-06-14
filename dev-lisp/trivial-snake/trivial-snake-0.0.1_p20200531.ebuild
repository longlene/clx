# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="90f2c788129324aedd4e068dfd69b1c2410e1219"

DESCRIPTION="A trivial snake game written in Common Lisp built on top of trivial-gamekit"
HOMEPAGE="https://github.com/ryukinix/trivial-snake"
SRC_URI="https://github.com/ryukinix/trivial-snake/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-gamekit
"
BDEPEND=""
