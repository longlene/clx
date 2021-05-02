# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="General ruby templating with json, bson, xml and msgpack support"
HOMEPAGE="https://github.com/nesquena/rabl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-2.3.14"
ruby_add_rdepend ">=dev-ruby/riot-0.12.3"
ruby_add_rdepend ">=dev-ruby/rr-1.0.2"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/tilt-0"
ruby_add_rdepend ">=dev-ruby/oj-0"
ruby_add_rdepend ">=dev-ruby/msgpack-0.4.5"
ruby_add_rdepend ">=dev-ruby/bson-1.7.0"
ruby_add_rdepend ">=dev-ruby/plist-0"

