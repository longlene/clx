# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="Embeddable JSON shell"
HOMEPAGE="https://github.com/quartzjer/electron"
SRC_URI=""

EGIT_REPO_URI="https://github.com/quartzjer/electron.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin bin/electron
	dodoc README.md
}
