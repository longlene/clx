# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp depend.php

DESCRIPTION="PHP based Content Management System (CMS), that makes it easy for
everyone to run a website"
HOMEPAGE="http://concrete5.org"
SRC_URI="mirror://sourceforge/${PN}/concrete${PV}.zip
		linguas_de? ( mirror://sourceforge/${PN}/de_DE.zip )
		linguas_fr? ( mirror://sourceforge/${PN}/fr_FR.zip )
		linguas_da? ( mirror://sourceforge/${PN}/da_DK.zip )"

LICENSE="MIT"
KEYWORDS="~amd64"
IUSE_LINGUAS="linguas_de linguas_da linguas_fr"
IUSE="${IUSE_LINGUAS}"

DEPEND=""
RDEPEND=""

need_httpd_cgi
need_php_httpd

S="${WORKDIR}/concrete${PV}"

pkg_setup() {
	webapp_pkg_setup
	require_php_with_any_use mysql mysqli
}

src_install() {
	webapp_src_preinst

	local docs="README LICENSE.TXT"
	dodoc $docs
	rm -f $docs

	if use linguas_de
	then
		mv ../de_DE languages
	fi
	if use linguas_fr
	then
		mv ../fr_FR languages
	fi
	if use linguas_da
	then
		mv ../da_DK languages
	fi

	insinto "${MY_HTDOCSDIR}"
	doins -r .
	
	webapp_serverowned -R "${MY_HTDOCSDIR}/files"
	webapp_serverowned -R "${MY_HTDOCSDIR}/config"
	webapp_configfile "${MY_HTDOCSDIR}/config/site_theme_paths.php"

	webapp_src_install

	webapp_postinst_txt en "${FILESDIR}/postinstall-en.txt"
}
