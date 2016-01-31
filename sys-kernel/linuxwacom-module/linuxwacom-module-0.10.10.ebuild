# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="4"
inherit autotools eutils linux-mod toolchain-funcs

# http://who-t.blogspot.com/2010/09/wacom-support-in-linux.html
MY_PN="input-wacom"
DESCRIPTION="Kernel driver for Wacom tablets and drawing devices"
HOMEPAGE="http://linuxwacom.sourceforge.net/"
SRC_URI="mirror://sourceforge/linuxwacom/xf86-input-wacom/${MY_PN}/${MY_PN}-${PV}.tar.bz2"

IUSE="usb"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~x86"

DEPEND="dev-util/pkgconfig
	sys-fs/udev
	usb? ( >=sys-kernel/linux-headers-2.6 )"

RDEPEND="sys-fs/udev"

S=${WORKDIR}/${MY_PN}-${PV}

MODULE_NAMES="wacom(input:${S}:${S})"
BUILD_TARGETS="all"

wacom_check() {
	einfo "Checking wacom module not built in kernel"

	if $(linux_chkconfig_present TABLET_USB_WACOM); then
		eerror "Please, disable wacom module in the kernel:"
		eerror
		eerror " Device Drivers"
		eerror "    Input device support"
		eerror "        Tablets"
		eerror "            <> Wacom Intuos/Graphire tablet support (USB)"
		eerror
		eerror '(in the "USB support" page it is suggested to include also:'
		eerror "EHCI , OHCI , USB Human Interface Device+HID input layer)"
		eerror
		eerror "Then recompile kernel."
		die "Wacom module already built in kernel!"
	fi
}

pkg_pretend() {
	linux-mod_pkg_setup
	if [ $(kernel_is -lt 2 6 30) ]; then
		eerror "Inadequate kernel detected. At least Linux 2.6.30 is needed."
		die "wrong kernel"
	fi
	wacom_check
}

src_prepare() {
	if [[ $(gcc-major-version) < 4 || $(gcc-minor-version) < 2 ]]; then
		die "Versions of linuxwacom >= 0.7.9 require gcc >= 4.2 to compile."
	fi

	sed -i s:"\(^#include <linux/ctype.h>\)":"\1\n#include <linux/delay.h>":g \
		2.6.30/wacom_w8001.c 2.6.36/wacom_w8001.c

	mkdir src
	eautoreconf
}

# TODO: Avoid build of hal (but actually upstream is working on separation of
# modules from linuxwacom so this is really low priority).
src_configure() {
	unset ARCH
	econf \
		--enable-wacom \
		--with-kernel=${KV_OUT_DIR} \
		--disable-dependency-tracking \
		--without-x \
		--disable-xserver64 \
		--without-xlib \
		--without-xorg-sdk \
		--without-tcl \
		--without-tk \
		$(printf -- "--disable-%s " libwacom{cfg,xi} {wac,xi}dump xsetwacom wacomxrrd) \
		|| die "configure failed"
}

src_install() {
	# Inelegant attempt to work around a nasty build system
	if [ $(kernel_is -ge 2 6 36) ]; then
		cp 2.6.36/wacom.{o,ko} .
	else
		cp 2.6.30/wacom.{o,ko} .
	fi

	linux-mod_src_install

	dodoc AUTHORS ChangeLog
}

pkg_postinst() {
	linux-mod_pkg_postinst
	ewarn "Please remove any HAL .FDI files you may"
	ewarn "previously have installed for linuxwacom."
}
