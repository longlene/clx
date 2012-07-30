# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/usbirboy/usbirboy-0.2.1-r1.ebuild,v 1.15 2008/05/16 20:49:40 zzam Exp $

inherit linux-mod eutils git

DESCRIPTION="modules to turn off nvidia card for asus laptops"
HOMEPAGE="https://github.com/awilliam/asus-switcheroo"
EGIT_REPO_URI="git://github.com/awilliam/asus-switcheroo.git"
#SRC_URI="${PN}.tgz"

SLOT="0"
KEYWORDS="amd64 x86"
LICENSE="GPL-2"
IUSE="
video_cards_intel
video_cards_nouveau
video_cards_nvidia"

DEPEND="sys-power/pm-utils"
RDEPEND="${DEPEND}"

MODULE_NAMES="asus-switcheroo(extra/asus-switcheroo:${S}) " 
use video_cards_intel && MODULE_NAMES="${MODULE_NAMES}  i915-jprobe(extra/asus-switcheroo:${S})"
use video_cards_nouveau && MODULE_NAMES="${MODULE_NAMES}  nouveau-jprobe(extra/asus-switcheroo:${S})"

BUILD_TARGETS="default"

src_unpack() {
	git_src_unpack
}

pkg_setup() {
	linux-mod_pkg_setup || die
}


src_compile(){
	linux-mod_src_compile || die

}

src_install(){
	linux-mod_src_install || die
	exeinto /etc/pm/sleep.d
	doexe  asus-switcheroo-pm || die
	

	if use video_cards_nvidia ; then
		insinto /etc/modprobe.d 
		newins "${FILESDIR}"/asus-switcheroo.conf-nvidia asus-switcheroo.conf 

		newinitd "${FILESDIR}"/switcheroo.rc switcheroo 

		exeinto /opt/bin
		newexe "${FILESDIR}"/switcheroo-to-nvidia.sh switcheroo-to-nvidia

		insinto /etc/X11
		doins "${FILESDIR}"/xorg.conf-nvidia 

	elif use video_cards_nouveau ; then
		insinto /etc/modprobe.d 
		newins asus-switcheroo.conf-modprobe.d asus-switcheroo.conf 
	fi
}


pkg_postinst() {
	elog "If debugfs isn't automatically mounted for you,"
	elog " add this to your /etc/fstab:"
	elog ""
	elog " debugfs /sys/kernel/debug debugfs defaults 0 0"
	elog ""
	elog "Remember to add asus_switcheroo to /etc/modules.autoload.d/kernel-2.*"	
	elog ""
	elog "To turn off the discrete card on boot, put"
	elog ""
	elog 'if [ -f "/sys/kernel/debug/vgaswitcheroo/switch" ] ; then '
        elog "   /bin/echo OFF > /sys/kernel/debug/vgaswitcheroo/switch"
        elog "fi"
	elog ""
	elog "in /etc/conf.d/local.start"


	if use video_cards_nvidia ; then
		elog ""
		elog "This ebuild has installed a system for switching"
		elog "to the nVidia card and driver. This system requires"
		elog "that you use the supplied xorg.conf for nVidia"
		elog "and no xorg.conf for the intel card. The switching"
		elog "is handled by the command switcheroo-to-nvidia" 
		elog "and the switcheroo init.d script."
	fi

	
	linux-mod_pkg_postinst
}

pkg_postrm() {
	linux-mod_pkg_postrm
}

