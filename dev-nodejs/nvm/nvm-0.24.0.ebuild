# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit bash-completion-r1

DESCRIPTION="Node Version Manager - Simple bash script to manage multiple active node.js versions"
HOMEPAGE="https://github.com/creationix/nvm"
SRC_URI="https://github.com/creationix/nvm/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bash-completion"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	:
}
src_install() {
	newbashcomp bash_completion ${PN}
	insinto /usr/share/${PN}
	doins nvm.sh
}

pkg_postinst() {
	echo
	elog "Create NVM's directory if it doesn't not exist:"
	elog "mkdir ~/.nvm"
	elog "Add the following lines to your ~/.bashrc or ~/.zshrc to enable nvm"
	elog
	elog "export NVM_DIR=~/.nvm"
	elog "source /usr/share/${PN}/nvm.sh"
	elog
	echo
}
