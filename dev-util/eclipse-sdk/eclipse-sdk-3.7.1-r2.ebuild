# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
WANT_ANT_TASKS="ant-nodeps"

# eclipse-build is too complicated for automatic fixing
# if there are any fixes we should create patches
# and push them upstream
JAVA_PKG_BSFIX="off"

inherit java-pkg-2 java-ant-2 check-reqs

BUILD_VER="3.7.1"
BUILD_ID="I20110909-1335"
BUILD_LABEL="${BUILD_VER}-${BUILD_ID}"
ECLIPSE_BUILD_VER="9e028fbc74e844e96a6fd944d7d4f68909283a5d"
S="${WORKDIR}/org.eclipse.linuxtools.eclipse-build-${ECLIPSE_BUILD_VER}/eclipse-build"

DESCRIPTION="Eclipse SDK"
HOMEPAGE="http://www.eclipse.org/eclipse/"
BASE_URI="http://download.eclipse.org/technology/linuxtools/eclipse-build/3.7.x_Indigo/"
SRC_URI="${BASE_URI}eclipse-${BUILD_VER}-src.tar.bz2
	http://git.eclipse.org/c/linuxtools/org.eclipse.linuxtools.eclipse-build.git/snapshot/org.eclipse.linuxtools.eclipse-build-${ECLIPSE_BUILD_VER}.tar.bz2 -> eclipse-build-${ECLIPSE_BUILD_VER}.tar.bz2"
#	${BASE_URI}eclipse-build-${ECLIPSE_BUILD_VER}.tar.xz"

LICENSE="EPL-1.0"
RESTRICT="mirror"
SLOT="3.7"
KEYWORDS="~amd64 ~x86"
IUSE="doc gnome source"

# ant dependencies should really be >=1.8.2
CDEPEND=">=dev-java/swt-${PV%.0}_rc4:${SLOT}
	>=dev-java/ant-1.8.1
	>=dev-java/asm-3.3.1:3
	>=dev-java/commons-codec-1.3
	>=dev-java/commons-el-1.0
	>=dev-java/commons-httpclient-3.1:3
	>=dev-java/commons-logging-1.0.4
	>=dev-java/hamcrest-core-1.1
	>=dev-java/icu4j-4.4.2:4.4
	>=dev-java/jsch-0.1.41
	>=dev-java/junit-3.8.2:0
	>=dev-java/junit-4.8.2:4
	>=dev-java/lucene-2.9.1:2.9
	>=dev-java/lucene-analyzers-2.9.1:2.9
	>=dev-java/sat4j-core-2.3.0:2.3
	>=dev-java/sat4j-pseudo-2.3.0:2.3
	dev-java/tomcat-servlet-api:2.5
	>=www-servers/tomcat-7:7
	>=www-servers/jetty-6
	x86? ( gnome? ( gnome-base/gconf ) )"
RDEPEND="${CDEPEND}
	>=virtual/jre-1.5"
# ant dependencies should really be >=1.8.2
DEPEND="${CDEPEND}
	app-arch/unzip
	app-arch/xz-utils
	app-arch/zip
	>=dev-java/ant-antlr-1.8.1
	>=dev-java/ant-apache-bcel-1.8.1
	>=dev-java/ant-apache-bsf-1.8.1
	>=dev-java/ant-apache-log4j-1.8.1
	>=dev-java/ant-apache-oro-1.8.1
	>=dev-java/ant-apache-regexp-1.8.1
	>=dev-java/ant-apache-resolver-1.8.1
	>=dev-java/ant-apache-xalan2-1.8.1
	>=dev-java/ant-commons-logging-1.8.1
	>=dev-java/ant-commons-net-1.8.1
	>=dev-java/ant-core-1.8.1
	>=dev-java/ant-javamail-1.8.1
	>=dev-java/ant-jdepend-1.8.1
	>=dev-java/ant-jmf-1.8.1
	>=dev-java/ant-jsch-1.8.1
	>=dev-java/ant-junit-1.8.1
	>=dev-java/ant-junit4-1.8.1
	>=dev-java/ant-swing-1.8.1
	>=dev-java/ant-testutil-1.8.1
	>=virtual/jdk-1.6"
#	>=dev-java/ant-launcher-1.8.1

