# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7cc09bee7d68527f37406671fabe910e8235b746"

DESCRIPTION="Simple, dynamic class combination for CLOS"
HOMEPAGE="https://github.com/rpav/dynamic-mixins"
SRC_URI="https://github.com/rpav/dynamic-mixins/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/closer-mop
"
BDEPEND=""
