# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This gem is an Adhearsion plugin that handles the Rails related stuff"
HOMEPAGE="https://github.com/adhearsion/adhearsion-rails"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/adhearsion-2.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0.10"
ruby_add_rdepend ">=dev-ruby/i18n-0.5.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.7.0"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"

