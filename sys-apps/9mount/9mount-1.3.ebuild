# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="a set of SUID tools for mounting 9p filesystems"
HOMEPAGE="http://sqweek.net/code/9mount/"
SRC_URI="http://sqweek.net/9p/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin 9mount 9bind 9umount
	doman 9mount.1
}
