# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="factory_girl_rails provides integration between
    factory_girl and rails 3 (currently just automatic factory definition
    loading)"
HOMEPAGE="http://github.com/thoughtbot/factory_girl_rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-3.0.0"
ruby_add_rdepend ">=dev-ruby/factory_girl-4.7.0"

