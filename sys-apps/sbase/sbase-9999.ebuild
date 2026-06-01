# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="suckless unix tools"
HOMEPAGE="http://git.2f30.org/sbase/"

EGIT_REPO_URI="git://git.2f30.org/sbase"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's#/local##' \
		-e '/LDFLAGS/ s|^|#|' \
		config.mk
}
