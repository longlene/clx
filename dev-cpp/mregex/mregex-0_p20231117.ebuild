# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="686d99dff771fa1686bb19737923b3ccc30e78df"

DESCRIPTION="C++ regular expressions library using template metaprogramming"
HOMEPAGE="https://github.com/iulian-rusu/mregex"
SRC_URI="https://github.com/iulian-rusu/mregex/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/mregex{,.hpp}
	einstalldocs
}
