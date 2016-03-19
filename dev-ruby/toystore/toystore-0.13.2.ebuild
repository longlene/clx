# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An object mapper for anything that can read, write and delete data"
HOMEPAGE="http://jnunemaker.github.com/toystore/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/adapter-0.7.0"
ruby_add_rdepend ">=dev-ruby/activemodel-3.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/simple_uuid-0.2"

