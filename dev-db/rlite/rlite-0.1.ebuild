# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit flag-o-matic

DESCRIPTION="self-contained, serverless, zero-configuration, transactional redis-compatible database engine"
HOMEPAGE="https://github.com/seppo0010/rlite"
SRC_URI="https://github.com/seppo0010/rlite/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '96{s#$(ARCH)##}' src/Makefile
}

src_compile() {
	append-cflags "-fPIC"
	emake
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}
