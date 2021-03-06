# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3d1ced2f632eb9236361518998825b091ed08ee6"

DESCRIPTION="Augments Hunchentoot error pages and logs with request and session information"
HOMEPAGE="https://github.com/mmontone/hunchentoot-errors"
SRC_URI="https://github.com/mmontone/hunchentoot-errors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/string-case
	dev-lisp/parse-number
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
