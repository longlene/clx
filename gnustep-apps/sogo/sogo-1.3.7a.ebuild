# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit gnustep-base flag-o-matic

MY_PN="SOGo"

DESCRIPTION="Groupware server built around OpenGroupware.org and the SOPE application server"
HOMEPAGE="http://sogo.opengroupware.org/"
SRC_URI="http://www.sogo.nu/files/downloads/${MY_PN}/Sources/${MY_PN}-${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="postgres mysql logrotate"
DEPEND="gnustep-libs/sope[ldap,mysql?,postgres?]
	!mysql? ( !postgres? ( dev-db/postgresql-base ) )
	dev-libs/libmemcached
	net-nds/openldap"
RDEPEND="${DEPEND}
	logrotate? ( app-admin/logrotate )"

S=${WORKDIR}/${MY_PN}-${PV}

pkg_setup() {
	gnustep-base_pkg_setup
	local myLDFLAGS="$(gnustep-config --variable=LDFLAGS 2>/dev/null)"
	if [ -n "${myLDFLAGS}" ] && (echo "${myLDFLAGS}" | grep -q "\-\-a\(dd\|s\)\-needed" 2>/dev/null); then
		ewarn
		ewarn "You seem to have compiled GNUstep with custom LDFLAGS:"
		for foo in $(gnustep-config --variable=LDFLAGS); do
			ewarn "  "${foo}
		done
		ewarn
		ewarn "SOGo is very sensitive regarding custom LDFLAGS. Especially with:"
		ewarn "  --add-needed"
		ewarn "  --as-needed"
		ewarn
		ewarn "If your SOGo install does not work as expected then please re-emerge SOGo,"
		ewarn "SOPE and your GNUstep (base and make) without any LDFLAGS before filing bugs."
		ewarn
	fi
	append-ldflags -Wl,--no-as-needed
}

src_prepare() {
	gnustep-base_src_prepare
}

src_configure() {
	egnustep_env
	./configure \
		$(use_enable debug) \
		$(use_enable debug strip) \
		$(use_enable ldap ldap-config) \
			|| die "configure failed"
}

src_test() {
	# SOGo tends to break horribly if gnustep-make is build with LDFLAGS such as
	# -Wl,--add-needed or -Wl,--as-needed. So we check here some vital binaries.
	# Check if Appointments.SOGo, Contacts.SOGo, Mailer.SOGo is correctly build/linked
	local myAppointmentsLDD=$(ldd -d "${S}"/SoObjects/Appointments/Appointments.SOGo/Appointments 2>&1 | grep "lib\(OGoContentStore\|NG\(Cards\|ObjWeb\|Mime\|Streams\|Extensions\)\|SOGo\|GDL\(Access\|ContentStore\)\|EOControl\|DOM\|SaxObjC\|XmlRpc\)\.so\." | wc -l)
	local myContactsLDD=$(ldd -d "${S}"/SoObjects/Contacts/Contacts.SOGo/Contacts 2>&1 | grep "lib\(OGoContentStore\|NG\(Cards\|ObjWeb\|Mime\|Streams\|Extensions\)\|SOGo\|GDL\(Access\|ContentStore\)\|EOControl\|DOM\|SaxObjC\|XmlRpc\)\.so\." | wc -l)
	local myMailerLDD=$(ldd -d "${S}"/SoObjects/Mailer/Mailer.SOGo/Mailer 2>&1 | grep "lib\(OGoContentStore\|NG\(Cards\|ObjWeb\|Mime\|Streams\|Extensions\)\|SOGo\|GDL\(Access\|ContentStore\)\|EOControl\|DOM\|SaxObjC\|XmlRpc\)\.so\." | wc -l)
	if [ -z "${myAppointmentsLDD}" -o -z "${myContactsLDD}" -o -z "${myMailerLDD}" -o "${myAppointmentsLDD}" != "13" -o "${myContactsLDD}" != "13" -o "${myMailerLDD}" != "13" ]; then
		ewarn
		ewarn "This SOGo installtion is not correctly build. Probably you are using"
		ewarn "LDFLAGS to build SOGo that are not correctly handled in SOGo or you"
		ewarn "have emerged gnustep-base/gnustep-make with LDFLAGS which are"
		ewarn "preventing SOGo to link the needed libraries into it's own binaries."
		ewarn "Please remerge gnustep-base/gnustep-make and/or SOGo with empty LDFLAGS."
		ewarn
		die "SOGo build is not complete (Appointments.SOGo, Contacts.SOGo, Mailer.SOGo)"
	fi
	# We could do the same for AdministrationUI.SOGo, CommonUI.SOGo, ContactsUI.SOGo,
	# MailPartViewers.SOGo, MailerUI.SOGo, MainUI.SOGo, SOGoElements.wox and SchedulerUI.SOGo
	# but if Appointments.SOGo, Contacts.SOGo and Mailer.SOGo are build correctly then the
	# chance that the others are build/linked correctly is pretty high. So we don't test again.
}

src_install() {
	gnustep-base_src_install
	newinitd "${FILESDIR}"/sogod.initd sogod \
		|| die "init.d script installation failed"
	newconfd "${FILESDIR}"/sogod.confd sogod \
		|| die "conf.d script installation failed"
	diropts -m 0770 -o sogo -g root
	dodir /var/log/sogo
	dodir /var/run/sogod

	if use logrotate; then
		insopts -m644 -o root -g root
		insinto /etc/logrotate.d
		newins Scripts/logrotate SOGo || die "Failed to install logrotate.d file"
	fi
	newdoc Apache/SOGo.conf SOGo-Apache.conf
}

pkg_preinst() {
	enewuser sogo -1 /bin/bash /var/lib/sogo
}

pkg_postinst() {
	gnustep-base_pkg_postinst
	elog
	elog "Now follow the steps from the SOGo documentation:"
	elog "http://www.inverse.ca/contributions/sogo/documentation.html#c803"
	elog "The sogo user home directory is /var/lib/sogo"
	elog
	elog "Then you can start/stop sogo with /etc/init.d/sogod"
	elog
	elog "If you plan to use SOGo with Apache then please have a look at the"
	elog "'SOGo-Apache.conf' included in the documentation directory of this"
	elog "SOGo installation and don't forget to add '-D PROXY' to your"
	elog "APACHE2_OPTS."
	elog
}
