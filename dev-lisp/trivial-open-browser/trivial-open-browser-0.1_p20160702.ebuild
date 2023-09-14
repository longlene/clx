# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7ab4743dea9d592639f15c565bfa0756e828c427"

DESCRIPTION="Open a browser window"
HOMEPAGE="https://github.com/eudoxia0/trivial-open-browser"
SRC_URI="https://github.com/eudoxia0/trivial-open-browser/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
