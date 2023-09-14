# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit eutils autotools

DESCRIPTION="ELF (Executable and Linkable Format) reader and producer implemented as a C++ library"
HOMEPAGE="http://elfio.sourceforge.net/"
SRC_URI="mirror://sourceforge/elfio/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd"
IUSE=""

src_prepare() {
	eapply_user
	sed -e '/ac_config_files=/{s#examples/tutorial/Makefile##}' \
		-e '/ac_config_files=/{s#examples/writer/Makefile##}' \
		-e '/ac_config_files=/{s#examples/write_obj/Makefile##}' \
		-e '/CONFIG_FILES=/{/examples\/tutorial\/Makefile/d}' \
		-e '/CONFIG_FILES=/{/examples\/writer\/Makefile/d}' \
		-e '/CONFIG_FILES=/{/examples\/write_obj\/Makefile/d}' \
		-i configure || die "prepare failed"
	sed -e '/SUBDIRS\ =/{s#tutorial writer write_obj##}' \
		-i examples/Makefile.in
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
