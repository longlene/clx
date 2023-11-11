# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="134734f8a8e00f3a1d7fce49e88f8529a68d9a39"

DESCRIPTION="System dependency listing and archiving tool for Common Lisp"
HOMEPAGE="https://github.com/varjagg/deptree"
SRC_URI="https://github.com/varjagg/deptree/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
