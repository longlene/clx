# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils linux-mod

DESCRIPTION="The ARToolKit library"
HOMEPAGE="http://www.hitl.washington.edu/artoolkit/"
SRC_URI="mirror://sourceforge/artoolkit/${P}.tgz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug jpeg gstreamer dv ieee1394 doc examples utils"
#openVRML"
RDEPEND=""
DEPEND="virtual/glut
	|| ( x11-drivers/nvidia-drivers x11-drivers/ati-drivers )
	jpeg? ( media-libs/jpeg )
	gstreamer? (
	jpeg? ( media-plugins/gst-plugins-jpeg )
	dv? ( media-plugins/gst-plugins-dv
		media-plugins/gst-plugins-raw1394 )
	ieee1394? ( media-plugins/gst-plugins-raw1394 )
	!ieee1394? ( media-plugins/gst-plugins-v4l
			media-plugins/gst-plugins-v4l2 )
	>media-libs/gstreamer-0.8
	>media-libs/gst-plugins-base-0.8
	)"
#openVRML? ( >=media-libs/openVRML-0.14.3 )"

check_v4l() {
	ebegin "Checking for V4L kernel Support"
	linux_chkconfig_present VIDEO_V4L1_COMPAT && linux_chkconfig_present VIDEO_V4L2
	eend $?
	if [[ $? -ne 0 ]] ; then
		eerror "no v4l support has been found"
		eerror "in the kernel, please recompile"
		eerror "the kernel with v4l support"
		die "v4l support not detected!"
	fi
}

check_ieee1394() {

	local msg
	if use dv; then
		msg="Checking for ieee1934 and dv kernel Support"
	else
		msg="Checking for ieee1934 kernel Support"
	fi
	ebegin ${msg}
	linux_chkconfig_present IEEE1394 && linux_chkconfig_present IEEE1394_OHCI1394 && linux_chkconfig_present IEEE1394_VIDEO1394 && linux_chkconfig_present FIREWIRE
	eend $?
	if [[ $? -ne 0 ]] ; then
		eerror "no ieee1394 support has been found"
		eerror "in the kernel, please recompile"
		eerror "the kernel with ieee1934 support"
		die "ieee1394 support not detected!"
	elif use dv; then
		linux_chkconfig_present IEEE1394_DV1394
		if [[ $? -ne 0 ]] ; then {
			eerror "no ieee1394 support has been found"
			eerror "in the kernel, please recompile"
			eerror "the kernel with ieee1934_dv1394 support"
			die "ieee1394 dv support not detected!"
		}
		fi
	fi
}

src_unpack() {
	local old
	old=$((${#S}-${#P}+${#PN}))
	unpack ${A}
	mv "${S:0:${old}}" "${S}"
	cd "${S}"
	mv Configure configure
}

pkg_setup() {
	linux-mod_pkg_setup
	if use ieee1394 ; then
		check_ieee1394
	else
		check_v4l
	fi
}

src_compile() {
	local method
	if use gstreamer; then
		method="5"
		if use dv; then
			elog "Installing with Gstreamer framework with dv and ieee1394 support"
		elif use ieee1394; then
			elog "Installing with Gstreamer framework ieee1394 support."
		elif use jpeg; then
			elog "Installing with Gstreamer framework V4L and jpeg support."
		else
		elog "Installing with Gstreamer framework V4L support."
		fi
	elif use ieee1394; then
		if use dv; then
			method="3"
			elog "Installing with ieee1394 and dv support, ignoring jpeg flag."
		else
			method="4"
			elog "Installing with ieee1394 support, ignoring dv and jpeg flags."
		fi
	else
		if use jpeg; then
			method="2"
			elog "Installing with Video4Linux + JPEG support, ignoring dv flag."
			cp lib/SRC/VideoLinuxV4L/jpegtorgb.h include/AR
		else
			method="1"
			elog "Installing with Video4Linux support."
		fi
	fi
	{
	{
	sleep 2
	echo "${method}"
	sleep 2
	if [ method="1" ] || [ method="2" ]; then
		if linux_chkconfig_present 64BIT; then
			echo n
		else
			echo y
		fi
	fi
	sleep 2
	if use debug; then
		echo "y"
	else
		echo "n"
	fi
	sleep 2
	echo "y"
	} | econf --prefix=/usr
	}  || die "Configuration failed!"
	emake || die "make failed"
}

src_install() {
	if use doc; then
		dodir /usr/share/doc/${PN}
		dohtml -r doc/*
	fi
	if use utils; then
		dodir /usr/share/apps/${PN}
		insinto /usr/share/apps/${PN}
		doins bin/calib* bin/graphicsTest bin/mk_patt bin/videoTest
	fi
	rm bin/calib* bin/graphicsTest bin/mk_patt bin/videoTest
	if use examples; then
		dodir /usr/share/doc/${PN}/examples
		insinto /usr/share/doc/${PN}/examples
		doins bin/*
	fi
	dodir /usr/include/AR
	insinto /usr/include/AR
	doins include/AR/*
	dodir /usr/include/AR/sys
	insinto /usr/include/AR/sys
	doins include/AR/sys/*
	insinto /usr/lib
	doins lib/*.a
}
