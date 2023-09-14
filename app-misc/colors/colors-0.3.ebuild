# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="extract colors from pictures"
HOMEPAGE="http://git.2f30.org/colors/"
SRC_URI="http://dl.2f30.org/releases/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e '/PREFIX/ s#/local##' \
		-e '/MANPREFIX =/ s#/man#/share/man#' \
		-i Makefile
}