OSGI_DEPENDENCIES=(
	'com.ibm.icu - icu4j-4.4'
	'com.jcraft.jsch - jsch'
	'javax.servlet - tomcat-servlet-api-2.5 servlet-api'
#	'javax.servlet tomcat6-servlet-2.5-api tomcat-servlet-api-2.5 servlet-api'
	'javax.servlet.jsp - tomcat-servlet-api-2.5 jsp-api'
#	'javax.servlet.jsp tomcat6-jsp-2.1-api tomcat-servlet-api-2.5 jsp-api'
	'org.apache.commons.codec commons-codec commons-codec'
	'org.apache.commons.el apache-commons-el-1.0 commons-el'
	'org.apache.commons.httpclient - commons-httpclient-3'
#	'org.apache.commons.httpclient jakarta-commons-httpclient-3.1 commons-httpclient-3'
	'org.apache.commons.logging apache-commons-logging commons-logging'
	'org.apache.jasper - tomcat-7 jasper jasper-el'
	'org.apache.lucene.core - lucene-2.9'
#	'org.apache.lucene.core lucene lucene-2.9'
	'org.apache.lucene.analysis - lucene-analyzers-2.9'
#	'org.apache.lucene.analysis lucene-analyzers lucene-analyzers-2.9'
	'org.hamcrest.core - hamcrest-core'
	'org.mortbay.jetty.server - jetty-6 jetty'
#	'org.mortbay.jetty.server jetty-6.1.26 jetty-6 jetty'
	'org.mortbay.jetty.util - jetty-6 jetty-util'
#	'org.mortbay.jetty.util jetty-util-6.1.26 jetty-6 jetty-util'
	'org.objectweb.asm - asm-3'
	'org.sat4j.core - sat4j-core-2.3'
#	'org.sat4j.core org.sat4j.core sat4j-core-2.3'
	'org.sat4j.pb - sat4j-pseudo-2.3'
#	'org.sat4j.pb org.sat4j.pb sat4j-pseudo-2.3'
)
NONOSGI_DEPENDENCIES=(
	'org.apache.ant ant-antlr'
	'org.apache.ant ant-apache-bcel'
	'org.apache.ant ant-apache-bsf'
	'org.apache.ant ant-apache-log4j'
	'org.apache.ant ant-apache-oro'
	'org.apache.ant ant-apache-regexp'
	'org.apache.ant ant-apache-resolver'
	'org.apache.ant ant-apache-xalan2'
	'org.apache.ant ant-commons-logging'
	'org.apache.ant ant-commons-net'
	'org.apache.ant ant-core ant ant-launcher'
	'org.apache.ant ant-javamail'
	'org.apache.ant ant-jdepend'
	'org.apache.ant ant-jmf'
	'org.apache.ant ant-jsch'
	'org.apache.ant ant-junit'
	'org.apache.ant ant-junit4'
#	'org.apache.ant ant-launcher'
	'org.apache.ant ant-swing'
	'org.apache.ant ant-testutil'
	'org.junit_3.8.2.v3 junit'
	'org.junit4 junit-4 junit'
	'org.junit_4.8.2.v4 junit-4 junit'
)

ALL_OS='aix hpux linux macosx qnx solaris win32'
ALL_WS='carbon cocoa gtk motif photon win32 wpf'
ALL_ARCH='alpha arm ia64 mips mipsel PA_RISC ppc ppc64 s390 s390x sparc sparc64 x86 x86_64'

pkg_pretend() {
	CHECKREQS_MEMORY="1536M"
	if use doc ; then
		CHECKREQS_DISK_BUILD="3072M"
	else
		CHECKREQS_DISK_BUILD="1536M"
	fi
	check-reqs_pkg_pretend
}

buildDir="${S}/build/eclipse-${BUILD_VER}-src"

pkg_setup() {
	CHECKREQS_MEMORY="1536M"
	if use doc ; then
		CHECKREQS_DISK_BUILD="3072M"
	else
		CHECKREQS_DISK_BUILD="1536M"
	fi

	check-reqs_pkg_setup
	ws='gtk'
	if use x86 ; then os='linux' ; arch='x86'
	elif use amd64 ; then os='linux' ; arch='x86_64'
	fi

	java-pkg-2_pkg_setup

	if use doc ; then
		ewarn "Having the 'doc' USE flag enabled greatly increases the build time."
		ewarn "You might want to disable it for ${PN} if you don't need it."
	fi
}

