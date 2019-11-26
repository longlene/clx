# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="cppjieba binding for ruby"
HOMEPAGE="https://github.com/altkatz/jieba_rb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0"
ruby_add_rdepend ">=dev-ruby/minitest-0"

each_ruby_prepare() {
	sed -e '/EXT_BASE =/{s,#{abs}/../ext/cppjieba/,/usr/share/jieba_rb/,}' -i lib/jieba_rb.rb
}

each_ruby_configure() {
	${RUBY} -C ext/jieba extconf.rb
}

each_ruby_compile() {
	emake -C ext/jieba V=1 CFLAGS="${CFLAGS} -fPIC" archflag="${LDFLAGS}"
	cp ext/jieba/*$(get_modname) lib/
}

all_ruby_install() {
	all_fakegem_install
	insinto /usr/share/jieba_rb/dict
	doins ext/cppjieba/dict/*.utf8
}
