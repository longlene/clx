# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="k is the new l"
HOMEPAGE="https://github.com/supercrabtree/k"
SRC_URI="mirror://github/supercrabtree/k/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="app-shells/zsh"
RDEPEND="${DEPEND}"

src_install() {
	#TODO path need check
	insinto /etc/profile.d
	doins k.sh
}
