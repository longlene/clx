# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Fast Rails 3+ templating system with JSON, XML and PList support"
HOMEPAGE="https://github.com/ccocchi/rabl-rails"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.1"
ruby_add_rdepend ">=dev-ruby/railties-3.1"
ruby_add_rdepend ">=dev-ruby/actionpack-3.1"
ruby_add_rdepend ">=dev-ruby/rspec-mocks-3.0.0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
