# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

DESCRIPTION="MongooseIM is a mobile messaging platform with focus on performance and scalability"
HOMEPAGE="https://github.com/esl/MongooseIM"
SRC_URI="https://github.com/esl/MongooseIM/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	./tools/configure with-all without-jingle-sip prefix="" system=true user=jabber || die "prepare failed"
}

src_install() {
	insinto /etc/mongooseim
	doins _build/prod/rel/mongooseim/etc/{app.config,mongooseim.cfg,vm.args,vm.dist.args}
	dobin _build/prod/rel/mongooseim/bin/mongooseimctl
	insinto /usr/lib/mongooseim
	doins -r _build/prod/rel/mongooseim/*
	keepdir /var/lib/mongooseim
	keepdir /var/log/mongooseim
	keepdir /var/lock/mongooseim
	dodoc README.md
}

