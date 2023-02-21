# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Migrate to PostgreSQL in a single command"
HOMEPAGE="https://github.com/dimitri/pgloader"
SRC_URI="https://github.com/dimitri/pgloader/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="POSTGRESQL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lisp/sbcl
"

RESTRICT=network-sandbox

src_install() {
	dobin build/bin/pgloader
	doman pgloader.1
}
