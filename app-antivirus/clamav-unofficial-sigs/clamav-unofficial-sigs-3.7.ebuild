# clamav-unofficial-sigs-3.7.ebuild
#
# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Downloads and installs third-party clamav signatures"
HOMEPAGE="http://sourceforge.net/projects/unofficial-sigs"
SRC_URI="mirror://sourceforge/unofficial-sigs/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="logrotate"

RDEPEND="
        logrotate? ( app-admin/logrotate )
        app-antivirus/clamav"

DEPEND="${RDEPEND}"

src_compile() {
# First, fix the paths contained in the configuration file.	
sed -i  -e '$a\pkg_mgr="emerge"'                                 \
        -e '$a\pkg_rm="emerge -C clamav-unofficial-sigs"'        \
        -e 's~/var/run/clamd.socket~/var/run/clamav/clamd.sock~' \
        -e 's~/var/run/clamd.pid~/var/run/clamav/clamd.pid~'     \
        clamav-unofficial-sigs.conf                              \
    || die "Failed to update paths in the clamav-unofficial-sigs.conf file."

# Now that we've fixed the path of the clamd_socket variable, we need
# to uncomment it in order to avoid the default's use.
sed -i  -e 's/^#clamd_socket/clamd_socket/' clamav-unofficial-sigs.conf \
    || die 'Failed to uncomment the clamd_socket declaration.'

# Finally, change the script's working directory to point to the clamav
# database directory. This should already be writable by the appropriate
# user, and seems like as good a place as any to store the database files
# during download.
#
# We use the Gentoo default here, rather than go digging through the user's
# clamd.conf.
sed -i  -e 's~/usr/unofficial-dbs~/var/lib/clamav~' \
           clamav-unofficial-sigs.conf              \
           || die 'Failed to update the work_dir variable.'
}

src_install() {
        insinto /usr
        dobin clamav-unofficial-sigs.sh
        doman clamav-unofficial-sigs.8
        dodoc README
        dodoc CHANGELOG
        dodoc INSTALL
        dodoc LICENSE

        if use logrotate ; then
                insinto /etc/logrotate.d
                doins clamav-unofficial-sigs.logrotate
        fi

        insinto /etc
        doins clamav-unofficial-sigs.conf
}
pkg_postinst() {
    elog "You will need to set up your /etc/clamav-unofficial-sigs.conf file."
    elog "For details, please see the clamav-unofficial-sigs(8) manual page."
    elog "If you would like to like to schedule the updates (say, nightly)"
    elog "via cron, simply create a symlink to the script in the appropriate"
    elog "directory."
    elog ""
    elog "For example,"
    elog ""
    elog "ln -s /usr/bin/clamav-unofficial-sigs.sh /etc/cron.daily/"
}
