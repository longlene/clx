# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Redis session store for ActionPack"
HOMEPAGE="http://redis-store.org/redis-actionpack"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redis-store-1.1.0"
ruby_add_rdepend ">=dev-ruby/redis-rack-1.5.0"
ruby_add_rdepend ">=dev-ruby/actionpack-4"
ruby_add_rdepend ">=dev-ruby/rake-10"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/mocha-0.14.0"
ruby_add_rdepend ">=dev-ruby/minitest-4.2"
ruby_add_rdepend ">=dev-ruby/tzinfo-0"
ruby_add_rdepend ">=dev-ruby/mini_specunit-0"
ruby_add_rdepend ">=dev-ruby/mini_backtrace-0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
