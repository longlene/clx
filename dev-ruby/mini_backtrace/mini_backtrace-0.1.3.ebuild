# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="MiniBacktrace allows you to take advantage of the Rails"
HOMEPAGE="http://github.com/metaskills/mini_backtrace"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">dev-ruby/minitest-1.2.0"
ruby_add_rdepend ">=dev-ruby/rails-2.3.3"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
