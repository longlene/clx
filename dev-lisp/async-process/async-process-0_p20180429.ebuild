# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b1ad6ab3a9b86feaabafb7b16839da595375c1b6"

DESCRIPTION="async process"
HOMEPAGE="https://github.com/cxxxr/async-process"
SRC_URI="https://github.com/cxxxr/async-process/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all static
}
