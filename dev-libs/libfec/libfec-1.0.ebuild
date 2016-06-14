# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit flag-o-matic

DESCRIPTION="forward error correction algorithm"
HOMEPAGE="https://github.com/quiet/libfec"
SRC_URI="https://github.com/quiet/libfec/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/REBIND/d' makefile.in
}

src_configure() {
	append-flags "-fPIC"
	econf --prefix="${D}"/usr --mandir="${D}"/usr/share/man
}
