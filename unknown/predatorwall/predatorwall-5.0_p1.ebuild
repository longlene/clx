# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Desktop oriented firewall system written by predatorfreak"
HOMEPAGE="http://www.dcaf-security.org"
SRC_URI="mirror://sourceforge/predatorwall/${PN}-5.0-r1.tar"
S="${WORKDIR}/${PN}-5.0-r1"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="net-firewall/iptables"

src_install() {
  dodir /usr/share/predatorwall/
  dodir /etc/predatorwall/
  insinto /usr/share/predatorwall/
  doins ${S}/about ${S}/dev-stuff/changelog 
  insinto /etc/predatorwall/
  doins ${S}/config/predwall.conf ${S}/config/sysctl.conf
  exeinto /usr/share/predatorwall/
  doexe ${S}/start.sh ${S}/flush.sh ${S}/scripts/set-rules
  # Note: Do this incase they remove predatorwall and need a flush script
  exeinto /etc/predatorwall/
  doexe ${S}/flush.sh
}

pkg_postinst() {
  einfo "Please run /usr/share/predatorwall/set-rules gentoo"
  einfo "So that the iptables are set and saved"
  einfo ""
  einfo "Also, a sample sysctl.conf with extra security"
  einfo "tunings has been placed in /etc/predatorwall/."
}

pkg_postrm() {
  einfo "If you do not plan on reinstalling predatorwall"
  einfo "please run /etc/predatorwall/flush.sh and then run"
  einfo "/etc/init.d/iptables save to clear the saved "
  einfo "iptables rules."
}

