# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0debf43861662584e8fee1f0d165486a4a6d7030"

DESCRIPTION="Map a binary tree to a list"
HOMEPAGE="https://github.com/noffle/cl-flat-tree/"
SRC_URI="https://github.com/noffle/cl-flat-tree/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
