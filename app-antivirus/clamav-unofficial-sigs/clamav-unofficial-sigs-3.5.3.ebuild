# Copyright 1999-2009clamav-unofficial-sigs-3.5.3.ebuild Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Downloads and installs additional clamav signatures"
HOMEPAGE="http://sourceforge.net/projects/unofficial-sigs"
SRC_URI="mirror://sourceforge/unofficial-sigs/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="logrotate"

RDEPEND="
        logrotate? ( app-admin/logrotate )
        virtual/cron
        app-antivirus/clamav"

DEPEND="${RDEPEND}"

src_compile() {
# There is no make file. However, the cron script assumes /usr/local.
# It also assumes a cron.d environment. vixie-cron cannot handle this.
sed -i  -e 's~/usr/local/bin~/usr/bin~' \
        -e 's~/usr/local/etc~/etc~' \
        -e 's/45 \* \* \* \* root //' \
        clamav-unofficial-sigs-cron || die "sed failed"
sed -i  -e '$a\pkg_mgr="emerge"' \
        -e '$a\pkg_rm="emerge -C clamav-unofficial-sigs"'        \
        -e 's~/var/run/clamd.socket~/var/run/clamav/clamd.sock~' \
        -e 's~/var/run/clamd.pid~/var/run/clamav/clamd.pid~' \
        clamav-unofficial-sigs.conf || die "sed failed"
}

src_install() {
        insinto /usr
        dobin clamav-unofficial-sigs.sh
        doman clamav-unofficial-sigs.8
        dodoc README
        dodoc CHANGELOG
        if use logrotate ; then
                insinto /etc/logrotate.d
                doins clamav-unofficial-sigs.logrotate
        fi

        exeinto /etc/cron.daily
        doexe clamav-unofficial-sigs-cron

        insinto /etc
        doins clamav-unofficial-sigs.conf

        keepdir /usr/unofficial-sigs
}
pkg_postinst() {
    elog "You will need to set up your /etc/clamav-unofficial-sigs.conf
file."
    elog "For details, please see the clamav-unofficial-sigs(8) manual
page."
    chown clamav:clamav /usr/unofficial-sigs
}