# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit apache-module

DESCRIPTION="A Fast and Memory-Efficient Web Server Extension Mechanism Using Scripting Language mruby for Apache httpd"
HOMEPAGE="http://mod.mruby.org/"
SRC_URI="https://github.com/matsumotory/mod_mruby/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

APACHE2_MOD_CONF="99_${PN}"
APACHE2_MOD_DEFINE="MRUBY"

DEPEND="
	dev-lang/ruby
"
RDEPEND="${DEPEND}"
need_apache2

MRUBY_ROOT=${S}/mruby

APXS2_ARGS="-c -DHAVE_CONFIG_H -I. -I${MRUBY_ROOT}/src -I${MRUBY_ROOT}/include -Wl,--sort-common -Wl,--as-needed -L${MRUBY_ROOT}/build/host/lib -lmruby -lm -lreadline -lncurses -lcrypto -lpthread -lrt ${MRUBY_ROOT}/build/host/mrbgems/mruby-redis/hiredis/lib/libhiredis.a ${MRUBY_ROOT}/build/host/lib/libmruby.a ${PN}.c ap_mrb_*.c"

src_prepare() {
	cp build_config.rb mruby
}

src_compile() {
	pushd mruby && ARCH="" ./minirake && popd || die "compile failed"
	apache-module_src_compile
}
