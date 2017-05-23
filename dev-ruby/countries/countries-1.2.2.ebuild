# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="All sorts of useful information about every country packaged as pretty little country objects"
HOMEPAGE="http://github.com/hexorx/countries"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/i18n_data-0.7.0"
ruby_add_rdepend ">=dev-ruby/currencies-0.4.2"
ruby_add_rdepend ">=dev-ruby/rspec-3"
ruby_add_rdepend ">=dev-ruby/actionview-3"
ruby_add_rdepend ">=dev-ruby/yard-0"

