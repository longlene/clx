# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils git

DESCRIPTION="FUSE filesystem used to organize your documents using tags"
HOMEPAGE="http://wiki.github.com/marook/tagfs"
SRC_URI=""

EGIT_REPO_URI="git://github.com/marook/tagfs.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="examples"

DEPEND="|| ( dev-lang/python:2.5 dev-lang/python:2.6 )
	dev-python/fuse-python"
RDEPEND="${DEPEND}"

src_prepare() {
	# ?
	sed -e "s#prefix = /usr/local#prefix = ${D}#" -i Makefile
}

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install

	rm -r ${D}/usr/share/doc
	dodoc AUTHORS README

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r etc/demo
	fi
}

pkg_postinst() {
	if use examples; then
		elog "Example items were installed into /usr/share/doc/${PF}/demo."
		elog "Try tagfs -i /usr/share/doc/${PF}/demo/events /path/to/mountpoint !"
	fi
}
