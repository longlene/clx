# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="http://sneaq.net/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hpricot-0.6.164"
ruby_add_rdepend ">=dev-ruby/tzinfo-0.3.12"
ruby_add_rdepend ">=dev-ruby/builder-2.1.2"
ruby_add_rdepend ">=dev-ruby/activesupport-2.0"
ruby_add_rdepend ">=dev-ruby/json-1.1.7"

