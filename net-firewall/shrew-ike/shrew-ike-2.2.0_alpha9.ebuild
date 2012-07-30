# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# :TODO:
# - Add init.d script to start iked on startup.
# - Add menu entries for the "-qt" applications, if installed.
#

# I don't know what this means, but it was in an ebuild
# I was borrowing from.
EAPI="2" 


CMAKE_MIN_VERSION="2.4"
CMAKE_IN_SOURCE_BUILD=1 # Seems to fail with out-of-source building.

inherit cmake-utils linux-info

DESCRIPTION="Internet Key exchange daemon and IPsec VPN client"
HOMEPAGE="http://www.shrew.net/"

# They seem to have their own license.  I *think* it's basically an
# MIT license, as it just seems to be worried that you keep their
# copyright message at the top, but I'm not lawyer.
LICENSE="shrew"
KEYWORDS="~amd64" # Should be empty?
SLOT="0"

# Shrew's FTP server filename format looks like:
#
# ike-2.1.6-release.tbz2 for stable builds
# ike-3.1.1-alpha-3.tbz2 for alpha builds
#
# There's likely a cleaner way to do this, but...
# Attempt to detect when there's an "_alpha" in the
# ebuild name, and if so pull out the alpha # and
# build the tar file name.
#
# If there's not an alpha, stick on "-release".
#
# This doesn't cover all the other portage
# versioning (beta, r1, pre2, etc), but it's a
# start.
MY_PV=${PV}
WITHOUT_ALPHA=${MY_PV/_alpha} # removes alpha
if [ ${#MY_PV} != ${#WITHOUT_ALPHA} ] ; then
	# Lengths are different, this must be an alpha
	# release.  Fix up the format so it's dashes
	# and there's one between "alpha" and the number
	ALPHA_TAIL=${MY_PV/#*_alpha}
	MY_PV=${MY_PV/_alpha*}-alpha-${ALPHA_TAIL}
else
	MY_PV=${PV}-release
fi

SRC_URI="http://www.shrew.net/download/ike/ike-${MY_PV}.tbz2"

IUSE="qt4 +nat ldap"

# Also depends on an implicit pthreads
RDEPEND="sys-devel/flex
	dev-libs/libedit
	>=sys-devel/bison-2.3
	>=dev-libs/openssl-0.9
	ldap? ( >=net-nds/openldap-2.0 )
	qt4? ( >=x11-libs/qt-core-4.2 >=x11-libs/qt-gui-4.2 )"
DEPEND="${RDEPEND}
	>=sys-kernel/linux-headers-2.6.19"
# ipsec-tools has 2.6.30 as the required header version, but I don't know
# why it requires that instead of the 2.6.19 referenced in the stolen
# (from ipsec-tools) code in pkg_setup() below.


S="${WORKDIR}/ike"

pkg_setup() {
	# All this checking is stolen from ipsec-tools....
	local poor_kernel=1
	get_version
	if kernel_is 2 6 ; then
		if test "${KV_PATCH}" -ge 19 ; then
			# Just for kernel >= 2.6.19
			poor_kernel=0
			einfo "Checking for suitable kernel configuration (Networking | Networking support | Networking options"

			if use nat ; then
				CONFIG_CHECK="${CONFIG_CHECK} ~NETFILTER_XT_MATCH_POLICY"
				export
				WARNING_NETFILTER_XT_MATCH_POLICY="CONFIG_NETFILTER_XT_MATCH_POLICY - NAT support may fail weirdly unless you enable this option in your kernel"
			fi

			for i in XFRM_USER NET_KEY ; do 
				CONFIG_CHECK="${CONFIG_CHECK} ~${i}"
				eval "export WARNING_${i}='CONFIG_${i} - No tunnels will be available at all'"
			done

			for i in INET_IPCOMP INET_AH INET_ESP \
				INET_XFRM_MODE_TRANSPORT \
				INET_XFRM_MODE_TUNNEL \
				INET_XFRM_MODE_BEET ; do
				CONFIG_CHECK="${CONFIG_CHECK} ~${i}"
				eval "export WARNING_${i}='CONFIG_${i} - IPv4 tunnels will not be available'"
			done

			for i in INET6_IPCOMP INET6_AH INET6_ESP \
				INET6_XFRM_MODE_TRANSPORT \
				INET6_XFRM_MODE_TUNNEL \
				INET6_XFRM_MODE_BEET ; do
				CONFIG_CHECK="${CONFIG_CHECK} ~${i}"
				eval "export WARNING_${i}='CONFIG_${i} - IPv6 tunnels will not be available'"
			done

			CONFIG_CHECK="${CONFIG_CHECK} ~CRYPTO_NULL"
			export WARNING_CRYPTO_NULL="CONFIG_CRYPTO_NULL - Unencrypted tunnels will not be available"

			export CONFIG_CHECK

			check_extra_config
		fi
	fi

	if test poor_kernel -eq 1 ; then
		eerror "You must have a kernel >=2.6.19 to run ${PN}."
		eerror "Building now, assuming that you will run a different kernel."
	fi
}


src_configure() {
	# The first set of options are what I'd consider standard and
	# a good thing to make explicit if not required.  However, rather
	# than hard-code them, it might be better if there were variables
	# to read these "defaults" from.
	mycmakeargs="${mycmakeargs}
		-DETCDIR=/etc/ -DMANDIR=/usr/share/man/ -DKRNINC=/usr/share/linux/
		$(cmake-utils_use nat NATT)
		$(cmake-utils_use ldap LDAP)
		$(cmake-utils_use qt4 QTGUI)"

	cmake-utils_src_configure
}

pkg_preinst() {
	# Use the default .conf file to we're good to go out-of-the-box.
	mv ${D}/etc/iked.conf{.sample,}
}
