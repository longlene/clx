# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Public domain POSIX make"
HOMEPAGE="https://github.com/rmyorston/pdpmake"
SRC_URI="https://github.com/rmyorston/pdpmake/archive/refs/tags/1.4.1.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

src_prepare() {
	default
	sed -e '/PREFIX =/{s#/usr/local#/usr#}' \
		-i Makefile
}
