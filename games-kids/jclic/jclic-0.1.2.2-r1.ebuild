# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

inherit java-pkg-2 games

DESCRIPTION="Clic is a set of free software for the development of multimedia educational activities"
SRC_URI="http://clic.xtec.net/dist/jclic/${P}.zip
	tomcat? ( http://clic.xtec.net/pub/reports/reports.war
		  http://clic.xtec.net/pub/reports/jclicReports.properties )"
HOMEPAGE="http://clic.xtec.net/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="mysql tomcat serveronly"

RDEPEND=">=virtual/jre-1.5"
DEPEND="${RDEPEND}
	mysql? ( dev-java/jdbc-mysql )
	tomcat? ( www-servers/tomcat )"

src_install() {
	# documentation
	for d in `ls "${S}"/*.txt`
	do
	    dodoc "${d}"
	done

	if use tomcat
	then
	    dodir /lib/spool/JClic
	    insinto /lib/spool/JClic
	    doins ${DISTDIR}/reports.war
	    doins ${DISTDIR}/jclicReports.properties
	fi

	if ! use serveronly
	then
	    dodir /usr/games/JClic
	    insinto /usr/games/JClic
	    doins *.jar
	    doins *.js

	    dodir /usr/share/pixmaps
	    insinto /usr/share/pixmaps
	    doins icons/*.png

	    dodir /usr/share/applications
	    insinto /usr/share/applications
	    doins ${FILESDIR}/jclic.desktop
	    doins ${FILESDIR}/jclicauthor.desktop
	fi
}

pkg_postinst() {
        if use mysql || use tomcat; then
                echo
		einfo "To complete setup JCLIC read the:"
		einfo "http://clic.xtec.net/es/jclic/reports/index.htm"
	fi

        if use mysql; then
                echo
                einfo "To setup JCLIC to run out-of-the-box on your system with a MySQL, run:"
                einfo "emerge --config =${PF}"
	fi
}

pkg_config () {
	MySQL_DB=JClicReports
	MySQL_USER=jclic_user
	MySQL_PWD=jclic_pwd

        if use mysql ; then
                ewarn "When prompted for a password, please enter your MySQL root password"
                ewarn

                einfo "Creating DSPAM MySQL database \"${MySQL_DB}\""
                /usr/bin/mysqladmin -u root -p create ${MySQL_DB}

                einfo "Creating DSPAM MySQL user \"${MySQL_USER}\""
                /usr/bin/mysql -u root -p -e "GRANT SELECT,INSERT,UPDATE,DELETE ON ${MySQL_DB}.* TO ${MySQL_USER}@localhost IDENTIFIED BY '${MySQL_PWD}';FLUSH PRIVILEGES;" -D mysql
	fi
}
