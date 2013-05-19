# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2:2.5"

inherit distutils python

DESCRIPTION="Toolkit to convert between many translation formats"
HOMEPAGE="http://translate.sourceforge.net"
SRC_URI="mirror://sourceforge/translate/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc html ical psyco subtitles"

DEPEND="dev-python/lxml
	ical? ( dev-python/vobject )
	sys-devel/gettext"

RDEPEND="${DEPEND}
	|| ( =dev-lang/python-2*[sqlite] >=dev-python/pysqlite-2 )
	app-text/iso-codes
	psyco? ( dev-python/psyco )
	dev-python/python-levenshtein
	html? ( dev-python/utidylib )
	subtitles? ( media-video/gaupol )"
	# dev-python/iniparse is missing in Portage

PYTHON_MODNAME=translate

src_install() {
	dohtml -r translate/doc/{index.html,README,user} || die
	if use doc; then
		dohtml -r translate/doc/api/* || die
	fi
	rm -Rf translate/doc || die

	distutils_src_install

	if ! use html; then
		rm "${D}"/usr/bin/html2po || die
		rm "${D}"/usr/bin/po2html || die
	fi
	if ! use ical; then
		rm "${D}"/usr/bin/ical2po || die
		rm "${D}"/usr/bin/po2ical || die
	fi
	if ! use subtitles; then
		rm "${D}"/usr/bin/sub2po || die
		rm "${D}"/usr/bin/po2sub || die
	fi

	# there is no dev-python/iniparse in the tree
	rm "${D}"/usr/bin/ini2po || die
	rm "${D}"/usr/bin/po2ini || die

	ebegin "Creating man pages"
	for file in "${D}"/usr/bin/*; do
		filename=$(basename "${file}")
		PYTHONPATH=${WORKDIR}/${PF}:${PYTHONPATH}

		if  ${file} --man > "${T}/${filename}.1" 2> /dev/null; then
			doman "${T}/${filename}.1" || die
		else
			rm "${T}/${filename}.1" || die
		fi
	done
	eend
}

