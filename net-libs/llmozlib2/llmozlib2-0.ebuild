# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit multilib

DESCRIPTION="LLMozLib library let embed the Mozilla Gecko rendering engine into
your application."
HOMEPAGE="http://ubrowser.com/"
SRC_URI="x86? ( http://s3.amazonaws.com/viewer-source-downloads/install_pkgs/llmozlib-linux-20090304prfhk.tar.bz2 )
	amd64? ( http://s3.amazonaws.com/viewer-source-downloads/install_pkgs/llmozlib-linux64-20080909.tar.bz2 )"

LICENSE="MPL-1.1"
SLOT="2"
KEYWORDS="~x86"
IUSE="examples"

DEPEND=""
RDEPEND="dev-libs/atk
	dev-libs/glib
	media-libs/fontconfig
	media-libs/jpeg
	sys-libs/zlib
	x11-libs/gtk+:2
	x11-libs/pango
	|| ( 
		www-client/mozilla-firefox-bin
		net-libs/xulrunner-bin
	)"

# suppress QA warnings
QA_TEXTRELS="usr/lib/llmozlib2/libxul.so"

src_install() {
	local LLARCH="i686"
	use amd64 && LLARCH="x86_64"

	einfo "Installing libraries ..."
	insinto "/usr/$(get_libdir)/${PN}"
	doins libraries/${LLARCH}-linux/lib_release_client/*.{so,a}
	doins indra/newview/app_settings/mozilla-runtime-linux-${LLARCH}/libxpcom.so

	einfo "Installing headers ..."
	insinto "/usr/include/${PN}"
	doins libraries/include/*.h

	# Installing docs
	dodoc LICENSES/llmozlib.txt
}
