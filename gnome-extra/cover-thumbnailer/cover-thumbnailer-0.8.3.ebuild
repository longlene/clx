# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2:2.7"
inherit python versionator

DESCRIPTION="Display covers on folders in nautilus"
HOMEPAGE="http://projects.flogisoft.com/cover-thumbnailer/"

CPV=$(get_version_component_range '1-2')
SRC_URI="http://launchpad.net/${PN}/v${CPV}/v${PV}/+download/${PN}_${PV}_src.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"
LANGS="ar ca cs da de el en_GB es fr gl he hr hu it ja ko ms nl oc pl pt pt_BR
ro ru sk sv tr uk zh_CN zh_TW"
for X in ${LANGS} ; do
	IUSE="${IUSE} linguas_${X}"
done

DEPEND="sys-devel/gettext
	>=gnome-base/nautilus-3.0"

RDEPEND="${DEPEND}
	dev-python/imaging
	dev-python/pygtk"

S="${S%-${PV}}_${PV}_src"

src_install()
{
	newbin cover-thumbnailer.py cover-thumbnailer || die
	newbin cover-thumbnailer-gui.py cover-thumbnailer-gui || die

	insinto /usr/share/${PN}
	doins share/* || die

	insinto /usr/share/applications
	doins freedesktop/cover-thumbnailer-gui.desktop || die

	insinto /usr/share/thumbnailers
	doins freedesktop/cover.thumbnailer || die

	doman man/* || die
	dodoc README || die

	if use nls; then
		cd locale/
		for n in *.po; do
			n=${n/.po}
			if use linguas_${n}; then
				msgfmt -o ${n}.mo ${n}.po \
					|| die "Compilation of locale ${n} failed."
				insinto /usr/share/locale/${n}/LC_MESSAGES
				newins ${n}.mo ${PN}.mo \
					|| die "Installation of locale ${n} failed."
			fi
		done
	fi
}

pkg_postinst() {
	ewarn
	ewarn "It is necessary to relog in your session for"
	ewarn "cover-thumbnailer to start working."
	ewarn
}
