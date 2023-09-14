# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit java-pkg-2 java-ant-2 java-utils-2 games

DESCRIPTION="a simple MMORPG"
HOMEPAGE="http://arianne.sourceforge.net"

SRC_URI="mirror://sourceforge/arianne/${P}-src.tar.gz"
LICENSE="GPL-2 BSD"
SLOT="0"
KEYWORDS="~x86"

IUSE="source doc server"

RDEPEND=">=virtual/jre-1.5
	>=games-engines/marauroa-1.32
	server? (
		>=dev-java/jython-2.1
		>=dev-java/groovy-1.0_beta4-r1
		>=dev-java/simple-3.1.3
		>=dev-java/jdbc-mysql-3.0.0
		>=dev-db/mysql-4.0.0
		app-admin/pwgen
	)
	doc? (
		>=dev-java/jython-2.1
		>=dev-java/groovy-1.0_beta4-r2
		>=dev-java/log4j-1.2.8
		>=dev-java/jdbc-mysql-3.0.0
	)
	>=dev-java/log4j-1.2.8
	>=dev-java/jnlp-bin-1.2"

DEPEND=">=virtual/jdk-1.5
	${RDEPEND}
	>=dev-java/ant-1.6.2"

src_unpack() {
	unpack ${A}
	cd ${S}
	mkdir -p libs || die "Unable to create libs dir"
	cd libs
	java-pkg_jar-from marauroa
	java-pkg_jar-from log4j
	java-pkg_jar-from jnlp-bin
	if use server || use doc ; then
		java-pkg_jar-from jython
		java-pkg_jar-from simple
		java-pkg_jar-from groovy-1
		java-pkg_jar-from jdbc-mysql
	fi
	cd ${S}
	epatch ${FILESDIR}/build.xml.patch
}

src_compile() {
	eant clean client_build $(use server && echo server_build) $(use_doc docs)
}

src_install() {
	java-pkg_dojar libs/marauroa.jar libs/log4j.jar build/lib/stendhal-data-${PV}.jar build/lib/stendhal-sound-data-${PV}.jar
	java-pkg_newjar build/lib/stendhal-${PV}.jar
	java-pkg_dolauncher "${PN}" -into "${GAMES_PREFIX}" --jar "${PN}.jar"

	use source && java-pkg_dosrc src/*
	use doc && java-pkg_dohtml -r javadocs/*
	dodoc LICENSE AUTHORS README
	if use server || use doc ; then
		java-pkg_newjar build/lib/stendhal-server-${PV}.jar ${PN}-server.jar
		java-pkg_newjar build/lib/stendhal-xmlconf-${PV}.jar ${PN}-xmlconf.jar
		java-pkg_newjar build/lib/stendhal-maps-${PV}.jar ${PN}-maps.jar
		java-pkg_dolauncher "${PN}-server" --main marauroa.server.marauroad --pkg_args "-c /etc/stendhal.ini -l"
		java-pkg_dolauncher "${PN}-useradd" --main games.stendhal.server.stendhalcreateaccount --pkg_args "-i /etc/stendhal.ini"
	fi
}

pkg_postinst() {
	games_pkg_postinst
	if use server ; then
		einfo
		einfo "You might want to run:"
		einfo "\"emerge --config =${CATEGORY}/${PF}\""
		einfo "if this is a new install."
		einfo
	fi
}

pkg_config() {
	! use server && exit 0
	einfo "This will configure stendhal-server"

	einfo "Enter the hostname/address of the mysql server [localhost]:"
	local my_host=""
	read -p "    >" my_host;
	[[ -z ${my_host} ]] && my_host=localhost

	einfo "Enter the name of a mysql user with 'CREATE DATABASE' rights [root]:"
	local my_user=""
	read -p "    >" my_user;
	[[ -z ${my_user} ]] && my_user=root

	einfo "Enter the password for the selected user:"
	local my_pass=""
	read -sp "    >" my_pass; echo

	local MYSQL="mysql -u ${my_user} -h ${my_host} --password=${my_pass} --connect_timeout=4"

	einfo "Testing mysql connection"
	echo "SHOW DATABASES;" | ${MYSQL} > /dev/null || exit "Unable to connect to DB"

	if echo "SHOW DATABASES;" | ${MYSQL} | grep -q gentoo_stendhal; then
		ewarn "Stendhal appears to be configured allredy"
		einfo "Do you want to delete the old configuration and user accounts? (yes/no)[no]:"
		read -p "    >" my_res
		[[ "${my_res}" != "yes" ]] && exit 0
		echo "DROP DATABASE gentoo_stendhal;" | ${MYSQL} > /dev/null || die "Unable to delete old DB"
	fi

	echo "CREATE DATABASE gentoo_stendhal;" | ${MYSQL} > /dev/null || die "Unable to create DB"

	local pwd=`pwgen 20 1` || die "Unable to generate password"
	local x=""
	[[ "${my_host}" == "localhost" ]] && x="@localhost"

	echo "GRANT ALL ON gentoo_stendhal.* TO stendhal_user${x} IDENTIFIED BY '${pwd}';" | ${MYSQL} > /dev/null || die "Unable to create DB user"

	einfo "Setting up stendhal.. this will take some time"
	echo "/etc/stendhal.ini
gentoo_stendhal
${my_host}
stendhal_user
${pwd}
32160
stendhal
300
/var/log/
/var/log/
512" | java -cp /usr/share/marauroa/lib/marauroa.jar marauroa.server.generateini > /dev/null || die "Unable to setup stendhal"
	einfo "Done"
	einfo "To add a user to stendhal:"
	einfo "     stendhal-useradd -u <username> -p <password> -c <charctername> -e <email>"
}


