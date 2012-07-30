# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils versionator

MY_MINOR_VERSION="$(get_version_component_range 1-3)"
MY_BUILD="4343"

DESCRIPTION="Freeware advanced editor for dynamic and Web languages"
HOMEPAGE="http
://www.activestate.com/products/komodo_edit/"
LICENSE="ActiveState Komodo Edit"

SRC_URI="http://downloads.activestate.com/Komodo/releases/${MY_MINOR_VERSION}/Komodo-Edit-${PV}-${MY_BUILD}-linux-libcpp6-x86_64.tar.gz"

SLOT="0"
KEYWORDS="-* ~amd64"

IUSE="default-templates"

DEPEND=">=media-libs/jpeg-6b
	>=sys-libs/lib-compat-1.1
	virtual/libc"

RDEPEND="${DEPEND}"

S="${WORKDIR}/Komodo-Edit-${PV}-${MY_BUILD}-linux-libcpp6-x86_64"

QA_EXECSTACK_x86_64="opt/${P}/lib/python/lib/python2.r64/config/python.o"

QA_TEXTRELS_x86_64="
	opt/${P}/lib/mozilla/components/libxpinstall.so
	opt/${P}/lib/mozilla/libxpcom_core.so
	opt/${P}/lib/mozilla/python/xpcom/_xpcom.so
	opt/${P}/lib/mozilla/python/komodo/SilverCity/_SilverCity.so
	opt/${P}/lib/mozilla/libxpcom_compat.so
	opt/${P}/lib/mozilla/plugins/libnpscimoz.so"

src_install() {

	KOMODO_EDIT_INSTALLDIR="/opt/${P}"

	dodir "${KOMODO_EDIT_INSTALLDIR}"
	
	"${S}/install.sh" \
		--install-dir "${D}/${KOMODO_EDIT_INSTALLDIR}" \
		--suppress-shortcut || die "original installer script failed"
	
	# Patches the Komodo launcher script, with the real base install dir.
	sed --in-place "s/^\INSTALLDIR=.*\$/INSTALLDIR=\"${KOMODO_EDIT_INSTALLDIR//\//\\/}\"/" \
		"${D}/${KOMODO_EDIT_INSTALLDIR}/bin/komodo" || die "sed bin/komodo failed"

	dosym "${KOMODO_EDIT_INSTALLDIR}/bin/komodo" "/usr/bin/${P}" &&
	dosym "./${P}" "/usr/bin/${PN}" ||
		die "failed dosym Komodo launcher script"

	# Most default templates are empty, or near-empty, and can clutter
	# the new file dialog, so we permit not to install them.
	use default-templates || (
		rm -R "${D}/${KOMODO_EDIT_INSTALLDIR}/"lib/mozilla/extensions/*/templates/* &&
		rm -R "${D}/${KOMODO_EDIT_INSTALLDIR}/"lib/support/default-templates/* ||
			die "failed removing default templates"
	)

#	dodoc FEEDBACK.txt README.txt RELNOTES.txt || die "dodoc failed"

	dosym "${KOMODO_EDIT_INSTALLDIR}/share/icons/komodo48.png" \
		"/usr/share/pixmaps/${PN}.png" || die "dosym pixmap icon failed"

	make_desktop_entry \
		"${PN}" \
		"Komodo Edit" \
		"${PN}.png" \
		"Development;IDE;Editor;TextEditor;ActiveState" ||
			die "make_desktop_entry failed"
}
