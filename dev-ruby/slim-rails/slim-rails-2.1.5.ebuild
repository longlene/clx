# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides the generator settings required for Rails 3 and 4 to use Slim"
HOMEPAGE="https://github.com/slim-template/slim-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0.9"
ruby_add_rdepend ">=dev-ruby/rocco-0.8"
ruby_add_rdepend ">=dev-ruby/redcarpet-1.0"
ruby_add_rdepend ">=dev-ruby/awesome_print-1.0"
ruby_add_rdepend ">=dev-ruby/guard-0.10"
ruby_add_rdepend ">=dev-ruby/guard-minitest-0.4"
ruby_add_rdepend ">=dev-ruby/guard-rocco-0.0.3"
ruby_add_rdepend ">=dev-ruby/activesupport-4.0.0"
ruby_add_rdepend ">=dev-ruby/actionpack-3.0"
ruby_add_rdepend ">=dev-ruby/railties-3.0"
ruby_add_rdepend ">=dev-ruby/slim-2.0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
