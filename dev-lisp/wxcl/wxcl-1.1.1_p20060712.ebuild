# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="46ddd151770965df87033805c249a2df4f40a65f"

DESCRIPTION="Common Lisp bindings to wxWidgets Library"
HOMEPAGE="https://github.com/lisp-mirror/wxcl"
SRC_URI="https://github.com/lisp-mirror/wxcl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
