# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/opennebula/opennebula-2.0_beta1-r1.ebuild,v 1.2 2010/08/16 18:33:00 dev-zero Exp $

EAPI=3
USE_RUBY="ruby18"

inherit eutils multilib ruby-ng

MY_P="opennebula-${PV/_/-}"
DOWNLOAD_ID="339"

DESCRIPTION="OpenNebula Virtual Infrastructure Engine"
HOMEPAGE="http://www.opennebula.org/"
SRC_URI="http://dev.opennebula.org/attachments/download/${DOWNLOAD_ID}/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qemu mysql sqlite xen"

RDEPEND=">=dev-libs/xmlrpc-c-1.18.02[abyss,cxx,threads]
	dev-lang/ruby:1.8
	mysql? ( dev-db/mysql )
	dev-db/sqlite:3[threadsafe]
	net-misc/openssh
	qemu? ( app-emulation/libvirt[libvirtd,qemu] )
	xen? ( app-emulation/xen-tools )"
DEPEND="${RDEPEND}
	>=dev-util/scons-1.2.0-r1"

ruby_add_rdepend "dev-ruby/nokogiri
	dev-ruby/crack"

# make sure no eclass is running tests
RESTRICT="test"

S="${WORKDIR}/${MY_P}"

ONEUSER="oneadmin"
ONEGROUP="cloud"

pkg_setup () {
	enewgroup ${ONEGROUP}
	enewuser ${ONEUSER} -1 /bin/bash /var/lib/one ${ONEGROUP}
}

src_unpack() {
	default
}

src_prepare() {
	sed -i -e 's|chmod|true|' install.sh || die "sed failed"
}

src_configure() {
	:
}

src_compile() {

	local myconf
	use mysql && myconf+="mysql=yes " || myconf+="mysql=no "
	scons \
		${myconf} \
		$(sed -r 's/.*(-j\s*|--jobs=)([0-9]+).*/-j\2/' <<< ${MAKEOPTS}) \
		|| die "building ${PN} failed"
}

src_install() {
	DESTDIR=${T} ./install.sh || die "install failed"

	cd "${T}"

	# fixing paths
	sed -i \
		-e 's|//share/hooks|/usr/share/one/hooks|' \
		etc/oned.conf || die "sed failed"

	# installing things for real
	dobin bin/*

	dodir /usr/$(get_libdir)/one
	# we have to preserve the executable bits
	cp -a lib/* "${D}/usr/$(get_libdir)/one/" || die "copying lib files failed"

	insinto /usr/share/doc/${PF}
	doins -r share/examples

	dodir /usr/share/one
	# we have to preserve the executable bits
	cp -a share/hooks "${D}/usr/share/one" || die "copying hooks failed"

	keepdir /var/lock/one
	keepdir /var/lib/one
	keepdir /var/log/one
	keepdir /var/run/one
	keepdir /var/images

	fowners ${ONEUSER}:${ONEGROUP} /var/{lock,lib,log,run}/one /var/images
	fperms 3770 /var/images

	doenvd "${FILESDIR}/99one"

	newinitd "${FILESDIR}/opennebula.initd" opennebula
	newconfd "${FILESDIR}/opennebula.confd" opennebula

	insinto /etc/one
	insopts -m 0640
	doins -r etc/*
	doins "${FILESDIR}/one_auth"
	fowners -R root:${ONEGROUP} /etc/one
	fowners ${ONEUSER}:${ONEGROUP} /etc/one/one_auth
}

pkg_postinst() {
	local onedir="${EROOT}var/lib/one"
	if [ ! -d "${onedir}/.ssh" ] ; then
		einfo "Generating ssh-key..."
		umask 0027 || die "setting umask failed"
		mkdir "${onedir}/.ssh" || die "creating ssh directory failed"
		ssh-keygen -q -t dsa -N "" -f "${onedir}/.ssh/id_dsa" || die "ssh-keygen failed"
		cat > "${onedir}/.ssh/config" <<EOF
UserKnownHostsFile /dev/null
Host *
    StrictHostKeyChecking no
EOF
		cat "${onedir}/.ssh/id_dsa.pub"  >> "${onedir}/.ssh/authorized_keys" || die "adding key failed"
		chown -R ${ONEUSER}:${ONEGROUP} "${onedir}/.ssh" || die "changing owner failed"
	fi

	if use qemu ; then
		elog "Make sure that the user ${ONEUSER} has access to the libvirt control socket"
		elog "  /var/run/libvirt/libvirt-sock"
		elog "You can easily check this by executing the following command as ${ONEUSER} user"
		elog "  virsh -c qemu:///system nodeinfo"
		elog "If not using using policykit in libvirt, the file you should take a look at is:"
		elog "  /etc/libvirt/libvirtd.conf (look for the unix_sock_*_perms parameters)"
		elog "Failure to do so may lead to nodes hanging in PENDING state forever without further notice."
		echo ""
		elog "Should a node hang in PENDING state even with correct permissions, try the following to get more information."
		elog "In /tmp/one-im execute the following command for the biggest one_im-* file:"
		elog "  ruby -wd one_im-???"
		echo ""
		elog "OpenNebula doesn't allow you to specify the disc format."
		elog "Unfortunately the default in libvirt is not to guess and"
		elog "it therefores assumes a 'raw' format when using qemu/kvm."
		elog "Set 'allow_disk_format_probing = 0' in /etc/libvirt/qemu.conf"
		elog "to work around this until OpenNebula fixes it."
	fi
}
