# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Postgresql full-text search extension for chinese"
HOMEPAGE="https://github.com/jaiminpan/pg_jieba"
SRC_URI="https://github.com/jaiminpan/pg_jieba/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-db/postgresql"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/g++/{s/$(CFLAGS)/$(filter-out -Wmissing-prototypes -Wdeclaration-after-statement -fexcess-precision=standard, $(CFLAGS))/}' -i Makefile
}

src_compile() {
	USE_PGXS=1 emake
}

src_install() {
	USE_PGXS=1 DESTDIR="${D}" emake install
}