src_unpack() {
	unpack "eclipse-build-${ECLIPSE_BUILD_VER}.tar.bz2"
	#tar -xpJf "${DISTDIR}/eclipse-build-${ECLIPSE_BUILD_VER}.tar.xz"
	ln -s "${DISTDIR}/eclipse-${BUILD_VER}-src.tar.bz2" "${S}/eclipse-${BUILD_VER}-src.tar.bz2" || die

	cd "${S}"
	# building with ecj fails for some reason (polluted classpath probably)
	java-pkg_force-compiler javac
	sed -e 's/^\(label\|testsBuildLabel\)=.*$/\1='"${BUILD_VER}"'/' \
			-e 's/^buildId=.*$/buildId='"${BUILD_ID}"'/' \
			-i build.properties -i pdebuild.properties || die
	eant unpack
}

src_prepare() {
	# apply patches before we start cleaning junk out
	eant applyPatches

	# fix up hardcoded runtime class paths
	sed -e 's|/usr/lib/jvm/java/jre/lib/rt\.jar:.*$|'"$(java-config --runtime)"'|' \
			-i {,pde}build.properties || die

	# we'll handle our own dependency symlinking, so disable eclipse-build helper
	sed -e 's/,symlinkDeps,/,/' -i build.xml || die
	sed_xml_element 'target' -e '/name="provision.sdk"/ s|<symlinkInstalled.*\(<echo \)|\1|' \
			-i build.xml || die

	# this unpacking step appears to be unnecessary (and it doesn't work)
	sed_xml_element 'target' -e 's/\(depends="[^"]\+\),[^",]*nestedJars/\1/' \
			-i "${buildDir}"/plugins/*/build.xml || die

	# disable building of libgnomeproxy on x86 if USE=-gnome
	if ! use gnome ; then
		sed_xml_element 'condition' -e '/property="build\.libgnomeproxy"/d' -i build.xml || die
	fi

	# skip compilation of SWT native libraries (we use the system-installed copies)
	sed_xml_element 'ant' -e '/swt/d' -i build.xml || die

	ebegin 'Removing plugins of irrelevant platforms'
	local remove_os=" ${ALL_OS} " ; remove_os=${remove_os/ ${os} / }
	remove_os=${remove_os# } ; remove_os=${remove_os% } ; remove_os=${remove_os// /'\|'}
	local remove_ws=" ${ALL_WS} " ; remove_ws=${remove_ws/ ${ws} / }
	remove_ws=${remove_ws# } ; remove_ws=${remove_ws% } ; remove_ws=${remove_ws// /'\|'}
	local remove_arch=" ${ALL_ARCH} " ; remove_arch=${remove_arch/ ${arch} / }
	remove_arch=${remove_arch# } ; remove_arch=${remove_arch% } ; remove_arch=${remove_arch// /'\|'}
	sed_xml_element 'includes\|plugin' \
			-e '/id="org\.eclipse\.\(core\.net\.linux\.x86\|update\.core\.linux\)"/b' \
			-e '/os="'"${remove_os}"'"/d' -e '/ws="'"${remove_ws}"'"/d' -e '/arch="'"${remove_arch}"'"/d' \
			-i "${buildDir}"/features/*/feature.xml "${S}"/eclipse-build-feature/feature.xml \
		|| die 'remove irrelevant platforms failed'
	eend

	if ! use doc ; then
		ebegin 'Removing documentation plugins'
		rm -rf "${buildDir}"/plugins/*.doc{,.*}
		eclipse_delete-plugins '.*\.doc\(\..*\|\)'
		eend
	fi

	if ! use source ; then
		ebegin 'Removing source plugins'
		rm -rf "${buildDir}"/plugins/*.source{,_*}
		eclipse_delete-plugins '.*\.source'
		eend
	fi

	ebegin 'Linking dependencies'
	local dep ; for dep in "${OSGI_DEPENDENCIES[@]}" ; do
		eclipse_create-osgi-dep ${dep}
	done
	local dep ; for dep in "${NONOSGI_DEPENDENCIES[@]}" ; do
		eclipse_create-nonosgi-dep ${dep}
	done
	eend

	cd "${buildDir}" || die
	epatch "${FILESDIR}/${SLOT}/hamcrest-junit-lib.patch"
	epatch "${FILESDIR}/${SLOT}/gtk_makefile.patch"
	epatch "${FILESDIR}/${SLOT}/iterators.patch"
}

src_compile() {
	ANT_OPTS='-Xmx512M' eant -DbuildArch="${arch}"

	# remove stray symlink
	rm "${buildDir}"/installation/plugins/junit4.jar
}

src_install() {
	local destDir="/usr/$(get_libdir)/eclipse-${SLOT}"

	insinto "${destDir}"
	shopt -s dotglob
	doins -r "${buildDir}"/installation/* || die
	shopt -u dotglob
	chmod +x "${D}${destDir}"/eclipse
	rm -f "${D}${destDir}"/libcairo-swt.so  # use the system-installed SWT libraries

	# redo symlinks
	ebegin 'Relinking dependencies'
	local dep ; for dep in "${OSGI_DEPENDENCIES[@]}" ; do
		eclipse_relink-osgi-dep ${dep}
	done
	local dep ; for dep in "${NONOSGI_DEPENDENCIES[@]}" ; do
		eclipse_relink-nonosgi-dep ${dep}
	done
	eend

	# Install Gentoo wrapper and config
	dobin "${FILESDIR}/${SLOT}/eclipse-${SLOT}" || die
	insinto /etc
	doins "${FILESDIR}/${SLOT}/eclipserc-${SLOT}" || die

	# Create desktop entry
	make_desktop_entry "eclipse-${SLOT}" "Eclipse ${PV}" "${destDir}/icon.xpm" || die
}

eclipse_create-osgi-dep() {
	local bundle=${1} replace=${2} package=${3} ; shift 3
	bundle=$(basename "${S}/dependencyManifests/${bundle}"_*.jar .jar) || die
	[[ ${replace} == '-' ]] && replace=${bundle}
	einfo "  ${bundle} => ${package}" "${@}"
	mkdir -p "${buildDir}/plugins/${bundle}" || die
	pushd "${buildDir}/plugins/${bundle}" > /dev/null || die
	if (( ${#} )) ; then
		local jar ; for jar in "${@}" ; do
			java-pkg_jar-from "${package}" "${jar}.jar"
		done
	else
		java-pkg_jar-from "${package}"
	fi
	mkdir META-INF || die
	cp "${S}/dependencyManifests/${bundle}.jar/META-INF/MANIFEST.MF" META-INF/ || die
	manifest_replace META-INF/MANIFEST.MF 'Bundle-ClassPath' "$(echo *.jar | tr ' ' ',')"
	manifest_delete META-INF/MANIFEST.MF 'Name\|SHA1-Digest'
	# replace classpath refs to this bundle with refs to system-installed jars
	sed_xml_element 'pathelement' -e '/path="\([^"]\+\/\)\?'"${replace//./\.}"'\.jar"/c '"$(
			for jar in *.jar ; do
				echo -n '<pathelement path="'"$(readlink "${jar}")"'"/>'
			done)" -i "${buildDir}"/plugins/*/build.xml || die
	popd > /dev/null || die
	# include unpacked bundle in copy to bootstrap plugins dir
	sed_xml_element 'fileset' -e '/id="orbitDeps"/ s|</fileset>|<include name="'"${bundle}/"'"/>\0|' \
			-i "${S}/pdebuild.xml" || die
}

