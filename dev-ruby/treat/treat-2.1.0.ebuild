# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION=" Treat is a natural language processing framework for Ruby. "
HOMEPAGE="https://github.com/louismullie/treat"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/birch-0"
ruby_add_rdepend ">=dev-ruby/schiphol-0"
ruby_add_rdepend ">=dev-ruby/yomu-0"

