# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit user java-utils-2

MY_PN="solr"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="The popular, blazing fast open source enterprise search platform from the Apache Lucene project."
HOMEPAGE="http://lucene.apache.org/solr/"
SRC_URI="mirror://apache/lucene/${MY_PN}/${PV}/${MY_PN}-${PV}.tgz"

# x86 not supported due to xml-xmlbeans not having x86 arch
KEYWORDS="~amd64"
SLOT="0"
LICENSE="Apache-2.0"
IUSE="contrib doc examples"

DEPEND=""
RDEPEND=">=virtual/jre-1.7
	dev-java/ant-core:0
	dev-java/ant-junit4:0
	dev-java/asm:4
	dev-java/commons-cli:1
	dev-java/commons-codec:0
	dev-java/commons-collections:0
	dev-java/commons-configuration:0
	dev-java/commons-fileupload:0
	dev-java/commons-io:1
	dev-java/commons-lang:2.1
	dev-java/dom4j:1
	dev-java/guava:14
	dev-java/jackson:2
	dev-java/joda-time:0
	dev-java/junit:4
	dev-java/lucene-core:5
	dev-java/slf4j-api:0
	dev-java/slf4j-log4j12:0
	dev-java/stax2-api:0
	dev-libs/protobuf:0[java]
	java-virtuals/servlet-api:3.1
	contrib? (
		dev-java/bcmail:1.45
		dev-java/bcprov:1.45
		dev-java/boilerpipe:0
		dev-java/commons-beanutils:1.7
		dev-java/commons-compress:0
		dev-java/commons-digester:2.1
		dev-java/fontbox:1.7
		dev-java/icu4j:52
		dev-java/jdom:1.0
		dev-java/jempbox:1.7
		dev-java/pdfbox:1.8
		dev-java/rome:0
		dev-java/saxon:9
		dev-java/sun-jaf:0
		dev-java/tagsoup:0
		dev-java/velocity:0
		dev-java/xerces:2
		dev-java/xml-xmlbeans:2
		dev-java/xz-java:0
		java-virtuals/javamail:0
		)
	examples? ( dev-db/hsqldb:0 )"

S=${WORKDIR}/${MY_P}

pkg_setup() {
	enewgroup ${MY_PN} || die "failed to create user group"
	enewuser ${MY_PN} -1 -1 /var/lib/${MY_PN} ${MY_PN} || die "failed to create user"
}

