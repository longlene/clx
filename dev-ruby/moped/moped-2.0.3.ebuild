# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A MongoDB driver for Ruby"
HOMEPAGE="http://mongoid.org/en/moped"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bson-2.2"
ruby_add_rdepend ">=dev-ruby/connection_pool-2.0"
ruby_add_rdepend ">=dev-ruby/optionable-0.2.0"

