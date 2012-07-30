# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg-2 

DESCRIPTION="Java based Least Cost Router for Germany"
HOMEPAGE="http://www.bongosoft.de"

MY_P="BongoSurfer-${PV}-src"
S="${WORKDIR}/${MY_P}"

SRC_URI="http://www.bongosoft.de/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="${DEPEND}
	>=virtual/jre-1.5
	>=dev-java/jdictrayapi-0.9.1-r2
	>=dev-java/jgoodies-forms-1.1.0
	>=dev-java/jgoodies-looks-2.1.4
	"
RDEPEND="net-dialup/ppp net-misc/ntp"

BONGO_INST="/usr/share/${PN}"
BONGO_LIBS="jdictrayapi,jgoodies-forms,jgoodies-looks-2.0"
BONGO_MAIN="de.bongosoft.${PN}.Main"

src_unpack() {
	unpack ${A}
	cd "${S}/skripte/modem"
	epatch "${FILESDIR}/modem.patch" 
}

src_compile() {
	cd "src"
	echo "Main-Class: ${BONGO_MAIN}" > manifest.mc
	ejavac -classpath $(java-pkg_getjars ${BONGO_LIBS}):. `echo ${BONGO_MAIN} | tr . /`.java
	find . -name "*.class" \
		-or -path "*bilder/*" \
		-or -path "*dateien/*" \
		-or -path "*text/*" \
	| xargs jar -cfm ${PN}.jar manifest.mc || die "failed to create jar"
}

src_install() {
	pkg_args="-Duser.timezone=$(awk -F = '/TIMEZONE/ {print $2}' \
		/etc/conf.d/clock | tr -d '"')"

	java-pkg_dojar src/${PN}.jar
	java-pkg_dolauncher ${PN} \
		--main "${BONGO_MAIN}" \
		--pkg_args "${pkg_args}"

	fowners root:dialout /usr/bin/${PN}
	fperms 750 /usr/bin/${PN}

	domenu apps/${PN}.desktop

	insinto /etc/${PN}
	doins config/*

	dodoc doc/*
	docinto pppoe; dodoc doc/pppoe/*
	docinto skripte; dodoc doc/skripte/*
	docinto pppoe/mtu; dodoc doc/pppoe/mtu/*

	doicon icons/${PN}.png 

	doman man/*.1

	insinto /etc/ppp/peers/bongosurfer
	doins peers/*

	dosbin skripte/sbin/bongosetup

	for dir in capi i4l modem time; do
		exeinto ${BONGO_INST}/skripte/${dir}
		doexe skripte/${dir}/*.sh
	done
}

pkg_postinst() {
	echo
	elog "Bongosurfer is using pppd's setuid facility by default."
	elog "If you want to make use of sudo instead, call bongosetup as root."
	echo
	ewarn "Anyway, you have to if you want to set the clock after connection."
	echo
}
