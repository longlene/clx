# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp depend.php

DESCRIPTION="The Photo Organizer web application"
HOMEPAGE="http://po.shaftnet.org"
SRC_URI="http://po.shaftnet.org/_media/po-${PV}.tar.bz2"
RESTRICT="nomirror"
LICENSE="GPL-2"
KEYWORDS="x86"
IUSE="lcms dcraw exiftool ps2pdf"

MY_P="po-${PV}"
S="${WORKDIR}/${MY_P}"

DEPEND=""

# NOTE: ghostscript contains the ps2pdf program
RDEPEND="
		>=dev-lang/php-4.3.10
		>=media-gfx/imagemagick-6.0
		>=dev-db/postgresql-7.4
		lcms? (
			media-libs/lcms
		)
		dcraw? (
			media-gfx/dcraw
		)
		exiftool? (
			media-libs/exiftool
		)
		ps2pdf? (
			app-text/ghostscript-gpl		
		)
"

need_php

pkg_setup() {
	webapp_pkg_setup
	require_php_with_use bcmath postgres
}

src_install() {
	webapp_src_preinst

	# copy top level src/ directory
	insinto ${MY_HTDOCSDIR}
	doins src/*

	# copy the subdirectories in src/
	local DIRS=(
		"help"
		"im"
		"include"
		"java"
		# This one is empty:
		# "java/buttons"
		"java/search.layout"
		"java/search.layout/buttons"
		"java/search.color"
		"java/search.color/buttons"
		"javascript"
		"javascript/jscalendar/"
		"javascript/jscalendar/lang"
		"sql"
		"themes"
		"themes/aqua"
		"themes/aqua/jscalendar"
	)
	insinto ${MY_HTDOCSDIR}
	for DIR in ${DIRS[*]}; do
		dodir ${MY_HTDOCSDIR}/${DIR}
		insinto ${MY_HTDOCSDIR}/${DIR}
		doins src/${DIR}/*
	done

	# installing documentation
	local DOCS=(
		"CHANGES"
		"COPYING"
		"README"
	)
	for DOC in ${DOCS[*]}; do
		dodoc "${DOC}"
	done

	dohtml -r doc

	webapp_postinst_txt en ${FILESDIR}/postinstall.txt
	webapp_src_install
}