eclipse_create-nonosgi-dep() {
	local bundle=${1} package=${2} ; shift 2
	local pdir=${buildDir}/plugins
	local jar ; for jar in "${@:-${package}}" ; do
		local dir=$(dirname "$(grep -ho "${bundle//./\.}"'\(_[^/=]*\)\?/\([^/=]*/\)*'"${jar}"'\.jar' \
				"${S}"/{,jdt}nonosgidependencies.properties)") || die
		einfo "  ${dir}/${jar}.jar => ${package}"
		mkdir -p "${pdir}/${dir}" || die
		java-pkg_jar-from --build-only "${package}" "${jar}.jar" "${pdir}/${dir}/${jar}.jar"
		dir=${dir%%/*}
		local manifest=${pdir}/${dir}/META-INF/MANIFEST.MF
		[[ -f ${manifest} ]] && manifest_delete "${manifest}" 'Name\|SHA1-Digest'
		rm -f "${pdir}/${dir}"/META-INF/ECLIPSEF.{RSA,SF}
	done
}

eclipse_relink-osgi-dep() {
	local bundle=${1} replace=${2} package=${3} ; shift 3
	einfo "  ${bundle} => ${package}" "${@}"
	pushd "${D}${destDir}/plugins/${bundle}"_* > /dev/null || die
	if (( ${#} )) ; then
		local jar ; for jar in "${@}" ; do
			java-pkg_jar-from --build-only "${package}" "${jar}.jar"
		done
	else
		java-pkg_jar-from --build-only "${package}"
	fi
	popd > /dev/null || die
}

eclipse_relink-nonosgi-dep() {
	local bundle=${1} package=${2} ; shift 2
	local pdir=${D}${destDir}/plugins
	local jar ; for jar in "${@:-${package}}" ; do
		local dir=$(dirname "$(grep -ho "${bundle//./\.}"'\(_[^/=]*\)\?/\([^/=]*/\)*'"${jar}"'\.jar' \
				"${S}"/{,jdt}nonosgidependencies.properties)") || die
		einfo "  ${dir}/${jar}.jar => ${package}"
		mkdir -p "${pdir}/${dir}" || die
		java-pkg_jar-from --build-only "${package}" "${jar}.jar" "${pdir}/${dir}/${jar}.jar"
	done
}

# Removes feature.xml references to plugins matching ${1}.
eclipse_delete-plugins() {
	sed_xml_element 'includes\|plugin' -e '/id="'"${1}"'"/d' \
			-i "${buildDir}"/features/*/feature.xml "${S}"/eclipse-build-feature/feature.xml \
		|| die 'eclipse_delete-plugins failed'
}

# Prints the first value from manifest file ${1} whose key matches regex ${2},
# unfolding as necessary.
manifest_get() {
	sed -n -e '/^\('"${2}"'\): /{h;:A;$bB;n;/^ /!bB;H;bA};d;:B;g;s/^[^:]*: //;s/\n //g;p;q' "${1}" \
		|| die 'manifest_get failed'
}

# Deletes values from manifest file ${1} whose keys match regex ${2}, taking
# into account folding.
manifest_delete() {
	sed -n -e ':A;/^\('"${2}"'\): /{:B;n;/^ /!{bA};bB};p' -i "${1}" \
		|| die 'manifest_delete failed'
}

# Replaces the value for key ${2} in the first section of manifest file ${1}
# with ${3}, or adds the key-value pair to that section if the key was absent.
manifest_replace() {
	LC_ALL='C' awk -v key="${2}" -v val="${3}" '
function fold(s,  o, l, r) {
	o = 2 ; l = length(s) - 1 ; r = substr(s, 1, 1)
	while (l > 69) { r = r substr(s, o, 69) "\n " ; o += 69 ; l -= 69 }
	return r substr(s, o)
}
BEGIN { FS = ": " }
f { print ; next }
i { if ($0 !~ "^ ") { f = 1 ; print } ; next }
$1 == key { print fold(key FS val) ; i = 1 ; next }
/^\r?$/ { print fold(key FS val) ; print ; f = 1 ; next }
{ print }
END { if (!f) { print fold(key FS val) } }
' "${1}" > "${1}-" && mv "${1}"{-,} || die 'manifest_replace failed'
}

# Executes sed over each XML element with a name matching ${1}, rather than
# over each line. The entire element (and its children) may be removed with the
# 'd' command, or they may be edited using all the usual sed foo. Basically,
# the script argument will be executed only for elements matching ${1}, and the
# sed pattern space will consist of the entire element, including any nested
# elements. Note that this is not perfect and requires no more than one XML
# element per line to be reliable.
sed_xml_element() {
	local elem=${1} ; shift
	sed -e '/<\('"${elem}"'\)\([> \t]\|$\)/{:_1;/>/!{N;b_1};/\/>/b_3' \
			-e ':_2;/<\/\('"${elem}"'\)>/!{N;b_2};b_3};b;:_3' "${@}"
}
