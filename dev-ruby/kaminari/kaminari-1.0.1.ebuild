# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Kaminari is a Scope & Engine based, clean, powerful, agnostic, customizable and sophisticated paginator for Rails 4+"
HOMEPAGE="https://github.com/kaminari/kaminari"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-4.1.0"
ruby_add_rdepend "=dev-ruby/kaminari-core-1.0.1"
ruby_add_rdepend "=dev-ruby/kaminari-actionview-1.0.1"
ruby_add_rdepend "=dev-ruby/kaminari-activerecord-1.0.1"
ruby_add_rdepend ">=dev-ruby/test-unit-rails-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rr-0"
ruby_add_rdepend ">=dev-ruby/capybara-1.0"

