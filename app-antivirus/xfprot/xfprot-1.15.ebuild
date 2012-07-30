# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A graphical frontend to the F-Prot Antivirus(TM) for Linux"
HOMEPAGE="http://web.tiscali.it/sharp/xfprot/"
SRC_URI="http://web.tiscali.it/sharp/xfprot/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

IUSE_LINGUAS="linguas_de linguas_en linguas_es linguas_fr linguas_it linguas_pl linguas_pt_BR"
IUSE="${IUSE_LINGUAS} debug"

DEPEND=">=x11-libs/gtk+-2
	>=dev-libs/glib-2
	>=app-antivirus/f-prot-4.6.0-r2"
RDEPEND="${DEPEND}"

pkg_setup() {
	einfo "Please, set your LINGUAS to exactly ONE of the supported values."
	einfo "This application cannot support multiple languages at the same time (yet)."
}

src_compile() {
	local myconf=
	use linguas_de && myconf="${myconf} --with-lang=de_DE"
	use linguas_en && myconf="${myconf} --with-lang=en_GB"
	use linguas_es && myconf="${myconf} --with-lang=es_ES"
	use linguas_fr && myconf="${myconf} --with-lang=fr_FR"
	use linguas_it && myconf="${myconf} --with-lang=it_IT"
	use linguas_pl && myconf="${myconf} --with-lang=pl_PL"
	use linguas_pt_BR && myconf="${myconf} --with-lang=pt_BR"

	if [[ -z ${myconf} ]] ; then
		einfo "You didn't select any language, defaulting to English."
		einfo "If you want something else, set LINGUAS accordingly."
		epause 3
		myconf="--with-lang=en_GB"
	fi

	# not using econf because script does not like --prefix=/usr
	./configure \
	--autodetect \
	--with-install-dir="${D}/usr" \
	--with-gtk2 \
	${myconf} \
	$(use_with debug) || die "configure failed"
	emake || die "emake failed"
}

src_install() {
	# install manually, make install produces stupid directory structure
	newbin ${S}/xfprot-gtk xfprot

	# Install the icons
	insinto /usr/share/pixmaps
	newins icons/antivirus-32x32.png xfprot.png
	for res in 32x32 48x48 64x64 128x128 ; do
		insinto /usr/share/icons/hicolor/${res}/apps/
		newins icons/antivirus-${res}.png xfprot.png
	done
	make_desktop_entry ${PN} "XFProt (F-Prot AV GUI)" ${PN}.png "Security;System;GTK"

	dodoc Changelog README eicar.com.txt
}
