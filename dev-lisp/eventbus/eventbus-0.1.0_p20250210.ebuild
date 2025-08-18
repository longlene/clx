# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="efa97ea5137987efcc42475720325ac70dc6c584"

DESCRIPTION="An event bus in Common Lisp"
HOMEPAGE="https://github.com/Junker/eventbus"
SRC_URI="https://github.com/Junker/eventbus/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd test
}
