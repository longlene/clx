# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="511b8a0b218e2241de38a17267ff2ea7dbabd6a9"

DESCRIPTION="persistent vector implementation for common lisp"
HOMEPAGE="https://github.com/DanielKeogh/persistent-vector"
SRC_URI="https://github.com/DanielKeogh/persistent-vector/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="EPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-tests.asd tests
}
