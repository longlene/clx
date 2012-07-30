# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

if [[ ${PV} == "9999" ]] ; then
	ESVN_REPO_URI="https://sdcc.svn.sourceforge.net/svnroot/sdcc/trunk/sdcc"
	inherit subversion autotools
	docs_compile() { return 0; }
else
	SRC_URI="mirror://sourceforge/sdcc/${PN}-src-${PV}.tar.bz2
		doc? ( mirror://sourceforge/sdcc/${PN}-doc-${PV}.tar.bz2 )"
	KEYWORDS="~amd64 ~ppc ~x86"
	docs_compile() { return 1; }
fi

DESCRIPTION="Small device C compiler (for various microprocessors)"
HOMEPAGE="http://sdcc.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
IUSE="+boehm-gc doc mcs51 gbz80 z80 avr ds390 ds400 hc08 pic pic16 xa51 ucsim +device-lib"
RESTRICT="strip"

RDEPEND="sys-libs/ncurses
	sys-libs/readline
	>=dev-embedded/gputils-0.13.7
	boehm-gc? ( dev-libs/boehm-gc )
	!dev-embedded/sdcc-svn"
DEPEND="${RDEPEND}"
if docs_compile ; then
	DEPEND+="
		doc? (
			>=app-office/lyx-1.3.4
			dev-tex/latex2html
		)"
fi

S=${WORKDIR}/${PN}

src_prepare() {
	# Fix conflicting variable names between Gentoo and sdcc
	find \
		'(' -name 'Makefile*.in' -o -name configure ')' \
		-exec sed -r -i \
			-e 's:\<(PORTDIR|ARCH)\>:SDCC\1:g' \
			{} + || die

	[[ ${PV} == "9999" ]] && eautoreconf
}

src_configure() {

	ac_cv_prog_STRIP=true \
	econf \
		$(use_enable boehm-gc libgc) \
		$(use_enable mcs51 mcs51-port) \
		$(use_enable z80 z80-port) \
		$(use_enable gbz80 gbz80-port) \
		$(use_enable avr avr-port) \
		$(use_enable ds390 ds390-port) \
		$(use_enable ds400 ds400-port) \
		$(use_enable hc08 hc08-port) \
		$(use_enable pic pic-port) \
		$(use_enable pic16 pic16-port) \
		$(use_enable xa51 xa51-port) \
		$(use_enable ucsim ucsim) \
		$(use_enable device-lib device-lib) \
		$(docs_compile && use_enable doc || echo --disable-doc)

}

fsrc_compile() {
	emake || die
	if docs_compile && use doc ; then
		cd doc
		local d
		for d in cdbfileformat sdccman test_suite_spec ; do
			lyx -e html ${d} || die
		done
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc doc/*.txt doc/*/*.txt
	find "${D}" -name .deps -exec rm -rf {} +

	if use doc ; then
		docs_compile || cd "${WORKDIR}"/doc
		dohtml -r *
	fi

	# a bunch of archives (*.a) are built & installed by gputils
	# for PIC processors, but they do not work with standard `ar`
	# & `scanelf` utils and they're not for the host.
	env RESTRICT="" prepstrip "${D%/}"/usr/bin
}

pkg_postinst() {
	elog "SDCC won't do much without enabling a target port or ucsim"
	elog "To view possible port USE flags do:"
	elog "emerge -vp =${CATEGORY}/${PF}"
	elog "Add the USE flags to /etc/portage/package.use"
	elog "See: http://www.gentoo.org/doc/en/handbook/handbook-x86.xml?part=2&chap=2"
	elog "if you are not sure how to do this."
}
