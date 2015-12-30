# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

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
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-3.0.0"
ruby_add_rdepend ">=dev-ruby/factory_girl-4.4.0"
ruby_add_rdepend ">=dev-ruby/appraisal-0.5.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.11.0"
ruby_add_rdepend ">=dev-ruby/cucumber-1.2.1"
ruby_add_rdepend ">=dev-ruby/aruba-0.5.1"

