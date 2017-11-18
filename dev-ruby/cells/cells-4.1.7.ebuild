# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="View Models for Ruby and Rails, replacing helpers and partials while giving you a clean view architecture with proper encapsulation"
HOMEPAGE="https://github.com/apotonick/cells"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend "<dev-ruby/uber-0.2.0"
ruby_add_rdepend "<dev-ruby/declarative-option-0.2.0"
ruby_add_rdepend "<dev-ruby/declarative-builder-0.2.0"
ruby_add_rdepend ">=dev-ruby/tilt-1.4"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/cells-erb-0.0.4"

