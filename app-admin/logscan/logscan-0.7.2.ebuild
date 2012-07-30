# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Logscan summarizes you logfiles in a quick, effective, flexible and standardised way"
HOMEPAGE="http://sourceforge.net/projects/logscan/"
SRC_URI="mirror://sourceforge/logscan/${P}.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="x86"

DEPEND="sys-apps/gawk"

src_compile() {
	# Nothing to do
	einfo "Nothing to compile"
}

src_install() {
	dodir /etc/logscan.d/scripts
	dodir /etc/logscan.d/logs
	exeinto /etc/cron.daily
	newexe logscan.sh 00logscan.sh
	insinto /etc/logscan.d/scripts
	doins logscan.d/scripts/zzzzzzzz.awk
	dosym /var/log/messages /etc/logscan.d/logs/messages
	dodoc README CHANGELOG DESCRIPTION TODO
}

