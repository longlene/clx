# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils versionator

DESCRIPTION="Palm WebOS SDK with Mojo and Enyo Application Framework and
			 emulator to develop HP Pre and Touchpad applications"
HOMEPAGE="http://developer.palm.com/"

MY_VER="$(get_version_component_range 1-3)-svn528736-pho676"
SRC_URI="http://cdn.downloads.palm.com/sdkdownloads/${PV}/sdkBinaries/palm-sdk_${MY_VER}_i386.deb"

LICENSE="PalmSDK"
SLOT="3.0.5"
KEYWORDS="~amd64 ~x86 -*"
MY_LINGUAS="linguas_de linguas_it linguas_pt_BR linguas_ru linguas_sv"
IUSE=${MY_LINGUAS}

# NOTE: for SDK 3.0.5 and possibly other versions, virtualbox-bin is required instead of virtualbox
# The palm-emulator tool fails to parse the output of `VBoxManage -v` if "-Gentoo" is present
RDEPEND="
	app-emulation/virtualbox-bin
	>=virtual/jre-1.5
	"

src_unpack() {
	unpack ${A}
	unpack ./data.tar.gz
	mkdir ${S} || die
	mv opt ${S} || die
}

src_prepare() {
	local my_linguas
	for my_linguas in ${MY_LINGUAS} ; do
		use ${my_linguas} && continue
		rm -rf "opt/PalmSDK/0.1/share/locale/${my_linguas#linguas_}" || die
	done
}

src_install() {
	local my_bin
	for my_bin in $(find opt/PalmSDK/0.1/bin -maxdepth 1 -type f) ; do
		dosym "/${my_bin}" "/opt/bin/$(basename "${my_bin}")"
	done

	insinto /opt/PalmSDK
	doins -r opt/PalmSDK/0.1
	fperms -R a+x /opt/PalmSDK/0.1/bin

	dosym /opt/PalmSDK/0.1 opt/PalmSDK/Current

	newicon "${FILESDIR}/${PN}-palm-emulator.png" palm-emulator.png
	make_desktop_entry /opt/bin/palm-emulator "Palm Enyo SDK Emulator" palm-emulator Development
}

pkg_postinst() {
	if ! grep 'localhost' /etc/hosts | grep -s -q '127.0.0.1' ; then
		ewarn 'Add "127.0.0.1 localhost" to your /etc/hosts'
	fi
	if ! grep -s -q '127.0.0.1 qemu' /etc/hosts ; then
		ewarn 'Add "127.0.0.1 qemu" to your /etc/hosts'
	fi
	if ! grep -s -q '192.168.2.101 device' /etc/hosts ; then
		ewarn 'Add something like "192.168.2.101 device" to your /etc/hosts'
	fi
	elog 'Do not forget to add your account to the vboxusers group!'
}

