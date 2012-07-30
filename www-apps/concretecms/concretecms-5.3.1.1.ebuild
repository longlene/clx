# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp depend.php

DESCRIPTION="PHP based Content Management System (CMS), that makes it easy for
everyone to run a website"
HOMEPAGE="http://concrete5.org"
SRC_URI="mirror://sourceforge/${PN}/concrete${PV}.zip
		linguas_de? ( mirror://sourceforge/${PN}/de_DE-5.2.0.zip )
		linguas_fr? ( mirror://sourceforge/${PN}/fr_FR-5.2.0.zip )
		linguas_da? ( mirror://sourceforge/${PN}/da_DK-5.2.0.zip )
		linguas_pt_BR? ( mirror://sourceforge/${PN}/pt_BR-5.2.0.zip )
		linguas_sv? ( mirror://sourceforge/${PN}/sv_SE-5.2.0.zip )"

LICENSE="MIT"
KEYWORDS="~x86"

IUSE_LANG="de_DE da_DK fr_FR pt_BR sv_SE"
IUSE="nls"

for lang in ${IUSE_LANG}; do
	if [ ${lang} != 'pt_BR' ]; then lang=${lang%_*}; fi
	IUSE="${IUSE} linguas_${lang}"
done

DEPEND="nls? ( sys-devel/gettext )"
RDEPEND=""

need_httpd_cgi
need_php_httpd

S="${WORKDIR}/concrete${PV}"

pkg_setup() {
	webapp_pkg_setup
	require_php_with_any_use mysql mysqli
	if ( use linguas_de || use linguas_da || use linguas_fr || use linguas_pt_BR || use linguas_sv ) && ! use nls
	then
		ewarn "Translations will not be built. To enable translations set the nls use flag."
	fi
}

src_unpack() {
	unpack concrete${PV}.zip
	if use nls; then
		local lingualang
		for lang in ${IUSE_LANG}; do
			lingualang=${lang}
			if [ ${lang} != "pt_BR" ]; then lingualang=${lingualang%_*}; fi
			if use linguas_${lingualang}; then
				unpack ${lang}-5.2.0.zip
				chmod 644 messages.po || die
				mv messages.po ${lang}.po || die
			fi
		done
	fi
}

src_compile() {
	local langdir
	local lingualang
	if use nls; then
		for lang in ${IUSE_LANG}; do
			lingualang=${lang}
			if [ ${lang} != "pt_BR" ]; then lingualang=${lingualang%_*}; fi
			if use linguas_${lingualang}; then
				langdir="languages/${lang}/LC_MESSAGES"
				mkdir -p ${langdir} || die
				mv ../${lang}.po ${langdir}/messages.po || die
				msgfmt -o ${langdir}/messages.mo ${langdir}/messages.po || die
			fi
		done
	fi
}

src_install() {
	webapp_src_preinst

	local docs="README LICENSE.TXT"
	dodoc $docs || die
	rm -f $docs
	insinto "${MY_HTDOCSDIR}"
	doins -r . || die

	webapp_serverowned -R "${MY_HTDOCSDIR}/files"
	webapp_serverowned -R "${MY_HTDOCSDIR}/config"
	webapp_serverowned -R "${MY_HTDOCSDIR}/packages"
	webapp_configfile "${MY_HTDOCSDIR}/config/site_theme_paths.php"

	webapp_src_install

	webapp_postinst_txt en "${FILESDIR}/postinstall-en.txt"
}
