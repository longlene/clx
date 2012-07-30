# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit zproduct

DESCRIPTION="A Zope Content Management System, based on CMF Modifications."
HOMEPAGE="http://www.cps-project.org"
MY_P="3.4.4"
SRC_URI="!full? ( !groupware? ( !legacy? (
${HOMEPAGE}/static/src/CPS-platform-${MY_P}.tar.gz ) ) )
	full? ( ${HOMEPAGE}/static/src/CPS-full-${MY_P}.tar.gz )
	groupware? ( ${HOMEPAGE}/static/src/CPS-groupware-${MY_P}.tar.gz )
	legacy? (  ${HOMEPAGE}/static/src/CPS-legacy-${MY_P}.tar.gz )
"
RESTRICT="nomirror"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
SLOT=3.4
IUSE="portaltransforms cpsooo cpsblog cpsschemas iav full groupware legacy"
RDEPEND="=net-zope/zope-2.9.7
         app-admin/zope-config
         iav? ( dev-python/mysql-python dev-python/pycurl dev-python/pymssql )
         dev-python/pyxml
		 portaltransforms? ( app-text/poppler www-client/lynx
		 app-text/wv app-text/xlhtml dev-libs/libxslt )
		 cpsblog? ( dev-python/lxml )
		 cpsooo? ( dev-python/elementtree )
		 cpsschemas? ( dev-python/imaging )
		 "

ZPROD_LIST="CMFActionIcons CMFCalendar CMFCore CMFDefault CMFonFive CMFSetup CMFTopic CMFUid CPSBlog CPSChat CPSCompat CPSCore CPSDashboards CPSDefault CPSDirectory CPSDocument CPSForum CPSI18n CPSNavigation CPSonFive CPSOOo CPSPortlets CPSRelation CPSRemoteController CPSRSS CPSSchemas CPSSkins CPSSubscriptions CPSTypeMaker CPSUserFolder CPSUtil CPSWiki CPSWorkflow DCWorkflow ExternalEditor FCKeditor Five GenericSetup iCalendar Localizer PortalTransforms TranslationService ZMIntrospection"

S="${WORKDIR}/Products-CPS-platform-${MY_P}"

# Specific packages
if use full; 
then
ZPROD_LIST="BayesCore CalCore CalZope CMFActionIcons CMFCalendar CMFCore CMFDefault CMFonFive CMFSetup CMFTopic CMFUid CPSBayes CPSBlog CPSChat CPSCompat CPSCore CPSCourrier CPSDashboards CPSDefault CPSDirectory CPSDocument CPSForum CPSI18n CPSLDAPSetup CPSMailAccess CPSNavigation CPSonFive CPSOOo CPSPortlets CPSRelation CPSRemoteController CPSRSS CPSSchemas CPSSharedCalendar CPSSkins CPSSubscriptions CPSTypeMaker CPSUid CPSUserFolder CPSUtil CPSWiki CPSWorkflow DCWorkflow ExternalEditor FCKeditor Five GenericSetup iCalendar Localizer PortalTransforms TranslationService ZMIntrospection"
S="${WORKDIR}/Products-CPS-full-${MY_P}"
fi

if use groupware;
then
ZPROD_LIST="CalCore CalZope CPSMailAccess CPSSharedCalendar iCalendar"
S="${WORKDIR}/Products-CPS-groupware-${MY_P}"
fi

if use legacy;
then
ZPROD_LIST="CPSBoxes CPSCalendar CPSChat CPSCollector CPSInstaller CPSNewsLettersCPSWebMail LDAPUserGroupsFolder"
S="${WORKDIR}/Products-CPS-legacy-${MY_P}"
fi

MYDOC="doc"

