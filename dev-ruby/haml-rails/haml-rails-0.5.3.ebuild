# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Haml-rails provides Haml generators for Rails 3"
HOMEPAGE="http://github.com/indirect/haml-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/actionpack-4.0.1"
ruby_add_rdepend ">=dev-ruby/activesupport-4.0.1"
ruby_add_rdepend ">=dev-ruby/haml-3.1"
ruby_add_rdepend ">=dev-ruby/railties-4.0.1"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
