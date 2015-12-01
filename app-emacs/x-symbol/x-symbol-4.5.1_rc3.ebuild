# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

RESTRICT="primaryuri"

NEED_EMACS="22" # at least
EMACS_22="emacs-${NEED_EMACS}"

inherit elisp versionator

PV_A=($(get_version_components))
# 4.5.1-r3 -> 4.51
MY_P="${PN}-${PV_A[0]}.${PV_A[1]}${PV_A[2]}"

FLK=2.6a
ADF=0.1

DESCRIPTION="X-Symbol package for XEmacs (semi WYSIWYG for LaTeX, HTML)"
HOMEPAGE="http://x-symbol.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}-src.tar.gz
         mirror://sourceforge/${PN}/x-font-lock-${FLK}.tar.gz
         mirror://sourceforge/${PN}/${PN}-additional-fonts-${ADF}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc x86"
IUSE="X doc"

RDEPEND="app-admin/eselect-emacs"
DEPEND="${RDEPEND}
	X? ( x11-apps/bdftopcf x11-apps/mkfontdir dev-lang/perl )
	doc? ( virtual/latex-base sys-apps/texinfo app-text/texi2html )"

S="${WORKDIR}/${PN}"
SITEFILE=60${PN}-gentoo.el

pkg_setup() {
	use X || die "Please build with USE flag \`X' enabled."

	local eemacs="emacs-$(elisp-emacs-version)"
	! has_version "=virtual/${EMACS_22}" ||
		! test "${eemacs%%.*}" = "${EMACS_22}" ||
			return

	ewarn "Please have \`=app-editors/${EMACS_22}*' installed and \`eselect emacs set ${EMACS_22}'."
	ewarn "X-Symbol requires major version ${NEED_EMACS} of GNU Emacs."
	ewarn "While GNU Emacs may have multiple slots, this package needs \`=virtual/${EMACS_22}'."
	ewarn "This means X-Symbol is incompatible with later versions of GNU Emacs."
	die "Some of the above conditions were not met."
}

src_unpack() {
	unpack "${MY_P}-src.tar.gz"
	unpack "x-font-lock-${FLK}.tar.gz"
}

src_prepare() {
	cd "${S}"/lisp
	sed -i -e "s/# install_el/install_el #/" \
	       -e "/echo [^'].*elcdir/s/[\$](elcdir)/@SITELISP@/" Makefile

	cd "${S}"/fonts
	sed -i -e "s/-xset/-echo xset/" Makefile

	use doc || return

	cd "${S}"/man
	sed -i -e "/^index[.]html[:]/s/ x-symbol.init//" Makefile
	has_version '<app-text/texi2html-1.76' || \
	sed -i -e '/T2H_DEFAULT_print_Top_footer(\$fh);/s/);/, 0);/' x-symbol.init
	sed -i -e "/^@direntry/,+1s/\"\$/\"./" x-symbol.texi
}

src_compile() {
	cd "${S}"/../x-font-lock/lisp
	elisp-compile x-font-lock.el || die "x-font-lock.el compile failed"

	cd "${S}"/fonts
	make all || die "making fonts failed"

	use doc || return

	cd "${S}"/man
	make EMACS=emacs all || die "making documentation failed"
}

src_install() {
	local startupfile="${S}"/${SITEFILE}
	local datadir="${SITEETC}"/${PN}
	local fontdir="${datadir}"/pcf
	local fontadd="${DISTDIR}"/${PN}-additional-fonts-${ADF}.tar.gz
	local inifile="${S}"/lisp/x-symbol-site.el

	echo "(when (string-match \"^${NEED_EMACS}.*\" emacs-version)" >> "${startupfile}"
	sed -n -e "s:^\\(.*\\)\$:\\1:p" "${FILESDIR}"/${SITEFILE} >> "${startupfile}"
	sed -n -e "/^;;.*-data-directory/{p;q}" -e "0~1d" "${S}"/lisp/x-symbol-site.el | \
	sed -n -e "\${{s:;;::};{s:[~]/[.]xemacs/etc/${PN}:${datadir}:};p}" >> "${startupfile}"
	echo "(load \"x-symbol-startup\"))" >> "${startupfile}"

	cd "${S}"/lisp
	einstall startupfile="${startupfile}" || die "installing package failed"

	elisp-site-file-install "${startupfile}" || die "installing site file failed"

	cd "${S}"/..
	elisp-install "${PN}" x-font-lock/lisp/x-font-lock.el{,c} || die "installing x-font-lock failed"

	cd "${S}"
	dodir "${datadir}" || die "creating data-directory failed"
	insinto "${datadir}"
	doins etc/* || die "copying data-directory failed"
	dodir "${fontdir}" || die "creating font-directory failed"
	insinto "${fontdir}"
	doins pcf/* || die "copying font-directory failed"

	insinto "/usr/share/doc/${PF}"
	doins "${fontadd}" || die "copying additional fonts failed"
	doins "${inifile}" || die "copying sample initialisation file failed"

	use doc || return

	cd "${S}"/man
	doinfo ${PN}.info             &&
	dodoc ${PN}.{pdf,ps,texi}     &&
	dohtml ${PN}/*.html           &&
	dodoc ../ChangeLog* ../README || die "copying documentation failed"
}

pkg_postinst() {
	elisp-site-regen

	einfo

	ewarn "Perform \`eselect emacs set ${EMACS_22}' whenever X-Symbol support is desired."

	einfo

	einfo "To enable X-Symbol on Emacs startup, add"
	einfo "(when (string-match \"^${NEED_EMACS}.*\" emacs-version)"
	einfo "   (princ \"Initializing X-Symbol\")                   "
	einfo "   (require 'x-symbol-hooks)                           "
	einfo "   (x-symbol-initialize)                               "
	einfo "   (require 'x-font-lock))                             "
	einfo "to your ~/.emacs file."

	einfo

	einfo "There are additional fonts you may use in"
	einfo "/usr/share/doc/${PF}/${PN}-additional-fonts-${ADF}.tar.gz"

	elog
	elog "Please visit /usr/share/doc/${PF}/x-symbol-site.el"
	elog "for hints on how to configure X-Symbol from your ~/.emacs file."
	elog

	use doc || return

	elog "You may consult /usr/share/doc/${PF}"
	elog "for further documentation on X-Symbol."
	elog "Or point your browser to /usr/share/doc/${PF}/html/index.html."
	elog "There is also an info page available: try \`info ${PN}'."
}
