# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

MY_P="${PN}_${PV}-src"

DESCRIPTION="FUSE filesystem used to organize your documents using tags"
HOMEPAGE="http://wiki.github.com/marook/tagfs"
SRC_URI="http://cloud.github.com/downloads/marook/tagfs/${MY_P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="|| ( dev-lang/python:2.5 dev-lang/python:2.6 )
	dev-python/fuse-python"
RDEPEND="${DEPEND}"

src_install() {
	dobin src/tagfs.py
	dodoc AUTHORS README
	insinto /usr/share/doc/${PF}
	doins -r etc/demo
}

pkg_postinst() {
	elog "Usage: tagfs.py {-i|--items-dir} /path/to/items/dir [{-t|--tag-file} tag-file-name] mountpoint"
	elog "Default tag file name is .tag"
	elog "See /usr/share/doc/${PF}/README for details."
	elog "See /usr/share/doc/${PF}/demo for examples."
}
