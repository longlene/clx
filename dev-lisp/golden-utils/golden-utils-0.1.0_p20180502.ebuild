# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="02d3754ebfef69469c8db4fbf0a00c45cfd14d9b"

DESCRIPTION="Auxiliary Utilities"
HOMEPAGE="https://github.com/mfiano/golden-utils"
SRC_URI="https://github.com/mfiano/golden-utils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/arrow-macros
	dev-lisp/split-sequence
	dev-lisp/defpackage-plus
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
