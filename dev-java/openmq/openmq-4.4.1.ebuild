# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

JAVA_PKG_IUSE="doc examples source"
WANT_ANT_TASKS="ant-nodeps"

inherit java-pkg-2 java-ant-2 versionator

DESCRIPTION="An enterprise quality Java Message Service (JMS) implementation"
HOMEPAGE="http://mq.dev.java.net/"

# set this for rc and final versions to the build-number of open-mq
MY_BUILDV="b7"

LICENSE="|| ( CDDL GPL-2-with-linking-exception )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

if [[ $(x=( $(get_all_version_components) ); echo ${x[3]}) == '.' ]]; then
	MY_PV=$(replace_version_separator 2 'u' $(get_version_component_range 1-3))
else
	MY_PV=$(get_version_component_range 1-2)
fi

if [[ ${PV} == *rc* || ${PV} == *beta* ]]; then
	for x in $(get_version_components); do
		if [[ ${x} == rc* ]]; then
			MY_BUILDV="${MY_BUILDV}-${x}"
			break
		fi
		if [[ ${x} == beta* ]]; then
			MY_BUILDV=b${x#beta}
			break
		fi
	done
else
	MY_BUILDV="${MY_BUILDV}-final"
fi

MY_ZIPV=$(replace_version_separator 1 _ $(get_version_component_range 1-2))
SRC_URI="http://download.java.net/mq/open-mq/${MY_PV}/${MY_BUILDV}/openmq${MY_ZIPV}-source.zip -> ${P}.zip"

COMMON_DEPEND="dev-java/grizzly-nio-framework-bin
	dev-java/javahelp"
DEPEND="${COMMON_DEPEND}
	app-arch/unzip
	dev-java/glassfish-connector-api
	java-virtuals/servlet-api:2.5
	java-virtuals/transaction-api
	>=virtual/jdk-1.6"
RDEPEND="${COMMON_DEPEND}
	>=virtual/jre-1.6"

S="${WORKDIR}/mq"

EANT_BUILD_TARGET="build install"
EANT_DOC_TARGET="builddocs"

java_prepare() {
	# imqbrokerd's wrapper is too complicated for java-pkg_dolauncher
	epatch "${FILESDIR}/${P}"_imqbrokerd.patch || die "imqbrokerd patch failed"

	# Make javadocs optional and use glassfish-connector-api.jar,
	# servlet-api.jar, and jta.jar instead of javaee-api.jar
	epatch "${FILESDIR}/${P}"_rules_xml.patch || die "rules.xml patch failed"

	# Only install javadocs if they were built
	sed -e 's/\(javadoc"\)>/\1 failonerror="false">/' -i src/buildant/distrules.xml || die "sed failed"


	mkdir extlib
	java-pkg_jar-from --build-only --into extlib glassfish-connector-api glassfish-connector-api.jar 
	java-pkg_jar-from --into extlib grizzly-nio-framework-bin grizzly-nio-framework.jar grizzly.jar
	java-pkg_jar-from --into extlib javahelp jhall.jar
	java-pkg_jar-from --build-only --into extlib servlet-api-2.5 servlet-api.jar
	java-pkg_jar-from --build-only --into extlib transaction-api jta.jar
}

src_install() {
	dobin dist/mq/bin/imqbrokerd || die

	insinto /etc/openmq
	doins -r dist/mq/etc/* || die

	insinto /usr/share/openmq
	doins -r dist/mq/lib/{help,images,props}|| die

	rm dist/mq/lib/jhall.jar || die # Use system jhall instead
	java-pkg_dojar dist/mq/lib/*.jar
	java-pkg_dowar dist/mq/lib/*.war

	java-pkg_addcp "${ROOT}/usr/share/openmq/help"

	java_args="-Dimq.home=${ROOT} \
			-Dimq.etchome=${ROOT}/etc/openmq \
			-Dimq.libhome=${ROOT}/usr/share/openmq \
			-Dimq.varhome=${ROOT}/var/openmq"

	java-pkg_dolauncher imqadmin \
		--main com.sun.messaging.jmq.admin.apps.console.AdminConsole \
		--java_args "${java_args}"
	
	java-pkg_dolauncher imqbridgemgr \
		--main com.sun.messaging.bridge.admin.bridgemgr.BridgeMgr \
		--java_args "${java_args}"

	java-pkg_dolauncher imqcmd \
		--main com.sun.messaging.jmq.admin.apps.broker.BrokerCmd \
		--java_args "${java_args}"

	java-pkg_dolauncher imqdbmgr \
		--main com.sun.messaging.jmq.jmsserver.persist.jdbc.DBTool \
		--java_args "${java_args}"

	java-pkg_dolauncher imqobjmgr \
		--main com.sun.messaging.jmq.admin.apps.objmgr.ObjMgr \
		--java_args "${java_args}"

	java-pkg_dolauncher imqusermgr \
		--main com.sun.messaging.jmq.jmsserver.auth.usermgr.UserMgr \
		--java_args "${java_args}"

	use doc && java-pkg_dojavadoc binary/share/opt/javadoc
	use source && java-pkg_dosrc src/share/java/{com,javax}
	use examples && java-pkg_doexamples dist/mq/examples
}
