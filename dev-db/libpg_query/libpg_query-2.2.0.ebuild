# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

DESCRIPTION="C library for accessing the PostgreSQL parser outside of the server environment"
HOMEPAGE="https://github.com/pganalyze/libpg_query"
SRC_URI="https://github.com/pganalyze/libpg_query/archive/refs/tags/13-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/prefix =/{s#/local##}' \
		-e "/libdir =/{s#/lib#/$(get_libdir)#}" \
		-i Makefile
}

src_compile() {
	emake build_shared
}
