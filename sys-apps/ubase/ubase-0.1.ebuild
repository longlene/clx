# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="suckless linux base utils"
HOMEPAGE="http://git.2f30.org/ubase/"
SRC_URI="http://dl.2f30.org/releases/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e '/CC = gcc/ s|#||' \
		-e '/PREFIX =/ s#/local##' \
		-e '/LDFLAGS/ s|-s||' \
		config.mk
}
