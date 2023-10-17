# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="69eb3bcea59ed1ccf3dd1960e6d48fb21f1dadab"

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
