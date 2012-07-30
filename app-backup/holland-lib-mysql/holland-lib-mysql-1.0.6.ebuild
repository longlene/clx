# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit distutils

DESCRIPTION="Provides convenience methods for MySQL with Holland."
HOMEPAGE="http://hollandbackup.org/"

IUSE=""

KEYWORDS="-* ~amd64 ~x86"
LICENSE="GPL-2"
SLOT="0"

MY_P=${P%%-*}-${P##*-}

SRC_URI="http://hollandbackup.org/releases/stable/${PV%.*}/${MY_P}.tar.gz"

MY_DIR="$(echo ${PN} | tr '-' '.')"

DEPEND="
	app-backup/holland
	dev-python/mysql-python
	"
RDEPEND="${DEPEND}
	"
PDEPEND=""

RESTRICT="mirror"
PROPERTIES=""

src_compile() {
	cd ${MY_P}/plugins/${MY_DIR}
	distutils_src_compile
}

src_install() {
	cd ${MY_P}/plugins/${MY_DIR}
	distutils_src_install
}
