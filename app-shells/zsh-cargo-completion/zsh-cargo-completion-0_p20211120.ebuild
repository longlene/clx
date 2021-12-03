# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="da01da70de98631254d4406332670c39456fa757"

DESCRIPTION="zsh cargo completion"
HOMEPAGE="https://github.com/MenkeTechnologies/zsh-cargo-completion"
SRC_URI="https://github.com/MenkeTechnologies/zsh-cargo-completion/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	app-shells/zsh
"
BDEPEND=""

src_install() {
	insinto /usr/share/zsh/site-functions
	doins src/_*
	dodoc README.md
}
