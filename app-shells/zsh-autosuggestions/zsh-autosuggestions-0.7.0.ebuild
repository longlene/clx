# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit readme.gentoo-r1

DESCRIPTION="Fish-like autosuggestions for zsh"
HOMEPAGE="https://github.com/zsh-users/zsh-autosuggestions"
SRC_URI="https://github.com/zsh-users/zsh-autosuggestions/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-shells/zsh"
RDEPEND="${DEPEND}"

DISABLE_AUTOFORMATTING="true"
DOC_CONTENTS="In order to use ${CATEGORY}/${PN} add
. /usr/share/zsh/site-contrib/${PN}/zsh-autosuggestions.zsh
to your ~/.zshrc"

src_install() {
	insinto /usr/share/zsh/site-contrib/${PN}
	doins zsh-autosuggestions.zsh
	dodoc README.md
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
