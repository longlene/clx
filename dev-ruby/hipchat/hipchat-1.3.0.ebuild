# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.textile"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby library to interact with HipChat"
HOMEPAGE="https://github.com/hipchat/hipchat-rb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/httparty-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.0"
ruby_add_rdepend ">=dev-ruby/rr-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/webmock-0"
ruby_add_rdepend ">dev-ruby/rdoc-2.4.2"
ruby_add_rdepend ">=dev-ruby/coveralls-0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
