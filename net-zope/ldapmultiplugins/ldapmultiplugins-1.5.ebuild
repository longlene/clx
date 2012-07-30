# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit zproduct

DESCRIPTION="PluggableAuthService plugins that interoperate with LDAP"
HOMEPAGE="http://www.dataflake.org/software/ldapmultiplugins/"
SRC_URI="${HOMEPAGE}/${P/-/_}/LDAPMultiPlugins-${PV}.tgz"

LICENSE="ZPL"
KEYWORDS="~x86 ~amd64"

RDEPEND=">=net-zope/zope-2.8.5
	>=net-zope/ldapuserfolder-2.7
	>=net-zope/plone-2.5" # for PluggableAuthService

ZPROD_LIST="LDAPMultiPlugins"
MYDOC="COPYRIGHT.txt"
