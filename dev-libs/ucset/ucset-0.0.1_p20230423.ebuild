# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="281bc0dc39ba762eecb0ea89b66aaf628d710577"

DESCRIPTION="Unexceptionally Consistent Set"
HOMEPAGE="https://github.com/unum-cloud/ucset"
SRC_URI="https://github.com/unum-cloud/ucset/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/ucset
	einstalldocs
}
