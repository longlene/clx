# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Includes various helper tools for Cuba"
HOMEPAGE="http://github.com/cyx/cuba-contrib"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cuba-3.1"
ruby_add_rdepend ">=dev-ruby/cutest-0"
ruby_add_rdepend ">=dev-ruby/mote-1.0"

