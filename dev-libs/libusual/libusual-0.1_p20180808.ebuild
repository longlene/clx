# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="843a524c975d74505ba027155d733ba757f9b5fb"

DESCRIPTION="Modern C Environment"
HOMEPAGE="http://libusual.github.io/"
SRC_URI="https://github.com/libusual/libusual/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	./autogen.sh || die "prepare failed"
}
