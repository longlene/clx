# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils

MY_PN="hadoop"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Software framework for data intensive distributed applications"
HOMEPAGE="http://hadoop.apache.org/"
SRC_URI="mirror://apache/hadoop/core/${MY_P}/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE=""

DEPEND=""
RDEPEND=">=virtual/jre-1.6
	net-misc/openssh
	net-misc/rsync"

S=${WORKDIR}/${MY_P}

pkg_setup(){
	enewgroup hadoop
	enewuser hdfs -1 /bin/bash /var/lib/hadoop/hdfs hadoop
	enewuser mapred -1 /bin/bash /var/lib/hadoop/mapred hadoop
}

src_install() {
	# Get the arch for libs
	if [ $(get_libdir) == "lib64" ]; then
		local MY_ARCH="Linux-amd64-64"
	else
		local MY_ARCH="Linux-i386-32"
	fi

	# The hadoop-env.sh file needs JAVA_HOME set explicitly
	JAVA_HOME=$(java-config -g JAVA_HOME)
	sed -e "2iexport JAVA_HOME=${JAVA_HOME}" -i conf/hadoop-env.sh || die "sed failed"
	cat >> conf/hadoop-env.sh <<-EOF

# Added by Gentoo Portage
export HADOOP_CONF_DIR=/etc/hadoop
export HADOOP_LOG_DIR=/var/log/hadoop
export HADOOP_SECURE_DN_LOG_DIR=/var/log/hadoop
export HADOOP_PID_DIR=/var/run/hadoop
export HADOOP_SECURE_DN_PID_DIR=/var/run/hadoop
EOF

	# make useful dirs
	diropts -m750 -o root -g hadoop
	dodir /etc/"${MY_PN}"
	dodir /usr/share/"${MY_PN}"
	diropts -m770 -o root -g hadoop
	dodir /var/log/"${MY_PN}"
	dodir /var/run/"${MY_PN}"

	# conf
	mv "${S}"/conf/* "${D}"/etc/"${MY_PN}" || die "install failed"
	rm -rf "${S}"/conf || die "install failed"

	# /usr/bin stuff
	for bin in "hadoop" "task-controller"; do
		dobin bin/"${bin}"
		rm bin/"${bin}" || die "install failed"
		fowners root:hadoop /usr/bin/"${bin}"
	done

	# /usr/sbin stuff
	sed -i -e "s@JAVA_HOME=/usr/java/default@JAVA_HOME=${JAVA_HOME}@g" \
		sbin/update-hadoop-env.sh || die "sed failed"
	for sbin in bin/* sbin/*; do
		dosbin "${sbin}"
		rm "${sbin}" || die "install failed"
	done

	# /usr/include stuff
	insinto /usr/include/"${MY_PN}"
	doins "${S}"/c++/"${MY_ARCH}"/include/"${MY_PN}"/*

	# libs
	pushd "${S}"/lib/native/"${MY_ARCH}"
# 	dolib *.la
# 	dolib.a *.a
	for soname in *.so.1.0.0; do
		dolib.so "${soname}"
		dosym ./"${soname}" /usr/$(get_libdir)/"${soname/.0.0}"
		dosym ./"${soname}" /usr/$(get_libdir)/"${soname/.1.0.0}"
	done
	popd
	#
	pushd "${S}"/c++/"${MY_ARCH}"/lib
# 	dolib *.la
# 	dolib.a *.a
	for soname in *.so.0.0.0; do
		dolib.so "${soname}"
		dosym ./"${soname}" /usr/$(get_libdir)/"${soname/.0.0}"
		dosym ./"${soname}" /usr/$(get_libdir)/"${soname/.0.0.0}"
	done
	popd

	# libexec
	insinto /usr/libexec
	insopts -m755
	doins "${S}"/libexec/*

	# /usr/share stuff
	rm -rf "${S}"/lib/native/
	for d in "contrib" "lib" "webapps"; do
		mv "${S}"/"${d}" "${D}"/usr/share/"${MY_PN}" || die "install failed"
	done
	mv "${S}"/share/"${MY_PN}"/templates "${D}"/usr/share/"${MY_PN}" || die "install failed"
	mv "${S}"/*.jar "${D}"/usr/share/"${MY_PN}" || die "install failed"

	# init scripts
	newinitd "${FILESDIR}"/"${MY_PN}".initd "${MY_PN}"
	for i in "namenode" "datanode" "historyserver" "jobtracker" "secondarynamenode" "tasktracker"
	do
		dosym /etc/init.d/"${MY_PN}" /etc/init.d/"${MY_PN}"-"${i}"
	done
}

pkg_postinst() {
	elog "For info on configuration see http://hadoop.apache.org/core/docs/r${PV}"
}
