# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="simple battery monitor"
HOMEPAGE="http://git.2f30.org/xbattmon/"
SRC_URI="http://dl.2f30.org/releases/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/PREFIX =/ s#/local##' config.linux.mk
}