src_install() {
	local randpw=$(echo ${RANDOM}|md5sum|cut -c 1-15)
	newinitd "${FILESDIR}/solr.initd" ${MY_PN}-bin
	newconfd "${FILESDIR}/solr.confd" ${MY_PN}-bin
	sed -i "s/solrrocks/${randpw}/g" "${D}/etc/init.d/${MY_PN}-bin" "${D}/etc/conf.d/${MY_PN}-bin"

	# remove files that are not needed on linux
	find \( -name "*.bat" -o -name "*.cmd" \) -delete

	# /etc/solr
	insinto /etc/${MY_PN}/server
	doins -r server/etc/*
	insinto /etc/${MY_PN}
	doins -r server/{contexts,resources}

	# /opt/solr
	insinto /opt/${MY_PN}
	doins -r dist
	dodoc *.txt

	if use contrib ; then
		doins -r contrib
	fi

	if use examples ; then
		doins -r example
	fi

	# /opt/solr/bin
	exeinto /opt/${MY_PN}/bin
	doexe bin/solr
	dosym /opt/${MY_PN}/bin/solr /usr/bin/solr

	# /var/log/solr
	dodir /var/log/${MY_PN}
	fperms 750 /var/log/${MY_PN}
	fowners solr:solr /var/log/${MY_PN}

	# /opt/solr/server
	insinto /opt/${MY_PN}/server
	doins -r server/{README.txt,start.jar,lib,modules,scripts,solr-webapp}
	dosym /etc/${MY_PN}/server /opt/${MY_PN}/server/etc
	dosym /etc/${MY_PN}/contexts /opt/${MY_PN}/server/contexts
	dosym /etc/${MY_PN}/resources /opt/${MY_PN}/server/resources
	dosym /var/log/${MY_PN} /opt/${MY_PN}/server/logs

	# /var/lib/solr
	insinto /var/lib/${MY_PN}
	doins -r server/solr/*
	fperms 750 /var/lib/${MY_PN}
	fowners solr:solr /var/lib/${MY_PN}

	if use doc ; then
		java-pkg_dojavadoc docs
	fi

	# unbundle jars

	local instdir="${D}/opt/${MY_PN}/dist/solrj-lib"
	rm "${instdir}/commons-io-2.4.jar" && java-pkg_jar-from --into "${instdir}" commons-io-1 || die "failed to unbundle jar"
	# httpclient-4.4.1.jar
	# httpcore-4.4.1.jar
	# httpmime-4.4.1.jar
	# noggit-0.6.jar
	rm "${instdir}/slf4j-api-1.7.7.jar" && java-pkg_jar-from --into "${instdir}" slf4j-api || die "failed to unbundle jar"
	rm "${instdir}/stax2-api-3.1.4.jar" && java-pkg_jar-from --into "${instdir}" stax2-api || die "failed to unbundle jar"
	# woodstox-core-asl-4.4.1.jar
	# zookeeper-3.4.6.jar

	local instdir="${D}/opt/${MY_PN}/dist/test-framework/lib"
	rm "${instdir}/ant-1.8.2.jar" && java-pkg_jar-from --into "${instdir}" ant-core ant.jar || die "failed to unbundle jar"
	rm "${instdir}/junit4-ant-2.1.13.jar" && java-pkg_jar-from --into "${instdir}" ant-junit4 || die "failed to unbundle jar"
	rm "${instdir}/junit-4.10.jar" && java-pkg_jar-from --into "${instdir}" junit:4 || die "failed to unbundle jar"
	# randomizedtesting-runner-2.1.13.jar

	local instdir="${D}/opt/${MY_PN}/server/lib/ext"
	# jcl-over-slf4j-1.7.7.jar
	# jul-to-slf4j-1.7.7.jar
	# log4j-1.2.17.jar - our library does not contain org/apache/log4j/pattern/BridgePatternParser
	rm "${instdir}/slf4j-api-1.7.7.jar" && java-pkg_jar-from --into "${instdir}" slf4j-api || die "failed to unbundle jar"
	rm "${instdir}/slf4j-log4j12-1.7.7.jar" && java-pkg_jar-from --into "${instdir}" slf4j-log4j12 || die "failed to unbundle jar"

	local instdir="${D}/opt/${MY_PN}/server/lib"
	rm "${instdir}/javax.servlet-api-3.1.0.jar" && java-pkg_jar-from --into "${instdir}" servlet-api-3.1 servlet-api.jar || die "failed to unbundle jar"
	# jetty-continuation-9.2.11.v20150529.jar
	# jetty-deploy-9.2.11.v20150529.jar
	# jetty-http-9.2.11.v20150529.jar
	# jetty-io-9.2.11.v20150529.jar
	# jetty-jmx-9.2.11.v20150529.jar
	# jetty-rewrite-9.2.11.v20150529.jar
	# jetty-security-9.2.11.v20150529.jar
	# jetty-server-9.2.11.v20150529.jar
	# jetty-servlets-9.2.11.v20150529.jar
	# jetty-servlet-9.2.11.v20150529.jar
	# jetty-util-9.2.11.v20150529.jar
	# jetty-webapp-9.2.11.v20150529.jar
	# jetty-xml-9.2.11.v20150529.jar

	local instdir="${D}/opt/${MY_PN}/server/solr-webapp/webapp/WEB-INF/lib"
	# antlr-runtime-3.5.jar - not matchinb version in tre
	rm "${instdir}/asm-commons-4.1.jar" && java-pkg_jar-from --into "${instdir}" asm-4 asm-commons.jar || die "failed to unbundle jar"
	rm "${instdir}/asm-4.1.jar" && java-pkg_jar-from --into "${instdir}" asm-4 asm.jar || die "failed to unbundle jar"
	rm "${instdir}/commons-cli-1.2.jar" && java-pkg_jar-from --into "${instdir}" commons-cli-1 || die "failed to unbundle jar"
	rm "${instdir}/commons-codec-1.10.jar" && java-pkg_jar-from --into "${instdir}" commons-codec || die "failed to unbundle jar"
	rm "${instdir}/commons-collections-3.2.1.jar" && java-pkg_jar-from --into "${instdir}" commons-collections || die "failed to unbundle jar"
	rm "${instdir}/commons-configuration-1.6.jar" && java-pkg_jar-from --into "${instdir}" commons-configuration || die "failed to unbundle jar"
	# commons-exec-1.3.jar
	rm "${instdir}/commons-fileupload-1.2.1.jar" && java-pkg_jar-from --into "${instdir}" commons-fileupload || die "failed to unbundle jar"
	rm "${instdir}/commons-io-2.4.jar" && java-pkg_jar-from --into "${instdir}" commons-io-1 || die "failed to unbundle jar"
	rm "${instdir}/commons-lang-2.6.jar" && java-pkg_jar-from --into "${instdir}" commons-lang-2.1 || die "failed to unbundle jar"
	# concurrentlinkedhashmap-lru-1.2.jar
	rm "${instdir}/dom4j-1.6.1.jar" && java-pkg_jar-from --into "${instdir}" dom4j-1 || die "failed to unbundle jar"
	rm "${instdir}/guava-14.0.1.jar" && java-pkg_jar-from --into "${instdir}" guava-14 || die "failed to unbundle jar"
	# hadoop-annotations-2.6.0.jar
	# hadoop-auth-2.6.0.jar
	# hadoop-common-2.6.0.jar
	# hadoop-hdfs-2.6.0.jar
	# hppc-0.5.2.jar
	# htrace-core-3.0.4.jar
	# httpclient-4.4.1.jar - the one in tree is old
	# httpcore-4.4.1.jar
	# httpmime-4.4.1.jar
	rm "${instdir}/jackson-core-2.5.4.jar" && java-pkg_jar-from --into "${instdir}" jackson-2 || die "failed to unbundle jar"
	# jackson-dataformat-smile-2.5.4.jar
	rm "${instdir}/joda-time-2.2.jar" && java-pkg_jar-from --into "${instdir}" joda-time || die "failed to unbundle jar"
	# lucene-analyzers-common-5.3.1.jar
	# lucene-analyzers-kuromoji-5.3.1.jar
	# lucene-analyzers-phonetic-5.3.1.jar
	# lucene-backward-codecs-5.3.1.jar
	# lucene-codecs-5.3.1.jar
	rm "${instdir}/lucene-core-5.3.1.jar" && java-pkg_jar-from --into "${instdir}" lucene-core-5 || die "failed to unbundle jar"
	# lucene-expressions-5.3.1.jar
	# lucene-grouping-5.3.1.jar
	# lucene-highlighter-5.3.1.jar
	# lucene-join-5.3.1.jar
	# lucene-memory-5.3.1.jar
	# lucene-misc-5.3.1.jar
	# lucene-queries-5.3.1.jar
	# lucene-queryparser-5.3.1.jar
	# lucene-sandbox-5.3.1.jar
	# lucene-spatial-5.3.1.jar
	# lucene-suggest-5.3.1.jar
	# noggit-0.6.jar
	# org.restlet.ext.servlet-2.3.0.jar
	# org.restlet-2.3.0.jar
	rm "${instdir}/protobuf-java-2.5.0.jar" && java-pkg_jar-from --into "${instdir}" protobuf || die "failed to unbundle jar"
	# solr-core-5.3.1.jar
	# solr-solrj-5.3.1.jar
	# spatial4j-0.4.1.jar
	rm "${instdir}/stax2-api-3.1.4.jar" && java-pkg_jar-from --into "${instdir}" stax2-api || die "failed to unbundle jar"
	# t-digest-3.1.jar
	# woodstox-core-asl-4.4.1.jar
	# zookeeper-3.4.6.jar

	if use contrib ; then
		local instdir="${D}/opt/${MY_PN}/contrib/analysis-extras/lib"
		rm "${instdir}/icu4j-54.1.jar" && java-pkg_jar-from --into "${instdir}" icu4j-52 || die "failed to unbundle jar"
		# morfologik-fsa-1.7.1.jar
		# morfologik-polish-1.7.1.jar
		# morfologik-stemming-1.7.1.jar

		local instdir="${D}/opt/${MY_PN}/contrib/analysis-extras/lucene-libs"
		# lucene-analyzers-icu-5.3.1.jar
		# lucene-analyzers-morfologik-5.3.1.jar
		# lucene-analyzers-smartcn-5.3.1.jar
		# lucene-analyzers-stempel-5.3.1.jar

		local instdir="${D}/opt/${MY_PN}/contrib/clustering/lib"
		# attributes-binder-1.2.1.jar
		# carrot2-mini-3.9.0.jar
		# hppc-0.5.2.jar
		# jackson-core-asl-1.9.13.jar
		# jackson-mapper-asl-1.9.13.jar
		# mahout-collections-1.0.jar
		# mahout-math-0.6.jar
		# simple-xml-2.7.jar

		local instdir="${D}/opt/${MY_PN}/contrib/dataimporthandler-extras/lib"
		rm "${instdir}/activation-1.1.1.jar" && java-pkg_jar-from --into "${instdir}" sun-jaf || die "failed to unbundle jar"
		# gimap-1.5.1.jar
		rm "${instdir}/javax.mail-1.5.1.jar" && java-pkg_jar-from --into "${instdir}" javamail || die "failed to unbundle jar"

		local instdir="${D}/opt/${MY_PN}/contrib/extraction/lib"
		# apache-mime4j-core-0.7.2.jar
		# apache-mime4j-dom-0.7.2.jar
		# aspectjrt-1.8.0.jar
		rm "${instdir}/bcmail-jdk15-1.45.jar" && java-pkg_jar-from --into "${instdir}" bcmail-1.45 || die "failed to unbundle jar"
		rm "${instdir}/bcprov-jdk15-1.45.jar" && java-pkg_jar-from --into "${instdir}" bcprov-1.45 || die "failed to unbundle jar"
		rm "${instdir}/boilerpipe-1.1.0.jar" && java-pkg_jar-from --into "${instdir}" boilerpipe || die "failed to unbundle jar"
		rm "${instdir}/commons-compress-1.8.1.jar" && java-pkg_jar-from --into "${instdir}" commons-compress || die "failed to unbundle jar"
		rm "${instdir}/fontbox-1.8.8.jar" && java-pkg_jar-from --into "${instdir}" fontbox-1.7 || die "failed to unbundle jar"
		rm "${instdir}/icu4j-54.1.jar" && java-pkg_jar-from --into "${instdir}" icu4j-52 || die "failed to unbundle jar"
		# isoparser-1.0.2.jar
		# java-libpst-0.8.1.jar
		rm "${instdir}/jdom-1.0.jar" && java-pkg_jar-from --into "${instdir}" jdom-1.0 || die "failed to unbundle jar"
		rm "${instdir}/jempbox-1.8.8.jar" && java-pkg_jar-from --into "${instdir}" jempbox-1.7 || die "failed to unbundle jar"
		# jmatio-1.0.jar
		# juniversalchardet-1.0.3.jar
		# metadata-extractor-2.6.2.jar - the one in tree too old
		rm "${instdir}/pdfbox-1.8.8.jar" && java-pkg_jar-from --into "${instdir}" pdfbox-1.8 || die "failed to unbundle jar"
		# poi-ooxml-schemas-3.11.jar - the one in tree too old
		# poi-ooxml-3.11.jar - the one in tree too old
		# poi-scratchpad-3.11.jar - the one in tree too old
		# poi-3.11.jar - the one in tree too old
		rm "${instdir}/rome-1.0.jar" && java-pkg_jar-from --into "${instdir}" rome || die "failed to unbundle jar"
		rm "${instdir}/tagsoup-1.2.1.jar" && java-pkg_jar-from --into "${instdir}" tagsoup || die "failed to unbundle jar"
		# tika-core-1.7.jar
		# tika-java7-1.7.jar
		# tika-parsers-1.7.jar
		# tika-xmp-1.7.jar
		# vorbis-java-core-0.6.jar
		# vorbis-java-tika-0.6.jar
		rm "${instdir}/xercesImpl-2.9.1.jar" && java-pkg_jar-from --into "${instdir}" xerces-2 || die "failed to unbundle jar"
		rm "${instdir}/xmlbeans-2.6.0.jar" && java-pkg_jar-from --into "${instdir}" xml-xmlbeans-2 || die "failed to unbundle jar"
		# xmpcore-5.1.2.jar
		rm "${instdir}/xz-1.5.jar" && java-pkg_jar-from --into "${instdir}" xz-java || die "failed to unbundle jar"

		local instdir="${D}/opt/${MY_PN}/contrib/langid/lib"
		# jsonic-1.2.7.jar
		# langdetect-1.1-20120112.jar

		local instdir="${D}/opt/${MY_PN}/contrib/map-reduce/lib"
		# argparse4j-0.4.3.jar
		# hadoop-mapreduce-client-core-2.6.0.jar
		# kite-morphlines-hadoop-sequencefile-1.1.0.jar
		# kite-morphlines-saxon-1.1.0.jar
		rm "${instdir}/Saxon-HE-9.6.0-2.jar" && java-pkg_jar-from --into "${instdir}" saxon-9 || die "failed to unbundle jar"

		local instdir="${D}/opt/${MY_PN}/contrib/morphlines-cell/lib"
		# kite-morphlines-json-1.1.0.jar
		# kite-morphlines-tika-core-1.1.0.jar
		# kite-morphlines-tika-decompress-1.1.0.jar
		# kite-morphlines-twitter-1.1.0.jar

		local instdir="${D}/opt/${MY_PN}/contrib/morphlines-core/lib"
		# config-1.0.2.jar
		# metrics-core-3.0.1.jar
		# metrics-healthchecks-3.0.1.jar
		# kite-morphlines-avro-1.1.0.jar
		# kite-morphlines-core-1.1.0.jar

		local instdir="${D}/opt/${MY_PN}/contrib/uima/lib"
		# AlchemyAPIAnnotator-2.3.1.jar
		rm "${instdir}/commons-digester-2.1.jar" && java-pkg_jar-from --into "${instdir}" commons-digester-2.1 || die "failed to unbundle jar"
		# Tagger-2.3.1.jar
		# OpenCalaisAnnotator-2.3.1.jar
		# uimaj-core-2.3.1.jar
		# WhitespaceTokenizer-2.3.1.jar

		local instdir="${D}/opt/${MY_PN}/contrib/uima/lucene-libs"
		# lucene-analyzers-uima-5.3.1.jar

		local instdir="${D}/opt/${MY_PN}/contrib/velocity/lib"
		rm "${instdir}/commons-beanutils-1.8.3.jar" && java-pkg_jar-from --into "${instdir}" commons-beanutils-1.7 || die "failed to unbundle jar"
		rm "${instdir}/commons-collections-3.2.1.jar" && java-pkg_jar-from --into "${instdir}" commons-collections || die "failed to unbundle jar"
		rm "${instdir}/velocity-1.7.jar" && java-pkg_jar-from --into "${instdir}" velocity || die "failed to unbundle jar"
		# velocity-tools-2.0.jar
	fi

	if use examples ; then
		# /opt/solr/example/exampledocs/post.jar

		local instdir="${D}/opt/${MY_PN}/example/example-DIH/solr/db/lib"
		# derby-10.9.1.0.jar
		rm "${instdir}/hsqldb-1.8.0.10.jar" && java-pkg_jar-from --into "${instdir}" hsqldb || die "failed to unbundle jar"
	fi
}
