# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2b2230cb01ae1b68e28921d99e4814046867fb75"

DESCRIPTION="Build and compose SXQL queries dynamically"
HOMEPAGE="https://github.com/mmontone/sxql-composer"
SRC_URI="https://github.com/mmontone/sxql-composer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/sxql
"
BDEPEND=""
