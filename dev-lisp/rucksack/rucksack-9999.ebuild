# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ECVS_SERVER="common-lisp.net:/project/rucksack/cvsroot"
ECVS_MODULE="rucksack"
ECVS_USER="anonymous"
ECVS_PASS="anonymous"
ECVS_CVS_OPTIONS="-dP"

inherit common-lisp-2 cvs

DESCRIPTION="Rucksack: a flexible, light weight, open source persistence library for common lisp."
HOMEPAGE="http://common-lisp.net/project/rucksack"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="doc"

DEPEND=""

S="${WORKDIR}/${ECVS_MODULE}"

src_install() {
	cd "${S}"

	common-lisp-install *.{asd,lisp} \
	                    tests/*.{asd,lisp}

	common-lisp-symlink-asdf ${PN}

	use doc && dodoc doc/*.txt
}
