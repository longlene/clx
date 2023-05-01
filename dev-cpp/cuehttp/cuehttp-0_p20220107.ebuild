# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="3aa24c3f5d5c9fa7acc2b2b6121248148018d247"

DESCRIPTION="A modern c++ middleware framework"
HOMEPAGE="https://github.com/xcyl/cuehttp"
SRC_URI="https://github.com/xcyl/cuehttp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/boost
"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins include/cuehttp{,.hpp}
	einstalldocs
}
