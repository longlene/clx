# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_PN=ReviewBoard
MY_PV=1.5beta2
MY_P=${MY_PN}-${MY_PV}

inherit distutils python versionator

DESCRIPTION="A web-based tool designed to track of pending code changes and make code reviews much less painful"
HOMEPAGE="http://www.reviewboard.org/"
SRC_URI="http://downloads.${PN}.org/releases/${MY_PN}/$(get_version_component_range 1-2)/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+apache cvs git ldap lighttpd mercurial +mysql postgres sqlite +subversion"

RDEPEND="dev-python/django[mysql?]
	dev-python/django[postgres?]
	dev-python/django[sqlite?]
	dev-python/django-evolution
	>=dev-python/djblets-0.6.2
	dev-python/flup
	dev-python/imaging
	dev-python/paramiko
	dev-python/pygments
	dev-python/python-memcached
	dev-python/pytz
	dev-python/recaptcha-client
	net-misc/memcached
	apache? ( www-servers/apache || ( www-apache/mod_fastcgi www-apache/mod_python ) )
	cvs? ( dev-util/cvs )
	git? ( dev-python/git-python )
	ldap? ( dev-python/python-ldap )
	lighttpd? ( www-servers/lighttpd )
	mercurial? ( dev-vcs/mercurial )
	subversion? ( dev-python/pysvn )"


S=${WORKDIR}/${MY_P}

pkg_setup() {
	if ! use cvs && ! use git && ! use mercurial && ! use subversion ; then
		elog "Please enable at least one vcs system."
		elog "Available options are cvs, git, mercurial, and subversion." 
		die "No vcs systems enabled"
	fi
	
	if ! use mysql && ! use postgres && ! use sqlite ; then
		elog "Please enable at least one of mysql, postgres, or sqlite database backends."
		die "No database backend enabled"
	fi

	if ! use apache && ! use lighttpd ; then
		elog "Please enable either apache or lighttpd."
		elog "If you choose apache then you need to ensure that either"
		elog "www-apache/mod_fastcgi or www-apache/mod_python is also available to apache."
		die "No web server enabled"
	fi
}

pkg_postinst() {
	distutils_pkg_postinst
	elog "Reviewboard is now installed. To create a reviewboard site use:"
	elog "\trb-site install <path to reviewboard virtual host>"
	elog "For example:"
	elog "\trb-site install /var/www/reviews.example.com"
}
